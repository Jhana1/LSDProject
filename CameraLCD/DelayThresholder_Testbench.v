`timescale 1ns / 100ps 
`include "DelayThresholder.v"
`default_nettype none

/* DelayThresholder Module Testbench 
 * 
 * 
 */
module DelayThresholder_Testbench;

integer i, rfile, gfile, bfile, file;
reg clk, rst, frame_val, pix_val;
reg [15:0] X, Y;
reg [11:0] R, G, B;

wire CCD_PIXCLK = clk;
wire DLY_RST_1 = rst;
wire mCCD_FVAL = frame_val;
wire [15:0] Y_Cont = Y;
wire [15:0] X_Cont = X;

wire [11:0] sCCD_R = {R, 4'b0};
wire [11:0] sCCD_G = {G, 4'b0};
wire [11:0] sCCD_B = {B, 4'b0};

wire sCCD_DVAL = pix_val;

reg [17:0] iSW;

wire [15:0] wr1_data, wr2_data, wr1_data_ram, wr2_data_ram;
wire WR_DATA_VAL;

wire [19:0] sdram_write = Y*800 + X - 2;
wire [19:0] ReadAddr = Y*800 + X - 2;


wire [7:0] oRed, oGreen, oBlue;
wire [7:0] threshold;

assign oRed = wr2_data_ram[9:2];
assign oGreen = {wr1_data_ram[14:10], wr2_data_ram[14:12]};
assign oBlue = wr1_data_ram[9:2];

wire [7:0] wr_gray_delay_in = {wr1_data_ram[15], wr1_data_ram[1:0], 
                            wr2_data_ram[15], wr2_data_ram[11:10], wr2_data_ram[1:0]};
wire [7:0] wr_gray_delay_out;
reg ReadSignal;

/* The big module */
Total_Module TOTAL
  (
    // General
    .CCD_PIXCLK(CCD_PIXCLK),
    .iRst_n(DLY_RST_1),

    // Frame Related
    .iX_Cont(X_Cont),
    .iY_Cont(Y_Cont),
    .iFval(mCCD_FVAL),

    // RGB
    .iCCD_R(sCCD_R),
    .iCCD_G(sCCD_G),
    .iCCD_B(sCCD_B),
    .iDelayedGray(wr_gray_delay_out),
    .iCCD_DVAL(sCCD_DVAL),

    // Display
    .iDisplaySelect(iSW),

    // Output
    .wr1_data(wr1_data),
    .wr2_data(wr2_data),
    .WR_DATA_VAL(WR_DATA_VAL),
    
    .oThreshold(threshold)
  );

/* The RAM that represents the wr1 data */
true_dpram_sclk SDRAM1 
    (.clk(CCD_PIXCLK),
    .data_a(wr1_data),
    .addr_a(sdram_write),
    .we_a(WR_DATA_VAL),
    .q_a(),
    .data_b(),
    .addr_b(ReadAddr),
    .we_b(),
    .q_b(wr1_data_ram)
    );
defparam SDRAM1.DATA_WIDTH=16;
defparam SDRAM1.ADDR_WIDTH=20;

/* The RAM that represents the second write port of the wr1 data 
   Note how it is connected such that we write into this RAM what is being read out of 
   SDRAM1, and we also present the data out when data is coming from the CCD. This is used
   for the delayed data output. */
true_dpram_sclk SDRAM1_PORT2 
    (.clk(CCD_PIXCLK),
    .data_a(wr_gray_delay_in),
    .addr_a(ReadAddr),
    .we_a(ReadSignal),
    .q_a(),
    .data_b(),
    .addr_b(sdram_write),
    .we_b(),
    .q_b(wr_gray_delay_out)
    );
defparam SDRAM1_PORT2.DATA_WIDTH=16;
defparam SDRAM1_PORT2.ADDR_WIDTH=20;

/* The RAM that represents the wr2 data fifo */
true_dpram_sclk SDRAM2
    (.clk(CCD_PIXCLK), 
    .data_a(wr2_data),
    .addr_a(sdram_write),
    .we_a(WR_DATA_VAL),
    .q_a(),
    .data_b(),
    .addr_b(ReadAddr),
    .we_b(),
    .q_b(wr2_data_ram)
    );
defparam SDRAM2.DATA_WIDTH=16;
defparam SDRAM2.ADDR_WIDTH=20;
    
always begin
    #0 clk = 0;
    #1 clk = 1;
    #1 ;
end

initial begin
    /* Clear the RAM */
    rst = 0; X = 0; Y = 0; R = 0; G = 0; B = 0; frame_val = 0; pix_val = 0; iSW = 0; ReadSignal = 0;
    #50000;
    
    #1;
    rst = 1;
    iSW = 18'd4;
    #2000;
    /* Warmup with shark*/
    rfile = $fopen("shark_red.txt", "r");
    gfile = $fopen("shark_green.txt", "r");
    bfile = $fopen("shark_blue.txt", "r");
    
    #2
    frame_val = 1;
    pix_val = 1;
    for (Y = 0; Y < 480; Y = Y + 1) begin
        for (X = 0; X < 800; X = X + 1) begin
            $fscanf(rfile, "%d\n", R); 
            $fscanf(gfile, "%d\n", G); 
            $fscanf(bfile, "%d\n", B);
            #2 ;
        end
    end
    frame_val = 0; X = 0; Y = 0; R = 0; G = 0; B = 0;
    pix_val = 0;
    $fclose(rfile);
    $fclose(gfile);
    $fclose(bfile);
    #2;
    
    #2000; // Let it calculate the threshold...
    ReadSignal = 1;
    // Now write the data to the framebuffer
    file = $fopen("delay_frame1.txt", "w");
    for (Y = 0; Y < 480; Y = Y + 1) begin
        for (X = 0; X < 800; X = X + 1) begin
            #2;
            $fwrite(file, "%d\t%d\t%d\n", oRed, oGreen, oBlue);
        end
    end
    #2; $fclose(file);
    ReadSignal = 0;
    
    /************** Lenna Frame, note threshold is from shark **************/
    rst = 1;
    iSW = 18'd32;
    #2000;
    /* Warmup with lenna*/
    rfile = $fopen("lenna_red.txt", "r");
    gfile = $fopen("lenna_green.txt", "r");
    bfile = $fopen("lenna_blue.txt", "r");
    #2
    frame_val = 1;
    pix_val = 1;
    for (Y = 0; Y < 480; Y = Y + 1) begin
        for (X = 0; X < 800; X = X + 1) begin
            $fscanf(rfile, "%d\n", R); 
            $fscanf(gfile, "%d\n", G); 
            $fscanf(bfile, "%d\n", B);
            #2 ;
        end
    end
    frame_val = 0; X = 0; Y = 0; R = 0; G = 0; B = 0;
    pix_val = 0;
    $fclose(rfile);
    $fclose(gfile);
    $fclose(bfile);
    #2;
    
    #2000; // Let it calculate the threshold...
    ReadSignal = 1;
    // Now write the data to the framebuffer
    file = $fopen("delay_frame2.txt", "w");
    for (Y = 0; Y < 480; Y = Y + 1) begin
        for (X = 0; X < 800; X = X + 1) begin
            #2;
            $fwrite(file, "%d\t%d\t%d\n", oRed, oGreen, oBlue);
        end
    end
    #2; $fclose(file);
    ReadSignal = 0;
    
    
    /******************* Shark Frame, but we display lenna with lenna's threshold ***/
    #1;
    rst = 1;
    //iSW = 18'd64;
    
    iSW = 18'd64;
    
    #2000;
    /* Warmup with lenna*/
    rfile = $fopen("shark_red.txt", "r");
    gfile = $fopen("shark_green.txt", "r");
    bfile = $fopen("shark_blue.txt", "r");
    #2
    frame_val = 1;
    pix_val = 1;
    for (Y = 0; Y < 480; Y = Y + 1) begin
        for (X = 0; X < 800; X = X + 1) begin
            $fscanf(rfile, "%d\n", R); 
            $fscanf(gfile, "%d\n", G); 
            $fscanf(bfile, "%d\n", B);
            #2;
        end
    end
    frame_val = 0; X = 0; Y = 0; R = 0; G = 0; B = 0;
    pix_val = 0;
    $fclose(rfile);
    $fclose(gfile);
    $fclose(bfile);
 
     #2000; // Let it calculate the threshold...
    ReadSignal = 1;
    // Now write the data to the framebuffer
    file = $fopen("delay_frame3.txt", "w");
    for (Y = 0; Y < 480; Y = Y + 1) begin
        for (X = 0; X < 800; X = X + 1) begin
            #2;
            $fwrite(file, "%d\t%d\t%d\n", oRed, oGreen, oBlue);
        end
    end
    #2; $fclose(file);
    ReadSignal = 0;
    
 
    #2 $stop;
end

endmodule
    
    


