`timescale 1ns / 100ps 

/* Histogram Testbench 
 * 
 * The purpose of this module is to ensure that the histogram works correctly. 
 */

`define assert(NAME, SIGNAL, VALUE) \
        if (SIGNAL !== VALUE) begin \
            $display("ASSERTION FAILED in %m: %s != %d", NAME, VALUE); \
            assert_failed = 1; \
        end

module Histogram_Testbench;

integer X, Y, i, file;

reg clk, clear, valid;
reg [7:0] gray;
wire [7:0] ogray;
wire [19:0] histo_val;

Histogram histo
(
  .iClk(clk),
  .iClear(clear),
  .iInc(valid),
  .iGray(gray), 
  .oGray(ogray),
  .oGrayHisto(histo_val)
);

always begin
    #0 clk = 0;
    #1 clk = 1;
    #1 ;
end

initial begin
    /* Clear the RAM */
    #0 clear = 0; valid = 0; gray = 0;
    #4 ;// allow to reset
    clear = 1;
    for (i = 0; i < 300; i = i + 1) #2;
    #2 clear = 0;
    
    /* Open up the image file */
    file = $fopen("shark.txt", "r");
    
    valid = 1;
    for (Y = 0; Y < 480; Y = Y + 1) begin
        for (X = 0; X < 800; X = X + 1) begin
            $fscanf(file, "%d\n", gray); #2;
        end
    end
    $fclose(file);
    #2;
    
    
    /* Now write out the histogram values */
    file = $fopen("shark_hist.txt", "w");
    valid = 0;
    gray = 0;
    #2;
    for (i = 0; i < 257; i = i + 1) begin
        gray = i;
        #2;
        $fwrite(file, "%d\n", histo_val);
        #2;
    end
    
    $fclose(file);
    #2 $stop;
end

endmodule
    
    


