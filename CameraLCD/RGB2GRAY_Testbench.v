`timescale 1ns / 100ps 

/* RGB2GRAY Module Testbench 
 * 
 * 
 */
module RGB2GRAY_Testbench;

integer i, rfile, gfile, bfile, file;
reg clk, rst, frame_val, pix_val;
reg [15:0] X, Y;
reg [11:0] R, G, B;

wire mCCD_FVAL = frame_val;
wire [15:0] Y_Cont = Y;
wire [15:0] X_Cont = X;

wire [11:0] iCCD_R = {R, 4'b0};
wire [11:0] iCCD_G = {G, 4'b0};
wire [11:0] iCCD_B = {B, 4'b0};
wire [7:0] Gray;

wire iCCD_DVAL = pix_val;

RGB2GRAY r2g (
    .iCLK(clk),
    .iReset_n(rst),
    .iRed(iCCD_R),
    .iGreen(iCCD_G),
    .iBlue(iCCD_B),
    .iDval(iCCD_DVAL),
    .iX_Cont(X_Cont),
    .iY_Cont(Y_Cont),
    .oGray(Gray)
);

always begin
    #0 clk = 0;
    #1 clk = 1;
    #1 ;
end

initial begin
    /* Clear the RAM */
    rst = 0; X = 0; Y = 0; R = 0; G = 0; B = 0; frame_val = 0; pix_val = 0;
    //**** Convert the image to greyscale.***
    rfile = $fopen("shark_red.txt", "r");
    gfile = $fopen("shark_green.txt", "r");
    bfile = $fopen("shark_blue.txt", "r");
    file = $fopen("shark_grayed_v.txt", "w");
    #10;
    rst = 1;
    #10
    frame_val = 1;
    pix_val = 1;
    for (Y = 0; Y < 480; Y = Y + 1) begin
        for (X = 0; X < 800; X = X + 1) begin
            $fscanf(rfile, "%d\n", R); 
            $fscanf(gfile, "%d\n", G); 
            $fscanf(bfile, "%d\n", B);
            $fwrite(file, "%d\t", Gray);
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