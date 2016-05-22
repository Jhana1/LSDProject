`timescale 1ns / 100ps 

/* Arbitrator Testbench 
 * 
 * The purpose of this module is to ensure that the arbitrator works functionally
 * as expected. The arbitrator is essentially just a multiplexer that changes the
 * pixel output based on the switch settings. This testbench verifies that that 
 * is what it does. 
 */



`define assert(NAME, SIGNAL, VALUE) \
        if (SIGNAL !== VALUE) begin \
            $display("ASSERTION FAILED in %m: %s != %d", NAME, VALUE); \
            assert_failed = 1; \
        end

module Arbitrator_Testbench;

reg assert_failed;

reg clk, rst;
reg fval;

reg [2:0] select;

reg [15:0] X_Cont, Y_Cont;
reg [11:0] R, G, B;
reg RGB_Valid;
reg [7:0] Gray;
reg Gray_Valid;
reg [7:0] Hist_Pixel, Threshold;
reg Hist_Valid;

reg [7:0] Threshold_Pixel;
reg Thresh_Valid;

reg [7:0] CumHist_Pixel;

wire [15:0] wr1_data, wr2_data;
wire wr_data_valid;


Arbitrator arbit (.iClk(clk),
                  .iRst_n(rst),
                  .iFval(fval),
                  
                  .iSelect(select),
                  
                  .iX_Cont(X_Cont),
                  .iY_Cont(Y_Cont),
                  
                  .iRGB_R(R),
                  .iRGB_G(G),
                  .iRGB_B(B),
                  .iRGB_Valid(RGB_Valid),
                  
                  .iGray(Gray),
                  .iGray_Valid(Gray_Valid),
                  
                  .iHist(Hist_Pixel),
                  .iThresholdLevel(Threshold),
                  .iHist_Valid(Hist_Valid),
                  
                  .iThresh(Threshold_Pixel),
                  .iThresh_Valid(Thresh_Valid),
                  
                  .iCumHist(CumHist_Pixel),
                  
                  .oWr1_data(wr1_data),
                  .oWr2_data(wr2_data),                      
                  
                  .oWr_data_valid(wr_data_valid)
);


always begin
    clk = 0;
    #1 clk = 1;
    #1;
end

initial begin
    #0
    rst = 0; fval = 0; select = 3'b000; X_Cont = 0; Y_Cont = 0; assert_failed = 0;
    R = 0; G = 0; B = 0; RGB_Valid = 0;
    Gray = 0; Gray_Valid = 0;
    Hist_Pixel = 0; Threshold = 0; Hist_Valid = 0;
    Threshold_Pixel = 0; Thresh_Valid = 0;
    CumHist_Pixel = 0;
    #1
    #10 rst = 1;
    /* We expect to see only red when the switch is in an invalid position */
    #2 `assert("wr1_data", wr1_data, 0) `assert("wr2_data", wr2_data, 16'h03ff) 
       `assert("wr_data_valid", wr_data_valid, 0)
       
    select = 3'b001;
    /* We expect to see passthrough when the switch is in RGB position, however, 
       the valid signals are low, so we expect to see only black */
    #2
    #2 `assert("wr1_data", wr1_data, 0) `assert("wr2_data", wr2_data, 16'h0000) 
       `assert("wr_data_valid", wr_data_valid, 0)
    
    fval = 1; RGB_Valid = 1; R = 0; G = 12'hfff; B = 12'hf0f;
    /* We expect to see pass through here after two cycles. */
    #4 `assert("wr1_data", wr1_data, 16'h7fc3) `assert("wr2_data", wr2_data, 16'h7c00) 
       `assert("wr_data_valid", wr_data_valid, 1)
       
    /* After changing select, we expect to see a change. However, only when f valid is low! */
    Gray = 8'h0f; Gray_Valid = 1; select = 3'b010;
    #4 `assert("wr1_data", wr1_data, 16'h7fc3) `assert("wr2_data", wr2_data, 16'h7c00) 
       `assert("wr_data_valid", wr_data_valid, 1)
    fval = 0;
    #2 
    fval = 1;
    #4 `assert("wr1_data", wr1_data, 16'h043c) `assert("wr2_data", wr2_data, 16'h703c) 
       `assert("wr_data_valid", wr_data_valid, 1)
    
    #2 $stop;
end

endmodule
    
    
