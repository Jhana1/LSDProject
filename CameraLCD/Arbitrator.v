module Arbitrator(input iClk,
						input iRst_n,
						
						// Select Input
						input [2:0] iSelect,
						
						// RGB Inputs
						input iRGB_valid,
						input [11:0] iRGB_R,
						input [11:0] iRGB_G,
						input [11:0] iRGB_B,
						
						// GRAY Inputs
						input iGray_valid,
						input [7:0] iGray,
						
						// Histogram Inputs
						input iHist_valid,
						input [7:0] iHist,
						
						// Threshold Input
						input iThresh_valid,
						input [7:0] iThresh,
						
						// Outputs
						output reg oWr1_valid,
						output reg oWr2_valid,
						output [15:0] oWr1_data,
						output [15:0] oWr2_data						
);

// Input Delay Registers
// RGB
reg rRGB_valid;
reg [11:0] rRGB_R, rRGB_G, rRGB_B;

// GRAY
reg rGray_valid;
reg [7:0] rGray;

// Histogram
reg rHist_valid;
reg [7:0] rHist;

// Threshold
reg rThresh_valid;
reg [7:0] rThresh;

// Select
reg [2:0] rSelect;

// Output Registers
reg [11:0] disp_R, disp_G, disp_B;

// TOUCH TCON DATA LOCATION
// RED      =  Wr1_DATA[9:2]
// GREEN    = {Wr1_DATA[14:10], Wr2_DATA[14:12]}
// BLUE     =  Wr2_DATA[9:2]
// Wr1_DATA = 0GGG GGRR RRRR RR00
// Wr2_DATA = 0GGG 00BB BBBB BB00
//assign oWr1_data = {1'd0, disp_G[7:3], 		disp_R, 2'd0};
//assign oWr2_data = {1'd0, disp_G[2:0], 2'd0, disp_B, 2'd0};

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
		oWr1_valid <= 0;
		oWr2_valid <= 0;
		
		// RGB Reset
		rRGB_R     <= 0;
		rRGB_G 	  <= 0;
		rRGB_B 	  <= 0;
		rRGB_valid <= 0;
		
		// Gray Reset
		rGray      	<= 0;
		rGray_valid <= 0;
		
		// Hist Reset
		rHist 		<= 0;
		rHist_valid <= 0;
		
		// Thresh Reset
		rThresh       <= 0;
		rThresh_valid <= 0;
		
		// Select Reset
		rSelect  	  <= 0;
	end else begin	
		
		// Pipeline Inputs
		rRGB_R 	  <= iRGB_R;
		rRGB_G 	  <= iRGB_G;
		rRGB_B 	  <= iRGB_B;
		rRGB_valid <= iRGB_valid;
		
		rGray 	   <= iGray;
		rGray_valid <= iGray_valid;
		
		rHist       <= iHist;
		rHist_valid <= iHist_valid;
		
		rThresh 	     <= iThresh;
		rThresh_valid <= iThresh_valid;
		
		rSelect 		<= iSelect;
		
		case (rSelect)
		1: begin // RGB Select
				if (rRGB_valid)
				begin
					disp_R 	  <= rRGB_R;
					disp_G 	  <= rRGB_G;
					disp_B 	  <= rRGB_B;
					oWr1_valid <= 1;
					oWr2_valid <= 1;
				end else begin
					disp_R	  <= 0;
					disp_G	  <= 0;
					disp_B	  <= 0;
					oWr1_valid <= 0;
					oWr2_valid <= 0;
				end
			end
		2: begin // GRAY Select
				if (rGray_valid)
				begin
					disp_R 	  <= rGray << 4;
					disp_G 	  <= rGray << 4;
					disp_B 	  <= rGray << 4;
					oWr1_valid <= 1;
					oWr2_valid <= 1;
				end else begin
					disp_R 	  <= 0;
					disp_G 	  <= 0;
					disp_B 	  <= 0;
					oWr1_valid <= 0;
					oWr2_valid <= 0;
				end
			end
		3: begin // Histogram Select
				if (rHist_valid)
				begin
					disp_R     <= rHist << 4;
					disp_G 	  <= rHist << 4;
					disp_B	  <= rHist << 4;
					oWr1_valid <= 1;
					oWr2_valid <= 1;
				end else begin
					disp_R 	  <= 0;
					disp_G	  <= 0;
					disp_B 	  <= 0;
					oWr1_valid <= 0;
					oWr2_valid <= 0;
				end
			end
		4: begin //
				if (rThresh_valid)
				begin
					disp_R 	  <= rThresh << 4;
					disp_G 	  <= rThresh << 4;
					disp_B 	  <= rThresh << 4;
					oWr1_valid <= 1;
					oWr2_valid <= 1;
				end else begin
					disp_R     <= 0;
					disp_G	  <= 0;
					disp_B     <= 0;
					oWr1_valid <= 0;
					oWr2_valid <= 0;
				end
			end
		default: begin
				disp_R 		  <= 255 << 4;
				disp_G		  <= 0;
				disp_B		  <= 0;
				oWr1_valid 	  <= 1;
				oWr2_valid 	  <= 1;
			end
		endcase
	end
end

endmodule		
		