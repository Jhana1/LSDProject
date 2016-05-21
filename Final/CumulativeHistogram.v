`ifndef CUMULATIVE_HISTOGRAM_H
`define CUMULATIVE_HISTOGRAM_H

/*
 * Calculates a cumulative histogram reading from a RAM
 * Hold iRst_n HIGH to start histogramming 
 * After 255 + 3 cycles the cumulative histogram will be complete
 *
 * To find the 50th percentile, we know that there are a total of 
 * 800*480 = 384000 samples, thus the 50th percentile will be the point
 * of the histogram where we have 192000 samples below it.
 */
module CumulativeHistogram #(parameter word_size=20,
                             parameter percentile=(800*480)/2
)
(
  input iClk,
  input iStart,
  input iRestart,
  
  input [word_size - 1:0] iQInHist, // Read from the histogram RAM
  output reg [7:0] oAddrInHist,
  
  output reg [word_size - 1:0] oDataOutCumH, // Write to the cumulative histogram RAM 
  output reg [7:0] oAddrOutCumH,
  
  output reg [7:0] oThreshold, // The chosen threshold 
  output reg oWE,
  
  output reg [20:0] oDataOutHist,
  output reg [7:0]  oAddrOutHist,
  
  output reg oDone
);

reg [3:0] state;
reg doneAck;
//parameter percentile = (800*400)/2;

always @(posedge iClk)
begin
	 oDone <= 0;
	 oDataOutHist <= 0;
	 oAddrOutHist <= 0;
    if (iStart) begin
		  doneAck      <= 0;
        state 		   <= 0;
        oAddrInHist  <= 255;
        oAddrOutCumH <= 255;
        oThreshold 	<= 0;
        oWE 	    	<= 0;
    end else if (state == 0) begin
        state 		   <= 1;
        oAddrInHist  <= 255;
        oAddrOutCumH <= 0;
        oThreshold   <= 0;
    end else if (state == 1) begin
        state        <= 2;
        oAddrInHist  <= 0;
        oDataOutCumH <= 0;
        oAddrOutCumH <= 0;
        oThreshold   <= 0;
        oWE          <= 0;
    end else if (state == 2) begin
        state 		   <= 3;
        oAddrInHist  <= 1;
        oDataOutCumH <= 0;
        oAddrOutCumH <= 0;
        oThreshold   <= 0;
        oWE    	   <= 0;
    end else if (state == 3) begin
        if (oAddrInHist == 255)
            state 	<= 4;
        else
            state	   <= 3;
        oAddrInHist  <= oAddrInHist + 8'b1;
        oDataOutCumH <= oDataOutCumH + iQInHist;
        oAddrOutCumH <= oAddrInHist - 8'b1;
        oWE    	   <= 1;
        if (oDataOutCumH > percentile)
            oThreshold <= (oThreshold) ? oThreshold : oAddrOutCumH;				
		  oDataOutHist <= iQInHist;
		  oAddrOutHist <= oAddrInHist - 8'b1;
		  
    end else if (state == 4) begin
        state 		   <= 5;
        oAddrInHist  <= 0;
        oAddrOutCumH <= 255;
        oDataOutCumH <= oDataOutCumH + iQInHist;
		  oDataOutHist <= iQInHist;
		  oAddrOutHist <= 255;
        oWE          <= 1;
    end else if (state == 5) begin
		  if (iRestart == 1)
		      doneAck  <= 1;
		  else
				state    <= 5;
        oAddrInHist  <= 0;
        oAddrOutCumH <= 0;
        oDataOutCumH <= 0;
        oWE    	   <= 0;
        oDone        <= (doneAck == 1) ? 1'b0 : 1'b1;
    end
end

endmodule

`endif