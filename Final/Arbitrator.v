module Arbitrator(input iClk,
						input iRst_n,
						
						// Select Input
						input [2:0] iSelect,
						
						input [15:0] iX_Cont,
						input [15:0] iY_Cont,
						input iValid,
						
						// RGB Inputs
						input [11:0] iRGB_R,
						input [11:0] iRGB_G,
						input [11:0] iRGB_B,
						
						// GRAY Inputs
						input [7:0] iGray,
						
						// Histogram Inputs
						input [7:0] iHist,
						input [7:0] iThresholdLevel,
						
						// Threshold Input
						input [7:0] iThresh,
						
						input [7:0] iCumHist,
						
						// Outputs
						output [15:0] oWr1_data,
						output [15:0] oWr2_data						
);

// Output Registers
reg [11:0] disp_R, disp_G, disp_B;

// TOUCH TCON DATA LOCATION
// RED      =  Wr1_DATA[9:2]
// GREEN    = {Wr1_DATA[14:10], Wr2_DATA[14:12]}
// BLUE     =  Wr2_DATA[9:2]
// Wr1_DATA = 0GGG GGRR RRRR RR00
// Wr2_DATA = 0GGG 00BB BBBB BB00

assign oWr1_data = {disp_G[11:7], disp_B[11:2]};
assign oWr2_data = {disp_G[6:2], disp_R[11:2]};

always @(posedge iClk)
begin
	if (!iRst_n)
	begin
		// General Reset
		disp_R	  <= 0;
		disp_G	  <= 0;
		disp_B	  <= 0;
	end else begin	
		
		case (iSelect)
		1: begin // RGB Select
				if (iValid) begin
					disp_R 	  <= iRGB_R;
					disp_G 	  <= iRGB_G;
					disp_B 	  <= iRGB_B;
				end else begin
					disp_R	  <= 0;
					disp_G	  <= 0;
					disp_B	  <= 0;
				end
			end
		2: begin // GRAY Select
				if (iValid)
				begin
					disp_R 	  <= iGray << 4;
					disp_G 	  <= iGray << 4;
					disp_B 	  <= iGray << 4;
				end else begin
					disp_R 	  <= 0;
					disp_G 	  <= 0;
					disp_B 	  <= 0;
				end
			end
		3: begin // Histogram Select
				if (iValid)
				begin
					if ((255 - iY_Cont) == iThresholdLevel) begin
						disp_R <= -1;
						disp_G <= 0;
						disp_B <= 0;
					end else begin
						disp_R     <= iHist << 4;
						disp_G 	  <= iHist << 4;
						disp_B	  <= iHist << 4;
					end
				end else begin
					disp_R 	  <= 0;
					disp_G	  <= 0;
					disp_B 	  <= 0;
				end
			end
		4: begin // Threshold select
				if (iValid)
				begin
					disp_R 	  <= iThresh << 4;
					disp_G 	  <= iThresh << 4;
					disp_B 	  <= iThresh << 4;
				end else begin
					disp_R     <= 0;
					disp_G	  <= 0;
					disp_B     <= 0;
				end
			end
		5: begin // Display cumulative histogram
				if (iValid)
				begin
					disp_R     <= iCumHist << 4;
					disp_G 	  <= iCumHist << 4;
					disp_B	  <= iCumHist << 4;
				end else begin
					disp_R 	  <= 0;
					disp_G	  <= 0;
					disp_B 	  <= 0;
				end
			end
		default: begin
				disp_R 		  <= -1;
				disp_G		  <= -1;
				disp_B		  <= -1;
			end
		endcase
	end
end

endmodule		
		