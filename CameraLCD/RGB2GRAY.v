`ifndef RGB2GRAY_H
`define RGB2GRAY_H

module RGB2GRAY(input iCLK,
                input iReset_n,
                input [11:0] iRed,
                input [11:0] iGreen,
                input [11:0] iBlue,
                input iDval,
					 input [15:0] iX_Cont,
					 input [15:0] iY_Cont,
                output [7:0] oGray,
					 output reg [15:0] oX_Cont,
					 output reg [15:0] oY_Cont,
                output reg oDval
                );
                

parameter size = 11;

reg [11 : 0] accumOut, rRed, rGreen, rBlue;
reg [15:0]   rX_Cont, rY_Cont;
reg rDval;

assign oGray = accumOut[11:4];


always @(posedge iCLK or negedge iReset_n)
  begin
    if (!iReset_n)
      begin
        accumOut <= 0;
		  rRed <= 0;
		  rGreen <= 0;
		  rBlue <= 0;
		  rDval <= 0;
      end
    else
      begin
        
		  rDval    <= iDval;
		  rRed     <= iRed;
		  rGreen   <= iGreen;
		  rBlue    <= iBlue;
		  accumOut <= (rRed >> 2) + (rRed >> 4) + (rGreen >> 1) + (rGreen >> 4) + (rBlue >> 3);
		  //accumOut <= (rRed>>2)+(rRed>>5)+(rGreen>>1)+(rGreen>>4)+(rBlue>>4)+(rBlue>>5);
		  oDval    <= rDval;
		  
		  rX_Cont <= iX_Cont;
		  rY_Cont <= iY_Cont;
		  
		  oX_Cont <= rX_Cont;
		  oY_Cont <= rY_Cont;
      end       
  end


endmodule

`endif