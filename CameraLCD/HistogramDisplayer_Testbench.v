`timescale 1ns / 100ps 
`include "true_dpram_sclk.v"

/* Histogram Displayer Testbench 
 * 
 * The purpose of this module is to ensure that the histogram display works
 * correctly. In order to verify this, we feed in a histogram, and it outputs
 * a 800*480 image which can then be verified by viewing in matlab.
 */

`define assert(NAME, SIGNAL, VALUE) \
        if (SIGNAL !== VALUE) begin \
            $display("ASSERTION FAILED in %m: %s != %d", NAME, VALUE); \
            assert_failed = 1; \
        end

module HistogramDisplayer_Testbench;

integer X, Y, file, i, max_val;

reg clk, valid;
wire qb;
reg we;

wire [7:0] pixel;
wire [7:0] red;
wire p_valid;

wire [7:0] histo_addr;
wire [19:0] histo_val;

reg [19:0] write_data;
reg [7:0] write_addr;

HistogramDisplayer hd(
    .iClk(clk),
    .iValid(valid),
    .X_Cont(X),
    .Y_Cont(Y),
    .iHistoValue(histo_val),
    .iMaxValue(max_val),
    .iThreshPoint(0),
    .oHistoAddr(histo_addr),
    .oPixel(pixel),
    .oRed(red),
    .oValid(p_valid));

true_dpram_sclk ram (.clk(clk),
                     .data_a(20'b0), 
                     .data_b(write_data), 
                     .addr_a(histo_addr),
                     .addr_b(write_addr), 
                     .we_a(1'b0), 
                     .we_b(we), 
                     .q_a(histo_val),
                     .q_b(qb));

always begin
    #0 clk = 0;
    #1 clk = 1;
    #1 ;
end

initial begin
    #0
    file = $fopen("shark_hist.txt", "r");
    max_val = 0;
    for (i = 0; i < 256; i = i + 1) begin
        $fscanf(file, "%d\n", write_data);
        if (write_data > max_val) max_val = write_data;
        write_addr = i;
        we = 1;
        #2;
    end
    we = 0;
    $fclose(file);
    #2;
    file = $fopen("shark_hist_displayed.txt", "w");
    valid = 1;
    for (Y = 0; Y < 480; Y = Y + 1) begin
        for (X = 0; X < 800; X = X + 1) begin
            #2
            #2
            #2
            $fwrite(file, "%d\n", pixel);
        end
    end
    #2 $fclose(file);
    #2 $stop;
    
/* 
   To view in matlab, 
   Import data. 
   image = reshape(data, 800, 480);
   imshow(image);
*/

end

endmodule
    
