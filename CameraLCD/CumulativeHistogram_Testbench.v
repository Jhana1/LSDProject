`timescale 1ns / 100ps 
`include "true_dpram_sclk.v"
/* Cumulative Histogram Testbench 
 * 
 * The purpose of this module is to ensure that the histogram works correctly. 
 */

`define assert(NAME, SIGNAL, VALUE) \
        if (SIGNAL !== VALUE) begin \
            $display("ASSERTION FAILED in %m: %s != %d", NAME, VALUE); \
            assert_failed = 1; \
        end

module CumulativeHistogram_Testbench;

integer X, Y, i, file;

reg clk;
wire [19:0] histo_val;
wire [7:0] histo_addr;

wire [19:0] cumh_data, cumh_val;
wire [7:0] cumh_addr;
wire cumh_we;
wire done;

reg [7:0] read_addr, write_addr;
reg [19:0] write_data;
reg we;

wire [7:0] thresh;
wire [19:0] max_val;
reg start, restart;

CumulativeHistogram c1
(
    .iClk(clk),
    .iStart(start),
    .iRestart(restart),
    
    .iQInHist(histo_val), // Read from the histogram RAM
    .oAddrInHist(histo_addr),

   .oDataOutCumH(cumh_data), // Write to the cumulative histogram RAM 
   .oAddrOutCumH(cumh_addr),
   .oWE(cumh_we),

   .oThreshold(thresh), // The chosen threshold 

   .oDone(done),
   .oMaxValue(max_val)
   );

true_dpram_sclk ram (.clk(clk),
                     .data_a(20'b0), 
                     .data_b(write_data), 
                     .addr_a(histo_addr),
                     .addr_b(write_addr), 
                     .we_a(1'b0), 
                     .we_b(we), 
                     .q_a(histo_val),
                     .q_b(qb));

true_dpram_sclk cumh_ram (.clk(clk),
                          .data_a(cumh_data), 
                          .data_b(20'b0), 
                          .addr_a(cumh_addr),
                          .addr_b(read_addr), 
                          .we_a(cumh_we), 
                          .we_b(1'b0), 
                          .q_b(cumh_val));

always begin
    #0 clk = 0;
    #1 clk = 1;
    #1 ;
end

initial begin
    /* Clear the RAM */
    #0
    file = $fopen("shark_hist.txt", "r");
    for (i = 0; i < 256; i = i + 1) begin
        $fscanf(file, "%d\n", write_data);
        write_addr = i;
        we = 1;
        #2;
    end
    we = 0;
    $fclose(file);
    #2;
    
    start = 1;
    #2 start = 0;
    
    while (!done) #2;
    
    /* Now write out the histogram values */
    file = $fopen("shark_cumhist.txt", "w");
    #2;
    for (i = 0; i < 255; i = i + 1) begin
        read_addr = i;
        #2;
        $fwrite(file, "%d\n", cumh_val);
        #2;
    end
    
    $fclose(file);
    #2 $stop;
end

endmodule
   