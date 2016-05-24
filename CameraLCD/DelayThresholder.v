module DelayThresholder(
	input iEnable,
	input iThreshold,
	input [15:0] iData1,
	input [15:0] iData2,
	output reg [15:0] oData1, 
	output reg [15:0] oData2);
	
	wire [7:0] iGray = {iData1[15], iData1[1:0], 
	                    iData2[15], iData2[12:11], iData2[1:0]};
	
	always @(*) begin
		if (!iEnable) begin
			oData1 = iData1;			
		   oData2 = iData2;
	   end else begin
			if (iGray < iThreshold) begin
				oData1 = -1;
				oData2 = -1;
			end else begin
				oData1 = 0;
				oData2 = 0;
			end
		end
	end
	
endmodule
		   
	