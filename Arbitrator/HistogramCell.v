module HistogramCell(
    input iClk, 
    input iRst_n,
    input iClearRam,
    input [7:0] iGray, 
    input iValid,
    output [17:0] oQ
    );

reg [7:0] GrayD1;

reg [7:0] WriteAddr;
reg ValidD1, WE;
reg [17:0] DataOut;

wire [17:0] Q;

assign oQ = Q;

always @(posedge iClk)
begin

    if (!iRst_n) begin
        ValidD1   <= 0;
        GrayD1    <= 0;
        WriteAddr <= 0;
        DataOut   <= 0;
        WE 		   <= 0;
    end else begin
        if (iClearRam) begin
            DataOut   <= 18'b0;
            WE 	    <= 1'b1;
            WriteAddr <= WriteAddr + 1'b1;
        end else begin
            /* Step 1. Load */
            ValidD1   <= iValid;
            GrayD1    <= iGray;
            
            /* Step 2. Read data */
            WriteAddr <= GrayD1;
            DataOut   <= Q + 1'b1;
            WE        <= ValidD1;
            
        end
    end
end

wire [17:0] Qb;

MegaRam ram (
    .address_a(iGray),
    .address_b(WriteAddr),
    .clock_a(iClk),
    .clock_b(iClk),
    .data_a(18'b0),
    .data_b(DataOut),
    .wren_a(0),
    .wren_b(WE),
    .q_a(Q),
    .q_b(Qb)
    );

endmodule