module CumHistogramRam (input iClk, 
							input [7:0] iReadAddress, 
							output reg [19:0] oQ);
	

reg [7:0] read_addr;
reg [7:0] counter;

always @(posedge iClk) begin

	read_addr <= iReadAddress;
	oQ <= read_addr;
end

endmodule