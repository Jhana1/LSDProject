module MultiThresh (
	input iClk, 
	input [7:0] iGray,
	input iValid,
	input [7:0] iThresh1,
	input [7:0] iThresh2,
	input [15:0] iX_Cont,
	input [15:0] iY_Cont,
	input iSmooth,
	output reg [7:0] oPixel,
	output reg oValid
	);

reg[7:0] delta;
reg[7:0] thresh;
reg[31:0] s_thresh;

reg [31:0] s_step;


always @(posedge iClk) begin
	if (iY_Cont == 0 && iX_Cont == 0) begin
		s_thresh <= 0;
	end
	if (!iSmooth) begin
		if (iY_Cont < 240) begin
			// High Thresh
			if (iGray < iThresh2) begin
				oPixel <= 0;
			end else begin
				oPixel <= 255;
			end
		end else begin
			if (iGray < iThresh1) begin
				oPixel <= 0;
			end else begin
				oPixel <= 255;
			end
		end
	end 
	else begin // SYNTH MADNESS
		 
		 if (iY_Cont <= (240 - 128) && iY_Cont >= 0) begin
			  thresh <= iThresh2;
			  s_thresh <= iThresh2 << 24;
		 end else if (iY_Cont >= (240 + 128) && iY_Cont <= 490) begin
			  thresh <= iThresh1;
		 end else begin
			  if (iX_Cont == 799) begin
					s_thresh <= s_thresh - s_step;
			  end else begin
					s_thresh <= s_thresh;
			  end
			  thresh <= s_thresh >> 24;
		 end
		 oPixel <= (iGray < thresh) ? 0 : 255;
	end
end

always @(posedge iClk) begin
	s_step = delta << 16;
	oValid <= iValid;
	delta <= (iThresh2 - iThresh1);
end
endmodule
