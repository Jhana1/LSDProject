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
	
wire[7+20:0] synth_step, synth_delta;
wire[7+20:0] thresh;

assign synth_delta = delta << 20;
assign synth_step = synth_delta >> 7;
assign thresh = synth_thresh >> 20;

reg[7:0] delta;
reg[20+7:0] synth_thresh;

always @(posedge iClk) begin
	if (iY_Cont == 0 && iX_Cont == 0) begin
		synth_thresh <= 0;
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
	end else begin // SYNTH MADNESS
		if ((iY_Cont > (240 - 64)) && (iY_Cont < (240 + 64))) begin
			if (iX_Cont == 0) begin
				if (thresh > iThresh1) begin
					synth_thresh <= synth_thresh - synth_step;
				end else begin
					synth_thresh <= synth_thresh;
				end
			end
		end else if (iY_Cont <= (240 - 64)) begin
			synth_thresh <= iThresh2 << 20;
		end else begin
			synth_thresh <= iThresh1 << 20;
		end
		
		if (iGray < thresh) begin
			oPixel <= 0;
		end else begin
			oPixel <= 255;
		end
	end
end

always @(posedge iClk) begin
	oValid <= iValid;
	delta <= (iThresh2 - iThresh1);
end
endmodule
