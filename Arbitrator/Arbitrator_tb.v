`timescale 1ns/100ps

module Arbitrator_tb;

wire d1V, d2V;
wire [15:0] d1, d2;

reg clk, rst, rgbV, grayV;
reg [7:0] rgbR, rgbB, rgbG, gray;
reg [2:0] sel;

always
	#1 clk = !clk;

initial begin
	clk = 0;
	rst = 0;
	rgbV = 0;
	grayV = 0;
	sel = 0;
	#4
	sel = 1;
	rst = 1;
	rgbV = 1;
	rgbR = 255;
	rgbB = 255;
	rgbG = 255;
	#2
	rgbV = 0;
	rgbR = 100;
	#2
	rgbV = 1;
	#2
	sel = 2;
	grayV = 1;
	gray = 0;
	#200
	grayV = 0;
	$stop;
end

Arbitrator a1(.iClk(clk),
				  .iRst_n(rst),
						
						// Select Input
				  .iSelect(sel),
						
						// RGB Inputs
				  .iRGB_valid(rgbV),
				  .iRGB_R(rgbR),
				  .iRGB_G(rgbG),
				  .iRGB_B(rgbB),
						
						// GRAY Inputs
				  .iGray_valid(grayV),
				  .iGray(gray),
						
						// Outputs
				  .oWr1_valid(d1V),
				  .oWr2_valid(d2V),
				  .oWr1_data(d1),
				  .oWr2_data(d2)
);


endmodule
