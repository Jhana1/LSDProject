module Thresholder (
	input iClk, 
	input [7:0] iGray, 
	input [7:0] iThreshold, 
	output reg [7:0] oPixel);
	
always @(posedge iClk) begin
	if (iGray < iThreshold) begin
		oPixel <= 0;
	end else begin
		oPixel <= 255;
	end
end

endmodule
