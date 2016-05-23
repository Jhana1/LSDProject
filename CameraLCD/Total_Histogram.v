module Total_Histogram
(
    input iClk,
    input iRst_n,
    input [7:0] iGray,
    input iGrayValid,
    input iFvalid,
    input [15:0] iX_Cont,
    input [15:0] iY_Cont,

    input [7:0] iReadGray,
    // Histogram Outputs
    output [7:0]  oGray,
    output [19:0] oGrayHisto,
    output [19:0] oMaxValue,
    
    // Cumulative Histogram Outputs
    output [7:0]  oGrayCum,
    output [19:0] oGrayCumHisto,
    
    output [7:0] oThresh,
	 output [7:0] oThresh25,
	 output [7:0] oThresh75,
    output reg oDone
);

// Registers
reg [2:0] state;
reg [2:0] substate;
reg [7:0] hGrayR, rReadGray;
reg clearRam, hInc, startCH, restartCH, even;

// ====================================
// Histogram Related

wire[7:0] hGray, gray;
wire[19:0] grayHisto;

// Histogram Ram
wire [7:0]  HistWAddr, HistRAddr;
wire [19:0] HistWData; 

// Histogram 1
wire [19:0] Hist1Q, Hist1RData;

// Histogram 2
wire [19:0] Hist2Q, Hist2RData;

// Cumulative Histogram
wire [7:0] writeCumGrayAddr, readHistGrayAddr;
wire [19:0] writeCumGrayData, CumHistQ, ReadCumHistData;
// ===================================

// General
// ===================================
wire [7:0] thresh25, thresh, thresh75; 
reg  [7:0] rThresh;
wire Hist1We, Hist2We, writeEnable, cumDone, hDone;


reg [19:0] Hist2RDataR, Hist1RDataR, ReadCumHistDataR;


assign hGray = (state != 3) ? hGrayR : readHistGrayAddr;
assign Hist1We    = (even == 1) ? writeEnable : 1'b1;
assign Hist2We    = (even == 0) ? writeEnable : 1'b1;

assign oGrayHisto   = (even == 1) ? Hist2RDataR : Hist1RDataR;
assign oGrayCumHisto = ReadCumHistDataR;
//assign oGray          = ReadCumHistAddrR;
//assign oGrayCum       = ReadCumHistAddrR;
assign oThresh       = rThresh;


Histogram h1
(
    .iClk(iClk),
    .iClear(clearRam),
    .iGray(hGray),
    .iInc(hInc),
    .oGray(gray),
    .oGrayHisto(grayHisto)
    );

CumulativeHistogram c1
(
    .iClk(iClk),
    .iStart(startCH),
    .iRestart(restartCH),
    
    .iQInHist(grayHisto), // Read from the histogram RAM
    .oAddrInHist(readHistGrayAddr),

   .oDataOutCumH(writeCumGrayData), // Write to the cumulative histogram RAM 
   .oAddrOutCumH(writeCumGrayAddr),
   .oWE(writeEnable),

	.oThresh25(oThresh25),
   .oThresh50(thresh), // The chosen threshold 
	.oThresh75(oThresh75),
   .oDone(cumDone),

   .oDataOutHist(HistWData),
   .oAddrOutHist(HistWAddr),
   .oMaxValue(oMaxValue)
   );

true_dpram_sclk Hist1   (.clk(iClk), 
    .data_a(HistWData),
    .addr_a(HistWAddr),
    .we_a(Hist1We),
    .q_a(Hist1Q),
    .data_b(),
    .addr_b(rReadGray),
    .we_b(),
    .q_b(Hist1RData)
    );

true_dpram_sclk Hist2   (.clk(iClk), 
    .data_a(HistWData),
    .addr_a(HistWAddr),
    .we_a(Hist2We),
    .q_a(Hist2Q),
    .data_b(),
    .addr_b(rReadGray),
    .we_b(),
    .q_b(Hist2RData)
    );

true_dpram_sclk CumHist (.clk(iClk),
    .data_a(writeCumGrayData),
    .addr_a(writeCumGrayAddr),
    .we_a(writeEnable),
    .q_a(CumHistQ),
    .data_b(),
    .addr_b(rReadGray),
    .we_b(),
    .q_b(ReadCumHistData)
    );

always @(posedge iClk)
begin
    // Reset
    if (!iRst_n) begin
        state    <= 0;
        substate  <= 0;
        even      <= 0;
        restartCH <= 1;
    end
    
    // State 0 - Reset Histogram Ram
    if (state == 0) begin
        restartCH <= 0;
        clearRam  <= 1;
        hGrayR    <= 0;
        substate  <= 1;
        hInc         <= 0;
        // substate 1 - Increment iGray
        if (substate == 1) begin
            if (hGrayR == 255)
                substate <= 2;
            hGrayR <= hGrayR + 8'b1;
        // substate 2 - Don't Increment iGray
    end else if (substate == 2) begin
        clearRam <= 0;
        hGrayR    <= 0;
        substate <= 0;
            state    <= 1; // Go to Wait
        end
    end
    
    // State 1 - Wait
    if (state == 1) begin
        clearRam  <= 1;
        hGrayR    <= 0;
        substate  <= 1;
        hInc         <= 0;
        restartCH <= 0;
        // When Fvalid is High, Calculate Histogram
        state    <= (iFvalid) ? 2 : 1;
    end
    
    // State 2 - Calculate Histogram 
    if (state == 2) begin
        if (substate == 1)
            even <= !even;
        substate <= 0;
        clearRam <= 0;
        hInc        <= iGrayValid;
        hGrayR  <= iGray;
        // When Fvalid is Low, go to Cumulative
        state   <= (!iFvalid) ? 3 : 2;
    end
    
    // State 3 - Calculate Cumulative Histogram
    // Should do this on its own, just need to wait for it
    if (state == 3) begin
        hInc     <= 0;
        substate <= 1;
        startCH     <= 1;
        if (substate == 1)
            startCH <= 0;
        if (cumDone) begin
            substate  <= 1;
            state     <= 1;
            restartCH <= 1;
            oDone     <= 1;
            rThresh   <= thresh;
        end
    end
    

end


always @(posedge iClk)
begin
    rReadGray         <= iReadGray;
    Hist2RDataR       <= Hist2RData;
    Hist1RDataR       <= Hist1RData;
    ReadCumHistDataR <= ReadCumHistData;
end
endmodule
