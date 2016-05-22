module Histogram
(
    input iClk,
    input iRst_n,
    input iClearRam,
    input [7:0] iGray,
    input iValid,
    output [17:0] oQ
);

reg [1:0] cell_ptr;

wire valid1, valid2, valid3;

wire [17:0] Q1, Q2, Q3;

assign valid1 = iValid && (cell_ptr == 2'b00);
assign valid2 = iValid && (cell_ptr == 2'b01);
assign valid3 = iValid && (cell_ptr == 2'b10);

assign oQ = Q1 + Q2 + Q3;

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
    end else begin
        if (cell_ptr == 2'b10) cell_ptr <= 0;
        else cell_ptr <= cell_ptr + 1'b1;
    end
end


endmodule
