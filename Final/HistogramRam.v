module HistogramRam (input iClk, 
							input [7:0] iReadAddress, 
							output reg [19:0] oQ);
	
reg [7:0] read_addr;

always @(posedge iClk) begin
	read_addr <= iReadAddress;
	oQ <= read_addr * 3;
end

endmodule