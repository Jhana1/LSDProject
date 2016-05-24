`timescale 1ns / 100ps 

/* Total Module Testbench 
 * 
 * 
 */
module Total_Module_Testbench;

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

reg [3:0] iSW;

wire [15:0] wr1_data, wr2_data;
wire WR_DATA_VAL;

wire [7:0] oRed, oGreen, oBlue;

assign oRed = wr1_data[9:2];
assign oGreen = {wr1_data[14:10], wr2_data[14:12]};
assign oBlue = wr2_data[9:2];
assign oGray = oRed;

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
    .iCCD_DVAL(sCCD_DVAL),

    // Display
    .iDisplaySelect(iSW),

    // Output
    .wr1_data(wr1_data),
    .wr2_data(wr2_data),
    .WR_DATA_VAL(WR_DATA_VAL)
  );

always begin
    #0 clk = 0;
    #1 clk = 1;
    #1 ;
end

initial begin
    /* Clear the RAM */
    rst = 0; X = 0; Y = 0; R = 0; G = 0; B = 0; frame_val = 0; pix_val = 0;
    //
    iSW = 4'd1;
    
    #50000;
    #1;
    rst = 1;
    
    /* Warmup */
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
    
    /*
    iSW = 4'd1;
    #50000;
    //**** Color THE IMAGE ***********
    rfile = $fopen("shark_red.txt", "r");
    gfile = $fopen("shark_green.txt", "r");
    bfile = $fopen("shark_blue.txt", "r");
    file = $fopen("shark_color.txt", "w");
    #2;
    frame_val = 1;
    pix_val = 1;
    for (Y = 0; Y < 480; Y = Y + 1) begin
        for (X = 0; X < 800; X = X + 1) begin               
            $fscanf(rfile, "%d\n", R); 
            $fscanf(gfile, "%d\n", G); 
            $fscanf(bfile, "%d\n", B);
            $fwrite(file, "%d\t%d\t%d\n", oRed, oGreen, oBlue);
            #2;
        end
    end
    frame_val = 0;
    pix_val = 0;
    $fclose(rfile);
    $fclose(gfile);
    $fclose(bfile);
    $fclose(file);
        
    
    iSW = 4'd2;
    #50000;
    // **** Grayscale THE IMAGE **********
    rfile = $fopen("shark_red.txt", "r");
    gfile = $fopen("shark_green.txt", "r");
    bfile = $fopen("shark_blue.txt", "r");
    file = $fopen("shark_grayed.txt", "w");
    #2;
    frame_val = 1;
    pix_val = 1;
    for (Y = 0; Y < 480; Y = Y + 1) begin
        for (X = 0; X < 800; X = X + 1) begin               
            $fscanf(rfile, "%d\n", R); 
            $fscanf(gfile, "%d\n", G); 
            $fscanf(bfile, "%d\n", B);
            $fwrite(file, "%d\t%d\t%d\n", oRed, oGreen, oBlue);
            #2;
        end
    end
    frame_val = 0;
    pix_val = 0;
    $fclose(rfile);
    $fclose(gfile);
    $fclose(bfile);
    $fclose(file);
    
    iSW = 4'd4;
    #50000;
    // ***** Threshold THE IMAGE ***********
    rfile = $fopen("shark_red.txt", "r");
    gfile = $fopen("shark_green.txt", "r");
    bfile = $fopen("shark_blue.txt", "r");
    file = $fopen("shark_thresholded.txt", "w");
    #2;
    frame_val = 1;
    pix_val = 1;
    for (Y = 0; Y < 480; Y = Y + 1) begin
        for (X = 0; X < 800; X = X + 1) begin               
            $fscanf(rfile, "%d\n", R); 
            $fscanf(gfile, "%d\n", G); 
            $fscanf(bfile, "%d\n", B);
            $fwrite(file, "%d\t%d\t%d\n", oRed, oGreen, oBlue);
            #2;
        end
    end
    frame_val = 0;
    pix_val = 0;
    $fclose(rfile);
    $fclose(gfile);
    $fclose(bfile);
    $fclose(file);*/
    
    
    iSW = 4'd3;
    #50000;
    //**** HISTOGRAM THE IMAGE ***********
    rfile = $fopen("shark_red.txt", "r");
    gfile = $fopen("shark_green.txt", "r");
    bfile = $fopen("shark_blue.txt", "r");
    file = $fopen("shark_histogrammed.txt", "w");
    #2;
    frame_val = 1;
    pix_val = 1;
    for (Y = 0; Y < 480; Y = Y + 1) begin
        for (X = 0; X < 800; X = X + 1) begin               
            $fscanf(rfile, "%d\n", R); 
            $fscanf(gfile, "%d\n", G); 
            $fscanf(bfile, "%d\n", B);
            $fwrite(file, "%d\t%d\t%d\n", oRed, oGreen, oBlue);
            #2;
        end
    end
    frame_val = 0;
    pix_val = 0;
    $fclose(rfile);
    $fclose(gfile);
    $fclose(bfile);
    $fclose(file);
    
    
    iSW = 4'd5;
    #50000;
    //**** CUMULATIVE HISTOGRAM THE IMAGE ***********
    rfile = $fopen("shark_red.txt", "r");
    gfile = $fopen("shark_green.txt", "r");
    bfile = $fopen("shark_blue.txt", "r");
    file = $fopen("shark_cumulated.txt", "w");
    #2;
    frame_val = 1;
    pix_val = 1;
    for (Y = 0; Y < 480; Y = Y + 1) begin
        for (X = 0; X < 800; X = X + 1) begin               
            $fscanf(rfile, "%d\n", R); 
            $fscanf(gfile, "%d\n", G); 
            $fscanf(bfile, "%d\n", B);
            $fwrite(file, "%d\t%d\t%d\n", oRed, oGreen, oBlue);
            #2;
        end
    end
    frame_val = 0;
    pix_val = 0;
    $fclose(rfile);
    $fclose(gfile);
    $fclose(bfile);
    $fclose(file);
    

    
    #2 $stop;
end

endmodule
    
    


