// This is not working as expected. If same variable is used it increments over 2 cycles instead of over 1.
module Histogram
(
    input iClk,
    input iRst_n,
    input iClearRam,
    input [7:0] iGray,
    input iValid,
    
    // RAM I/O
    output [7:0] oReadAddr, 
    output reg [7:0] oWriteAddr,
    output reg oWriteEnable,
    output reg [19:0] oDataOut,
	 
	 output reg [7:0] oGray,
	 output [19:0] oGrayHisto
);

reg ValidD1;
reg [7:0] oWriteAddrD1;
wire [19:0] iDataIn;
reg [7:0] rGray;

assign oReadAddr = iGray;

always @(posedge iClk) begin
	 oGray <= rGray;
	 rGray <= iGray;
    if (!iRst_n) begin
        oWriteAddr <= 8'b0;
        oWriteAddrD1 <= 8'b0;
        oWriteEnable <= 1'b0;
        oDataOut <= 20'b0;
        ValidD1 <= 1'b0;
    end else begin
        if (iClearRam) begin
            oWriteAddr <= oWriteAddr + 1'b1;
            oWriteEnable <= 1'b1;
            oDataOut <= 20'b0;
        end begin 
            // Cycle 1. - Ask the RAM for data
            ValidD1 <= iValid;
            oWriteAddrD1 <= oReadAddr;
            // Cycle 2. - Place the incremented data on the bus, with correct address
            oWriteAddr <= oWriteAddrD1;
            if (oWriteAddr == oReadAddr) begin
                oDataOut <= oDataOut + 1'b1;
            end else begin
                oDataOut <= iDataIn + 1'b1;
            end
            oWriteEnable <= ValidD1;
       end 
    end
end

Fake_Dual_Port_Ram FUCKING_FAKE (
	.read_addr_a(oReadAddr), 
	.read_addr_b(iGray),
   .write_addr(oWriteAddr),
   .we(oWriteEnable),
	.data(oDataOut),
   .q_a(iDataIn),
	.q_b(oGrayHisto)
);

endmodule
