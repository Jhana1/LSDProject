`ifndef DELAY_THRESH
`define DELAY_THRESH

module DelayThresholder(
    input iEnable,
    input [7:0] iThreshold,
    input [15:0] iData1,
    input [15:0] iData2,
    input [7:0] iGrayDelayed,
    output reg [15:0] oData1, 
    output reg [15:0] oData2);

    always @(*) begin
        if (!iEnable) begin
            oData1 = iData1;
            oData2 = iData2;
        end else begin
            if (iGrayDelayed < iThreshold) begin
                oData1 = 0;
                oData2 = 0;
            end else begin
                oData1 = -1;
                oData2 = -1;
            end
        end
    end
endmodule

`endif

/*

 Idea. As we read data from the FIFO to display on the screen, we store it in second area.
 If the switch is on, we display data on screen from second area...
REF_CLK,
        RESET_N,
        CLK,
        //  FIFO Write Side 1
        WR1_DATA,
        WR1,
        WR1_ADDR,
        WR1_MAX_ADDR,
        WR1_LENGTH,
        WR1_LOAD,
        WR1_CLK,
        WR1_FULL,
        WR1_USE,
        //  FIFO Write Side 2
        WR2_DATA,
        WR2,
        WR2_ADDR,
        WR2_MAX_ADDR,
        WR2_LENGTH,
        WR2_LOAD,
        WR2_CLK,
        WR2_FULL,
        WR2_USE,
        //  FIFO Read Side 1
        RD1_DATA,
        RD1,
        RD1_ADDR,
        RD1_MAX_ADDR,
        RD1_LENGTH,
        RD1_LOAD,   
        RD1_CLK,
        RD1_EMPTY,
        RD1_USE,
        //  FIFO Read Side 2
        RD2_DATA,
        RD2,
        RD2_ADDR,
        RD2_MAX_ADDR,
        RD2_LENGTH,
        RD2_LOAD,
        RD2_CLK,
        RD2_EMPTY,
        RD2_USE,
        */