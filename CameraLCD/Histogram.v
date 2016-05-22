module Histogram
  #(parameter DATA_WIDTH=20, parameter ADDR_WIDTH=8)
  (
    input iClk,
    input iClear,
    input iInc,
    input [(ADDR_WIDTH-1):0] iGray, 
    output [(ADDR_WIDTH)-1:0] oGray,
    output [(DATA_WIDTH-1):0] oGrayHisto
  );

  // Declare the RAM variable
  reg [DATA_WIDTH-1:0] ram[2**ADDR_WIDTH-1:0];
  reg [DATA_WIDTH-1:0] tmp;
  reg [ADDR_WIDTH-1:0] GrayR, GrayD;
  reg [ADDR_WIDTH-1:0] ClearCount;
  reg IncD, IncR;
  assign oGrayHisto = tmp;
  assign oGray = GrayD;
  
  
  
  always @ (posedge iClk)
  begin
    // Reset
    tmp <= ram[GrayR];
    ClearCount <= 0;
    if (iClear) begin
      ClearCount <= ClearCount + 8'b1;
      ram[ClearCount] <= 0;
      
    end
    else if (IncD) begin
      if (GrayD == GrayR) begin
        tmp <= tmp + 20'b1;
        ram[GrayD] <= tmp + 20'b1;
      end 
      else begin
        ram[GrayD] <= tmp + 20'b1;
      end
    end
  end
  
  always @ (posedge iClk)
  begin
    GrayR <= iGray;
    GrayD <= GrayR;
    IncR <= iInc;
    IncD <= IncR;
  end
endmodule
