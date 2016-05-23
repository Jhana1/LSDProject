module Total_Module
  (
    // General
    input CCD_PIXCLK,
    input iRst_n,

    // Frame Related
    input [15:0] iX_Cont,
    input [15:0] iY_Cont,
    input iFval,

    // RGB
    input [11:0] iCCD_R,
    input [11:0] iCCD_G,
    input [11:0] iCCD_B,
    input iCCD_DVAL,

    // Display
    input [3:0] iDisplaySelect,

    // Output
    output [15:0] wr1_data,
    output [15:0] wr2_data,
    output WR_DATA_VAL
  );
  /*************************************************************
 * OUR STUFF **************
 *****************************/

  // Registers and Wires				
  wire GRAY_VAL;
  wire [7:0] GRAY_DATA;
  wire [15:0] gX_Cont, gY_Cont;
  wire [19:0] maxDisplayVal;
  reg Rst_nR;

  /* Histogram Ram and displayer */
  wire [19:0] display_hist_q;
  wire [7:0] display_hist_rda;
  wire [7:0] histo_pixel;
  wire histo_disp_red;

  /* Cumulative Histogram Ram and displayer */
  wire [7:0] display_cumh_rda;
  wire [19:0] display_cumh_q;
  wire [7:0] cumh_pixel;
  wire [7:0] thresh_pixel;
  wire [7:0] cumulative_histo_threshold;
  wire hist_val;
  wire thresh_val;
  wire cumh_disp_red;
  
  
  wire iClk = CCD_PIXCLK;
  
  always @(posedge iClk)
  begin
    Rst_nR <= iRst_n;
  end
  
  // Module Instantiations
  RGB2GRAY r2g (
    .iCLK(iClk),
    .iReset_n(Rst_nR),
    .iRed(iCCD_R),
    .iGreen(iCCD_G),
    .iBlue(iCCD_B),
    .iDval(iCCD_DVAL),
    .iX_Cont(iX_Cont),
    .iY_Cont(iY_Cont),
    .oX_Cont(gX_Cont),
    .oY_Cont(gY_Cont),
    .oGray(GRAY_DATA),
    .oDval(GRAY_VAL)				
  );

  Total_Histogram T1
  (
    .iClk(iClk),
    .iRst_n(Rst_nR),
    .iGray(GRAY_DATA),
    .iGrayValid(GRAY_VAL),
    .iFvalid(iFval),
    .iX_Cont(gX_Cont),
    .iY_Cont(gY_Cont),
    .iReadGray(display_hist_rda),
    .oGray(),
    .oGrayHisto(display_hist_q),
    .oMaxValue(maxDisplayVal),
    .oGrayCumHisto(display_cumh_q),
    
    .oThresh(cumulative_histo_threshold),
    .oDone()
  );					

  HistogramDisplayer histo_display
  (
    .iClk(iClk),
    .iValid(iCCD_DVAL),
    .X_Cont(iX_Cont),
    .Y_Cont(iY_Cont),
    .iHistoValue(display_hist_q),
    .iMaxValue(maxDisplayVal),
    .iThreshPoint(cumulative_histo_threshold),
    .oHistoAddr(display_hist_rda),
    .oPixel(histo_pixel),
    .oRed(histo_disp_red),
    .oValid(hist_val)
  );

  HistogramDisplayer cumh_display
  (
    .iClk(iClk),
    .X_Cont(iX_Cont),
    .Y_Cont(iY_Cont),
    .iHistoValue(display_cumh_q),
    .iMaxValue(20'd384000),
    
    .iThreshPoint(cumulative_histo_threshold),
    .oRed(cumh_disp_red),
    .oPixel(cumh_pixel)
  );

  Thresholder thresher 
  (
    .iClk(iClk), 
    .iGray(GRAY_DATA),
    .iValid(GRAY_VAL), 
    .iThreshold(cumulative_histo_threshold), 
    .oValid(thresh_val),
    .oPixel(thresh_pixel)
  );

  Arbitrator arbiter
  (
    .iClk(iClk),
    .iRst_n(Rst_nR),
    // Select Input
    .iSelect(iDisplaySelect),
    .iFval(iFval), // ?????????

    // Coordinates
    .iX_Cont(iX_Cont),
    .iY_Cont(iY_Cont),

    // RGB Inputs
    .iRGB_R(iCCD_R),
    .iRGB_G(iCCD_G),
    .iRGB_B(iCCD_B),
    .iRGB_Valid(iCCD_DVAL),

    // GRAY Inputs
    .iGray(GRAY_DATA),
    .iGray_Valid(GRAY_VAL),

    // Histogram Inputs
    .iHist(histo_pixel),
    .iThresholdLevel(cumulative_histo_threshold),
    .iHist_Valid(hist_val),
    .iHist_Red(histo_disp_red),

    // CUmulative inputs
    .iCumHist(cumh_pixel),
    .iCumHistRed(cumh_disp_red),

    // Threshold Input
    .iThresh(thresh_pixel),
    .iThresh_Valid(thresh_val),

    // Outputs
    .oWr1_data(wr1_data),
    .oWr2_data(wr2_data),
    .oWr_data_valid(WR_DATA_VAL)
  );

endmodule
