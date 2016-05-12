module HistogramDisplayer(
	input iClk,
	input iRst_n,
	input [15:0] X_Cont,
	input [15:0] Y_Cont,
	input [19:0] iHistoValue,
	output [7:0] oHistoAddr,
	output reg [7:0] oPixel);

/* Pull in the histogram value based on Y_Cont from the RAM */
assign oHistoAddr = Y_Cont;

always @(posedge iClk) begin
	if (X_Cont < iHistoValue) begin
		oPixel <= -1;
	end else begin
		oPixel <= 0;
	end
end

endmodule
