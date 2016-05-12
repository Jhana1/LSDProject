// --------------------------------------------------------------------
// Copyright (c) 2007 by Terasic Technologies Inc. 
// --------------------------------------------------------------------
//
// Permission:
//
//   Terasic grants permission to use and modify this code for use
//   in synthesis for all Terasic Development Boards and Altera Development 
//   Kits made by Terasic.  Other use of this code, including the selling 
//   ,duplication, or modification of any portion is strictly prohibited.
//
// Disclaimer:
//
//   This VHDL/Verilog or C/C++ source code is intended as a design reference
//   which illustrates how these types of functions can be implemented.
//   It is the user's responsibility to verify their design for
//   consistency and functionality through the use of formal
//   verification methods.  Terasic provides no warranty regarding the use 
//   or functionality of this code.
//
// --------------------------------------------------------------------
//           
//                     Terasic Technologies Inc
//                     356 Fu-Shin E. Rd Sec. 1. JhuBei City,
//                     HsinChu County, Taiwan
//                     302
//
//                     web: http://www.terasic.com/
//                     email: support@terasic.com
//
// --------------------------------------------------------------------
//
// Major Functions:	This function will transmit the lcd register setting 
//            
// --------------------------------------------------------------------
//
// Revision History :
// --------------------------------------------------------------------
//   Ver  :| Author            		:| Mod. Date :| Changes Made:
//   V1.0 :| Johnny Fan				:| 07/06/30  :| Initial Revision
// --------------------------------------------------------------------

module lcd_3wire_config (//	Host Side
						iCLK,
						iRST_n,
						//	3wire interface side
						o3WIRE_SCLK,
						io3WIRE_SDAT,
						o3WIRE_SCEN,
						o3WIRE_BUSY_n
						);
//============================================================================
// PARAMETER declarations
//============================================================================						
parameter	LUT_SIZE	=	21; // Total setting register numbers 
//===========================================================================
// PORT declarations
//===========================================================================
//	Host Side
output 		o3WIRE_BUSY_n;
input		iCLK;
input		iRST_n;
//	3wire interface side
output		o3WIRE_SCLK;
inout		io3WIRE_SDAT;
output		o3WIRE_SCEN;
//	Internal Registers/Wires
//=============================================================================
// REG/WIRE declarations
//=============================================================================
reg			m3wire_str;
wire		m3wire_rdy;
wire		m3wire_ack;
wire		m3wire_clk;
reg	[15:0]	m3wire_data;
reg	[15:0]	lut_data;
reg	[5:0]	lut_index;
reg	[3:0]	msetup_st;
reg  		o3WIRE_BUSY_n;
wire		v_reverse; // display Vertical reverse function
wire		h_reverse; // display Horizontal reverse function
wire [9:0]	g0;    
wire [9:0]	g1; 
wire [9:0]	g2;
wire [9:0]	g3;
wire [9:0]	g4;
wire [9:0]	g5;
wire [9:0]	g6;
wire [9:0]	g7;
wire [9:0]	g8;
wire [9:0]	g9;
wire [9:0]	g10;
wire [9:0]	g11;

//=============================================================================
// Structural coding
//=============================================================================

assign	h_reverse = 1'b1;
assign	v_reverse = 1'b1;

I2S_Controller	u0	(	//	Host Side
						.iCLK(iCLK),
						.iRST(iRST_n),
						.iDATA(m3wire_data),
						.iSTR(m3wire_str),
						.oACK(m3wire_ack),
						.oRDY(m3wire_rdy),
						.oCLK(m3wire_clk),
						//	Serial Side
						.I2S_EN(o3WIRE_SCEN),
						.I2S_DATA(io3WIRE_SDAT),
						.I2S_CLK(o3WIRE_SCLK)
					);
//////////////////////	Config Control	////////////////////////////
always@(posedge m3wire_clk or negedge iRST_n)
begin
	if(!iRST_n)
	begin
		lut_index	<=	0;
		msetup_st	<=	0;
		m3wire_str	<=	0;
	    o3WIRE_BUSY_n  <=  0;
	end
	else
	begin
		if(lut_index<LUT_SIZE)
		begin
		o3WIRE_BUSY_n  <=  0;
			case(msetup_st)
			0:	begin
					msetup_st	<=	1;
				end
			1:	begin
					msetup_st	<=	2;
				end

			2:	begin
					m3wire_data	<=	lut_data;
					m3wire_str	<=	1;
					msetup_st	<=	3;
				end
			3:	begin
					if(m3wire_rdy)
					begin
						if(m3wire_ack)
						msetup_st	<=	4;
						else
						msetup_st	<=	0;							
						m3wire_str	<=	0;
					end
				end
			4:	begin
					lut_index	<=	lut_index+1;
					msetup_st	<=	0;
				end
			endcase
		end
		else 		o3WIRE_BUSY_n  <=  1;
	end
end

assign	g0 =106;
assign	g1 =200; 
assign	g2 =289; 
assign	g3 =375; 
assign	g4 =460; 
assign	g5 =543; 
assign	g6 =625; 
assign	g7 =705; 
assign	g8 =785; 
assign	g9 =864; 
assign	g10 = 942; 
assign	g11 = 1020;

/////////////////////	Config Data LUT	  //////////////////////////	
always
begin
	case(lut_index)
		0		:	lut_data	<=	{6'h11,2'b01,8'h15};
		1		:	lut_data	<=	{6'h12,2'b01,8'h6a};
		2		:	lut_data	<=	{6'h13,2'b01,8'hff};
		3		:	lut_data	<=	{6'h14,2'b01,8'h86};
		4		:	lut_data	<=	{6'h15,2'b01,8'h7c};
		5		:	lut_data	<=	{6'h16,2'b01,8'hc2};
		6		:	lut_data	<=	{6'h17,2'b01,8'hd1};
		7		:	lut_data	<=	{6'h18,2'b01,8'hf5};
		8		:	lut_data	<=	{6'h19,2'b01,8'h25};                                               
		9		:	lut_data	<=	{6'h1a,2'b01,8'h4a};
		10		:	lut_data	<=	{6'h1b,2'b01,8'hbf};
		11		:	lut_data	<=	{6'h1c,2'b01,8'h15};
		12		:	lut_data	<=	{6'h1d,2'b01,8'h6a};
		13		:	lut_data	<=	{6'h1e,2'b01,8'ha4};
		14		:	lut_data	<=	{6'h1f,2'b01,8'hff};
		15		:	lut_data	<=	{6'h20,2'b01,8'hf0};
		16		:	lut_data	<=	{6'h21,2'b01,8'hf0};	  
		17		:	lut_data	<=	{6'h22,2'b01,8'h08};
		18		:	lut_data	<=	{6'h03, 2'b01, 8'hdf};
		19		:	lut_data	<=	{6'h02, 2'b01, 8'h07};
		20		:	lut_data	<=	{6'h04, 2'b01, 6'b000101,v_reverse,h_reverse};
	
	default	:	lut_data	<=	16'h0000;
	endcase
end
////////////////////////////////////////////////////////////////////

endmodule