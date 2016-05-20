module Thresholder (
	input iClk, 
	input [7:0] iGray,
	input iValid,
	input [7:0] iThreshold, 
	output reg [7:0] oPixel,
	output reg oValid);
	
always @(posedge iClk) begin
	if (iGray < iThreshold) begin
		oPixel <= 0;
	end else begin
		oPixel <= 255;
	end
end

always @(posedge iClk) begin
	oValid <= iValid;
end
endmodule
