module Histogram
(
    input iClk,
    input iRst_n,
    input iClearRam,
    input [7:0] iGray,
    input iValid,
    output [19:0] oGrayHisto,
    output reg [7:0] oGray,
	 output reg oDone
);

reg [1:0] cell_ptr;
reg [3:0] count;
reg validD1, validD2;
reg [7:0] rGray;
wire valid1, valid2, valid3;

wire [19:0] Q1, Q2, Q3;

assign valid1 = iValid && (cell_ptr == 2'b00);
assign valid2 = iValid && (cell_ptr == 2'b01);
assign valid3 = iValid && (cell_ptr == 2'b10);

assign oGrayHisto = Q1 + Q2 + Q3;

HistogramCell hcell1 (
    .iClk(iClk), 
    .iRst_n(iRst_n),
    .iClearRam(iClearRam),
    .iGray(iGray),
    .iValid(valid1), 
    .oQ(Q1)
    );

HistogramCell hcell2 (
    .iClk(iClk), 
    .iRst_n(iRst_n),
    .iClearRam(iClearRam),
    .iGray(iGray), 
    .iValid(valid2), 
    .oQ(Q2)
    );

HistogramCell hcell3 (
    .iClk(iClk), 
    .iRst_n(iRst_n),
    .iClearRam(iClearRam),
    .iGray(iGray),
    .iValid(valid3), 
    .oQ(Q3)
    );

always @(posedge iClk) begin
    if (!iRst_n) begin
        cell_ptr <= 0;
        oGray    <= 0;
		  rGray    <= 0;
    end else begin
        if (cell_ptr == 2'b10) cell_ptr <= 0;
        else cell_ptr <= cell_ptr + 1'b1;
        rGray    <= iGray;
		  oGray 	  <= rGray;
    end
end

always @(posedge iClk) begin
	oDone <= 0;
	validD1 <= iValid;
	validD2 <= validD1;
	if (!iRst_n) begin
		count   <= 0;
		oDone   <= 0;
		validD1 <= 0;
	end else if (iValid == 1) begin
		count <= 0;
		oDone <= 0;
	end else if ((iValid == 0) && (validD2 == 1)) begin
		count <= 1;
	end else if (count < 3 && count != 0) begin
		count <= count + 1;
	end else if (count == 3) begin
		oDone <= 1;
	end
end

endmodule
