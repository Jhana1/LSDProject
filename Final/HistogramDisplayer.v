module HistogramDisplayer(
	input iClk,
	input iValid,
	input [15:0] X_Cont,
	input [15:0] Y_Cont,
	input [19:0] iHistoValue,
	output [7:0] oHistoAddr,
	output reg [7:0] oPixel,
	output reg oValid);

/* Pull in the histogram value based on Y_Cont from the RAM */
assign oHistoAddr = (383 - Y_Cont);

reg rValid;
wire yval = (383 - Y_Cont) == 255;

always @(posedge iClk) begin
	if ((800 - X_Cont) < (iHistoValue>>8) && (383 - Y_Cont) < 255) begin
		oPixel <= (yval) ? 127 : 255;
	end else begin
		oPixel <= 0;
	end
end

always @(posedge iClk) begin
	rValid <= iValid;
	oValid <= rValid;
end
endmodule
