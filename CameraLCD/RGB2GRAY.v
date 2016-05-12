module RGB2GRAY(input iCLK,
                input iReset_n,
                input [11:0] iRed,
                input [11:0] iGreen,
                input [11:0] iBlue,
                input iDval,
                output reg [7:0] oGray,
                output oDval				
                );
				

parameter size = 11;

reg [11:0] lumaRed, lumaGreen, lumaBlue, accumRG, accumBlue;
reg [2:0] state;

wire [11:0] accumOut = (accumRG + accumBlue);
wire [2:0] newState = {state[1:0], iDval};

assign oDval = state[2];

always @(posedge iCLK or negedge iReset_n)
  begin
    if (!iReset_n)
      begin
        oGray <= 0;
        lumaRed <= 0;
        lumaGreen <= 0;
        lumaBlue <= 0;
        accumRG <= 0;
        state <= 0;
      end
    else
      begin
        // State Handling
        state <= newState;

        // First Pipeline
        lumaRed   <= (iRed >> 2) + (iRed >> 4);
        lumaGreen <= (iGreen >> 1) + (iGreen >> 4);
        //lumaBlue  <= (iBlue >> 4) + (iBlue >> 4); //Isnt this just blue >> 3 ?
        lumaBlue <= (iBlue >> 3);
        // Second Pipeline
        accumRG   <= lumaRed + lumaGreen;
        accumBlue <= lumaBlue;

        // Third Pipeline
        oGray <= accumOut[11:4];
      end		
  end


endmodule