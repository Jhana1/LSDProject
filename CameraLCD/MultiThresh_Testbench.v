`timescale 1ns / 100ps 

/* MultiThresh Testbench 
 * 
 * The purpose of this module is to ensure that the multiple thresholder works correctly. 
 */

`define assert(NAME, SIGNAL, VALUE) \
        if (SIGNAL !== VALUE) begin \
            $display("ASSERTION FAILED in %m: %s != %d", NAME, VALUE); \
            assert_failed = 1; \
        end

module MultiThresh_Testbench;

integer infile, outfile;
reg signed [15:0] X, Y;
reg clk, smooth, valid;
reg [7:0] gray;
wire [7:0] pixel;
wire ovalid;
reg [7:0] thresh1, thresh2;

MultiThresh DUT (
    .iClk(clk), 
    .iGray(gray),
    .iValid(valid),
    .iThresh1(8'd67),
    .iThresh2(8'd111),
    .iX_Cont(X),
    .iY_Cont(Y),
    .iSmooth(smooth),
    .oPixel(pixel),
    .oValid(ovalid)
    );

always begin
    #0 clk = 0;
    #1 clk = 1;
    #1 ;
end

initial begin
    valid = 0; smooth = 1; gray = 0;
    #50;
    smooth = 0;
    #2;
    
    /* Open up the image file */
    infile = $fopen("shark.txt", "r");
    outfile = $fopen("shark_block_thresh.txt", "w");
    
    /* Threshold without interpolation */
    thresh1 = 67;
    thresh2 = 111;
    valid = 1;
    smooth = 0;
    for (Y = 0; Y < 480; Y = Y + 1) begin
        for (X = 0; X < 800; X = X + 1) begin
            $fscanf(infile, "%d\n", gray); #2;
            $fwrite(outfile, "%d\n", pixel); #2;
        end
    end
    $fclose(infile);
    $fclose(outfile);
    valid = 0;
    #20;
    
        /* Open up the image file */
    infile = $fopen("shark.txt", "r");
    outfile = $fopen("shark_interp_thresh.txt", "w");
    
    /* Threshold without interpolation */
    valid = 1;
    smooth = 1;
    for (Y = 0; Y < 480; Y = Y + 1) begin
        for (X = 0; X < 800; X = X + 1) begin
            $fscanf(infile, "%d\n", gray); #2;
            $fwrite(outfile, "%d\n", pixel); #2;
        end
    end
    valid = 0;
    $fclose(infile);
    $fclose(outfile);
    #2;
    
    $stop;
    
end

endmodule
    
