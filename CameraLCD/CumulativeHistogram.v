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
module CumulativeHistogram #(parameter word_size=20
)
(
  input iClk,
  input iStart,
  input iRestart,
  
  input [word_size - 1:0] iQInHist, // Read from the histogram RAM
  output reg [7:0] oAddrInHist,
  
  output reg [word_size - 1:0] oDataOutCumH, // Write to the cumulative histogram RAM 
  output reg [7:0] oAddrOutCumH,
  
  output reg [7:0] oThresh25,
  output reg [7:0] oThresh50, // The chosen threshold 
  output reg [7:0] oThresh75,
  
  output reg oWE,
  
  output reg [19:0] oDataOutHist,
  output reg [7:0]  oAddrOutHist,
  output [19:0] oMaxValue, 
  
  output reg oDone
);

parameter percent25 = (800*480)/4;
parameter percent50 = (800*480)/2;
parameter percent75 = (800*480*3)/4;

reg [3:0] state;
reg doneAck;
//parameter percentile = (800*400)/2;
reg [19:0] max_value;
reg [19:0] prev_max_value;
reg delayed;

// Use the second most maximum value, istead of the first. This helps to smooth 
// the scaling changes a little
assign oMaxValue = max_value;


always @(posedge iClk)
begin
	 oDone <= 0;
	 oDataOutHist <= 0;
	 oAddrOutHist <= 0;
    if (iStart) begin
		  doneAck      <= 0;
        max_value  <= 0;
		  prev_max_value <= 0;
        state 		   <= 0;
        oAddrInHist  <= 0;
        oAddrOutCumH <= 0;
		  oThresh25    <= 0;
        oThresh50 	<= 0;
		  oThresh75    <= 0;
        oWE 	    	<= 0;
    end else if (state == 0) begin
        state 		   <= 1;
        oAddrInHist  <= 0;
        oAddrOutCumH <= 0;
		  oThresh25    <= 0;
        oThresh50    <= 0;
		  oThresh75    <= 0;
    end else if (state == 1) begin
        state        <= 2;
        oAddrInHist  <= 0;
        oDataOutCumH <= 0;
        oAddrOutCumH <= 0;
		  oThresh25    <= 0;
        oThresh50    <= 0;
		  oThresh75    <= 0;
        oWE          <= 0;
    end else if (state == 2) begin
        state 		   <= 3;
        oAddrInHist  <= 1;
        oDataOutCumH <= 0;
        oAddrOutCumH <= 0;
		  oThresh25    <= 0;
        oThresh50    <= 0;
		  oThresh75    <= 0;
        oWE    	   <= 0;
    end else if (state == 3) begin
        if (oAddrInHist == 255)
            state 	<= 4;
        else
            state	   <= 3;
        delayed      <= 0;
        oAddrInHist  <= oAddrInHist + 8'b1;
        oDataOutCumH <= oDataOutCumH + iQInHist;
        oAddrOutCumH <= oAddrInHist - 8'b1;
        oWE    	   <= 1;
		  
		  // When the entire image is one color, we will never set the threshold.
		  // By default the threshold will be zero. This is a reasonable assumption.
        if (oDataOutCumH > percent50)
            oThresh50 <= (oThresh50) ? oThresh50 : oAddrOutCumH;	
		  // Handle The other Thresholds
		  if (oDataOutCumH > percent25)
				oThresh25 <= (oThresh25) ? oThresh25 : oAddrOutCumH;
		  if (oDataOutCumH > percent75)
				oThresh75 <= (oThresh75) ? oThresh75 : oAddrOutCumH;
		  
        //oMaxValue    <= (iQInHist > oMaxValue) ? iQInHist : oMaxValue;
		  if (iQInHist > oMaxValue) begin
				max_value <= iQInHist;
				prev_max_value <= max_value;
			end
		  
		  oDataOutHist <= iQInHist;
		  oAddrOutHist <= oAddrInHist - 8'b1;
		  
    end else if (state == 4) begin
        delayed      <= 1;
        state 		   <= (delayed) ? 5 : 4;
        oAddrInHist  <= 0;
        oAddrOutCumH <= 255;
        oDataOutCumH <= oDataOutCumH + iQInHist;
		  oDataOutHist <= iQInHist;
		  oAddrOutHist <= 255;
			
			//oMaxValue    <= (iQInHist > oMaxValue) ? iQInHist : oMaxValue;
		  if (iQInHist > oMaxValue) begin
				max_value <= iQInHist;
				prev_max_value <= max_value;
		  end
			
		  if (oDataOutCumH > percent50)
            oThresh50 <= (oThresh50) ? oThresh50 : oAddrOutCumH;
		  if (oDataOutCumH > percent25)
				oThresh25 <= (oThresh25) ? oThresh25 : oAddrOutCumH;
		  if (oDataOutCumH > percent75)
				oThresh75 <= (oThresh75) ? oThresh75 : oAddrOutCumH;
				
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
        oDone      <= (doneAck == 1) ? 1'b0 : 1'b1;
    end
end

endmodule

`endif