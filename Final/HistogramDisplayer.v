module HistogramDisplayer(
	input iClk,
	input [15:0] X_Cont,
	input [15:0] Y_Cont,
	input [19:0] iHistoValue,
	output [7:0] oHistoAddr,
	output reg [7:0] oPixel);

/* Pull in the histogram value based on Y_Cont from the RAM */
assign oHistoAddr = (255 - Y_Cont);

always @(posedge iClk) begin
	if ((800 - X_Cont) < (iHistoValue>>8) && (255 - Y_Cont) < 255) begin
		oPixel <= 255;
	end else begin
		oPixel <= 0;
	end
end

endmodule
