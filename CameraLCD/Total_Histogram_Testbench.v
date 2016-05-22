`timescale 1ns / 100ps 
`include "true_dpram_sclk.v"
/* Total Histogram Testbench 
 * 
 * The purpose of this module is to ensure that the total histogram works correctly. 
 */

`define assert(NAME, SIGNAL, VALUE) \
        if (SIGNAL !== VALUE) begin \
            $display("ASSERTION FAILED in %m: %s != %d", NAME, VALUE); \
            assert_failed = 1; \
        end

module Total_Histogram_Testbench;

integer i, file, f1, f2;

reg clk, rst;
reg [7:0] gray_data;
reg gray_valid;
reg frame_valid;
reg [15:0] X, Y;

reg [7:0] histo_read_addr;

wire [7:0] threshold;
wire [19:0] histo_q, cumhisto_q;
wire [19:0] max_val;
wire done;

  Total_Histogram T1
  (
    .iClk(clk),
    .iRst_n(rst),
    .iGray(gray_data),
    .iGrayValid(gray_valid),
    .iFvalid(frame_valid),
    .iX_Cont(X),
    .iY_Cont(Y),
    .iReadGray(histo_read_addr),
    .oGrayHisto(histo_q),
    .oMaxValue(max_val),
    .oGrayCumHisto(cumhisto_q),
    .oThresh(threshold),
    .oDone(done)
  );                    

always begin
    #0 clk = 0;
    #1 clk = 1;
    #1 ;
end

initial begin
    /* Clear the RAM */
    #0 rst = 0; gray_data = 0; gray_valid = 0; frame_valid = 0; X = 0; Y = 0; 
       histo_read_addr = 0;
    #20 rst = 1;
    #300 ; // Let it clear the histograms ...
    
    for (i = 0; i < 3; i = i + 1) begin
        
        frame_valid = 1; gray_valid = 1;
        file = $fopen("shark.txt", "r");
        for (Y = 0; Y < 480; Y = Y + 1) begin
            for (X = 0; X < 800; X = X + 1) begin
                $fscanf(file, "%d\n", gray_data); #2;
            end
        end
        frame_valid = 0; gray_valid = 0;
        $fclose(file);
        #2;
        
        #1000; // Wait for calculation of histogram
    end
    
    /* Read out the histogram and cumulative histogram values */
    f1 = $fopen("shark_total_hist.txt", "w");
    f2 = $fopen("shark_total_cumhist.txt", "w");
    frame_valid = 1;
    for (i = 0; i < 256; i = i + 1) begin
        histo_read_addr = i;
        #2;
        $fwrite(f1, "%d\n", histo_q);
        $fwrite(f2, "%d\n", cumhisto_q);
        #2;
    end
    $fclose(file);
    #2 $stop;
end

endmodule