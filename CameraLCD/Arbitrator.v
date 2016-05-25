module Arbitrator(
    input iClk,
    input iRst_n,
    input iFval,

    // Select Input
    input [17:0] iSelect,
    
    input [15:0] iX_Cont,
    input [15:0] iY_Cont,
    //input iValid,
    
    // RGB Inputs
    input [11:0] iRGB_R,
    input [11:0] iRGB_G,
    input [11:0] iRGB_B,
    input iRGB_Valid,
    
    // GRAY Inputs
    input [7:0] iGray,
    input iGray_Valid,
    
    // Histogram Inputs
    input [7:0] iHist,
    input [7:0] iThresholdLevel,
    input iHist_Valid,
    input iHist_Red,
    
    // Threshold Input
    input [7:0] iThresh,
    input iThresh_Valid,
	 
	 // Threshold Delayed Frame
	 input [7:0] iThresh_d,
	 input iThresh_Valid_d,
    
	 // Multithresh Input
	 input [7:0] iMultiThresh,
	 input iMultiThreshValid,
	 
    // Cumulative Histogram Inputs
    input [7:0] iCumHist,
    input iCumHistRed,

    // Outputs
    output [15:0] oWr1_data,
    output [15:0] oWr2_data,                        
    
    output reg oWr_data_valid
    );

// Output Registers
reg [11:0] disp_R, disp_G, disp_B;
reg [10:0] rSelect;
reg rFval;
reg [7:0] fValCount;

// Delayed gray register
reg [7:0] dGray;

// TOUCH TCON DATA LOCATION
// RED      =  Wr1_DATA[9:2]
// GREEN    = {Wr1_DATA[14:10], Wr2_DATA[14:12]}
// BLUE     =  Wr2_DATA[9:2]
// Wr1_DATA = 0GGG GGBB BBBB BB00
// Wr2_DATA = 0GGG 00RR RRRR RR00

//assign oWr1_data = {disp_G[11:7],       disp_B[11:2]};
//assign oWr2_data = {disp_G[6:4], 2'd00, disp_R[11:2]};

//assign oWr1_data = {1'b1, disp_G[11:7],       disp_B[11:4], 2'b11};
//assign oWr2_data = {1'b1, disp_G[6:4],  2'b1, disp_R[11:4], 2'b11};

assign oWr1_data = {dGray[7], disp_G[11:7],             disp_B[11:4], dGray[6:5]};
assign oWr2_data = {dGray[4], disp_G[6:4],  dGray[3:2], disp_R[11:4], dGray[1:0]};

GGGGG
xx
always @(posedge iClk)
begin
    rSelect <= (fValCount == 50) ? iSelect : rSelect;
    rFval = iFval;
    if (!iRst_n)
    begin
        // General Reset
        disp_R    <= 0;
        disp_G    <= 0;
        disp_B    <= 0;
    end else begin  

        case (rSelect)
        10'd2: begin // RGB Select
            if (iRGB_Valid) begin
                disp_R    <= iRGB_R;
                disp_G    <= iRGB_G;
                disp_B    <= iRGB_B;
                oWr_data_valid <= 1;
            end else begin
                disp_R    <= 0;
                disp_G    <= 0;
                disp_B    <= 0;
                oWr_data_valid <= 0;
            end
        end
        10'd4: begin // GRAY Select
            if (iGray_Valid)
            begin
                disp_R    <= iGray << 4;
                disp_G    <= iGray << 4;
                disp_B    <= iGray << 4;
                oWr_data_valid <= 1;
            end else begin
                disp_R    <= 0;
                disp_G    <= 0;
                disp_B    <= 0;
                oWr_data_valid <= 0;
            end
        end
        10'd8: begin // Histogram Select
            if (iHist_Valid)
            begin
                if (iHist_Red) begin
                    disp_R  <= 255 << 4;
                    disp_G  <= 0;
                    disp_B  <= 0;
                end else begin
                    disp_R    <= iHist << 4;
                    disp_G    <= iHist << 4;
                    disp_B    <= iHist << 4;
                end
                oWr_data_valid <= 1;
            end else begin
                disp_R    <= 0;
                disp_G    <= 0;
                disp_B    <= 0;
                oWr_data_valid <= 0;
            end
        end
        10'd16: begin // Display cumulative histogram
            if (iHist_Valid)
            begin
                if (iCumHistRed) begin
                    disp_R    <= 255 << 4;
                    disp_G    <= 0;
                    disp_B    <= 0;
                end else begin
                    disp_R    <= iCumHist << 4;
                    disp_G    <= iCumHist << 4;
                    disp_B    <= iCumHist << 4;
                end
                oWr_data_valid <= 1;
            end else begin
                disp_R    <= 0;
                disp_G    <= 0;
                disp_B    <= 0;
                oWr_data_valid <= 0;
            end
        end
		  10'd32: begin // Threshold select - Wrong Frame
            if (iThresh_Valid)
            begin
                disp_R    <= iThresh << 4;
                disp_G    <= iThresh << 4;
                disp_B    <= iThresh << 4;
                oWr_data_valid <= 1;
            end else begin
                disp_R     <= 0;
                disp_G    <= 0;
                disp_B     <= 0;
                oWr_data_valid <= 0;
            end
        end
		  10'd64: begin // Threshold Select - Correct Frame
				if (iGray_Valid)
				begin
					disp_R <= 0;
					disp_G <= 0;
					disp_B <= -1;
					oWr_data_valid <= 1;
				end else begin
					disp_R <= 0;
					disp_G <= 0;
					disp_B <= 0;
					oWr_data_valid <= 0;
				end
				dGray <= iGray;
			end
		  10'd128: begin // Not Smooth MultiThresh
		  if (iMultiThreshValid)
            begin
                disp_R    <= iMultiThresh << 4;
                disp_G    <= iMultiThresh << 4;
                disp_B    <= iMultiThresh << 4;
                oWr_data_valid <= 1;
            end else begin
                disp_R     <= 0;
                disp_G    <= 0;
                disp_B     <= 0;
                oWr_data_valid <= 0;
            end
        end
		  10'd256: begin // Smooth Multithresh
		  if (iMultiThreshValid)
            begin
                disp_R    <= iMultiThresh << 4;
                disp_G    <= iMultiThresh << 4;
                disp_B    <= iMultiThresh << 4;
                oWr_data_valid <= 1;
            end else begin
                disp_R     <= 0;
                disp_G    <= 0;
                disp_B     <= 0;
                oWr_data_valid <= 0;
            end
        end
        default: begin
            disp_R        <= 255 << 4;
            disp_G        <= 0;
            disp_B        <= 0;
            oWr_data_valid <= iRGB_Valid;
        end
    endcase
end
end

always @(posedge iClk)
begin
    if (rFval)
        fValCount <= 0;
    else
        fValCount <= fValCount + 1;
end

endmodule       
