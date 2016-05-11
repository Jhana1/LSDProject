-- Copyright (C) 1991-2013 Altera Corporation
-- Your use of Altera Corporation's design tools, logic functions 
-- and other software and tools, and its AMPP partner logic 
-- functions, and any output files from any of the foregoing 
-- (including device programming or simulation files), and any 
-- associated documentation or information are expressly subject 
-- to the terms and conditions of the Altera Program License 
-- Subscription Agreement, Altera MegaCore Function License 
-- Agreement, or other applicable license agreement, including, 
-- without limitation, that your use is for the sole purpose of 
-- programming logic devices manufactured by Altera and sold by 
-- Altera or its authorized distributors.  Please refer to the 
-- applicable agreement for further details.

-- VENDOR "Altera"
-- PROGRAM "Quartus II 64-Bit"
-- VERSION "Version 13.0.1 Build 232 06/12/2013 Service Pack 1 SJ Full Version"

-- DATE "05/11/2016 15:06:43"

-- 
-- Device: Altera EP2C70F896C6 Package FBGA896
-- 

-- 
-- This VHDL file should be used for ModelSim-Altera (VHDL) only
-- 

LIBRARY CYCLONEII;
LIBRARY IEEE;
USE CYCLONEII.CYCLONEII_COMPONENTS.ALL;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY 	Arbitrator IS
    PORT (
	iClk : IN std_logic;
	iRst_n : IN std_logic;
	iSelect : IN std_logic_vector(2 DOWNTO 0);
	iRGB_valid : IN std_logic;
	iRGB_R : IN std_logic_vector(7 DOWNTO 0);
	iRGB_G : IN std_logic_vector(7 DOWNTO 0);
	iRGB_B : IN std_logic_vector(7 DOWNTO 0);
	iGray_valid : IN std_logic;
	iGray : IN std_logic_vector(7 DOWNTO 0);
	iHist_valid : IN std_logic;
	iHist : IN std_logic_vector(7 DOWNTO 0);
	iThresh_valid : IN std_logic;
	iThresh : IN std_logic_vector(7 DOWNTO 0);
	oWr1_valid : OUT std_logic;
	oWr2_valid : OUT std_logic;
	oWr1_data : OUT std_logic_vector(15 DOWNTO 0);
	oWr2_data : OUT std_logic_vector(15 DOWNTO 0)
	);
END Arbitrator;

-- Design Ports Information
-- oWr1_valid	=>  Location: PIN_AJ22,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- oWr2_valid	=>  Location: PIN_AG10,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- oWr1_data[0]	=>  Location: PIN_W23,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- oWr1_data[1]	=>  Location: PIN_C5,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- oWr1_data[2]	=>  Location: PIN_AG12,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- oWr1_data[3]	=>  Location: PIN_AJ10,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- oWr1_data[4]	=>  Location: PIN_AJ16,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- oWr1_data[5]	=>  Location: PIN_AJ12,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- oWr1_data[6]	=>  Location: PIN_AJ24,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- oWr1_data[7]	=>  Location: PIN_AE19,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- oWr1_data[8]	=>  Location: PIN_AH12,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- oWr1_data[9]	=>  Location: PIN_AJ15,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- oWr1_data[10]	=>  Location: PIN_AE17,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- oWr1_data[11]	=>  Location: PIN_AK23,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- oWr1_data[12]	=>  Location: PIN_AD19,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- oWr1_data[13]	=>  Location: PIN_AJ11,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- oWr1_data[14]	=>  Location: PIN_AD14,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- oWr1_data[15]	=>  Location: PIN_AJ7,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- oWr2_data[0]	=>  Location: PIN_C10,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- oWr2_data[1]	=>  Location: PIN_AH3,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- oWr2_data[2]	=>  Location: PIN_AH13,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- oWr2_data[3]	=>  Location: PIN_AD13,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- oWr2_data[4]	=>  Location: PIN_AK14,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- oWr2_data[5]	=>  Location: PIN_AD16,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- oWr2_data[6]	=>  Location: PIN_AD12,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- oWr2_data[7]	=>  Location: PIN_AG14,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- oWr2_data[8]	=>  Location: PIN_AH15,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- oWr2_data[9]	=>  Location: PIN_AC13,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- oWr2_data[10]	=>  Location: PIN_Y30,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- oWr2_data[11]	=>  Location: PIN_AK28,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- oWr2_data[12]	=>  Location: PIN_AK11,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- oWr2_data[13]	=>  Location: PIN_AE15,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- oWr2_data[14]	=>  Location: PIN_AF21,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- oWr2_data[15]	=>  Location: PIN_B24,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- iRst_n	=>  Location: PIN_AK17,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- iClk	=>  Location: PIN_T2,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- iThresh_valid	=>  Location: PIN_AF16,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- iSelect[0]	=>  Location: PIN_AK21,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- iHist_valid	=>  Location: PIN_AH16,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- iSelect[1]	=>  Location: PIN_AH20,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- iGray_valid	=>  Location: PIN_AH22,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- iSelect[2]	=>  Location: PIN_AK22,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- iRGB_valid	=>  Location: PIN_AB18,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- iRGB_R[0]	=>  Location: PIN_AJ13,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- iThresh[0]	=>  Location: PIN_AG20,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- iHist[0]	=>  Location: PIN_AE20,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- iGray[0]	=>  Location: PIN_AJ9,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- iRGB_R[1]	=>  Location: PIN_AG22,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- iThresh[1]	=>  Location: PIN_AF20,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- iHist[1]	=>  Location: PIN_AF14,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- iGray[1]	=>  Location: PIN_AE16,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- iRGB_R[2]	=>  Location: PIN_AB19,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- iThresh[2]	=>  Location: PIN_AC18,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- iHist[2]	=>  Location: PIN_AC16,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- iGray[2]	=>  Location: PIN_AJ19,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- iRGB_R[3]	=>  Location: PIN_AG13,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- iThresh[3]	=>  Location: PIN_AF18,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- iHist[3]	=>  Location: PIN_AH9,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- iGray[3]	=>  Location: PIN_AB12,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- iRGB_R[4]	=>  Location: PIN_AK20,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- iThresh[4]	=>  Location: PIN_AD18,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- iHist[4]	=>  Location: PIN_AJ23,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- iGray[4]	=>  Location: PIN_AH18,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- iRGB_R[5]	=>  Location: PIN_AJ20,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- iThresh[5]	=>  Location: PIN_AG18,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- iHist[5]	=>  Location: PIN_AH17,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- iGray[5]	=>  Location: PIN_AC19,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- iRGB_R[6]	=>  Location: PIN_AJ14,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- iThresh[6]	=>  Location: PIN_AK19,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- iHist[6]	=>  Location: PIN_AF17,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- iGray[6]	=>  Location: PIN_AF12,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- iRGB_R[7]	=>  Location: PIN_AC14,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- iThresh[7]	=>  Location: PIN_AJ21,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- iHist[7]	=>  Location: PIN_AE13,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- iGray[7]	=>  Location: PIN_AG17,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- iRGB_G[3]	=>  Location: PIN_AK9,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- iRGB_G[4]	=>  Location: PIN_AJ17,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- iRGB_G[5]	=>  Location: PIN_AD17,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- iRGB_G[6]	=>  Location: PIN_AC17,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- iRGB_G[7]	=>  Location: PIN_AB13,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- iRGB_B[0]	=>  Location: PIN_AH10,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- iRGB_B[1]	=>  Location: PIN_AH19,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- iRGB_B[2]	=>  Location: PIN_AG16,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- iRGB_B[3]	=>  Location: PIN_AK12,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- iRGB_B[4]	=>  Location: PIN_AK10,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- iRGB_B[5]	=>  Location: PIN_AK24,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- iRGB_B[6]	=>  Location: PIN_AF15,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- iRGB_B[7]	=>  Location: PIN_AG19,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- iRGB_G[0]	=>  Location: PIN_AG9,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- iRGB_G[1]	=>  Location: PIN_AD20,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- iRGB_G[2]	=>  Location: PIN_AJ18,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default


ARCHITECTURE structure OF Arbitrator IS
SIGNAL gnd : std_logic := '0';
SIGNAL vcc : std_logic := '1';
SIGNAL unknown : std_logic := 'X';
SIGNAL devoe : std_logic := '1';
SIGNAL devclrn : std_logic := '1';
SIGNAL devpor : std_logic := '1';
SIGNAL ww_devoe : std_logic;
SIGNAL ww_devclrn : std_logic;
SIGNAL ww_devpor : std_logic;
SIGNAL ww_iClk : std_logic;
SIGNAL ww_iRst_n : std_logic;
SIGNAL ww_iSelect : std_logic_vector(2 DOWNTO 0);
SIGNAL ww_iRGB_valid : std_logic;
SIGNAL ww_iRGB_R : std_logic_vector(7 DOWNTO 0);
SIGNAL ww_iRGB_G : std_logic_vector(7 DOWNTO 0);
SIGNAL ww_iRGB_B : std_logic_vector(7 DOWNTO 0);
SIGNAL ww_iGray_valid : std_logic;
SIGNAL ww_iGray : std_logic_vector(7 DOWNTO 0);
SIGNAL ww_iHist_valid : std_logic;
SIGNAL ww_iHist : std_logic_vector(7 DOWNTO 0);
SIGNAL ww_iThresh_valid : std_logic;
SIGNAL ww_iThresh : std_logic_vector(7 DOWNTO 0);
SIGNAL ww_oWr1_valid : std_logic;
SIGNAL ww_oWr2_valid : std_logic;
SIGNAL ww_oWr1_data : std_logic_vector(15 DOWNTO 0);
SIGNAL ww_oWr2_data : std_logic_vector(15 DOWNTO 0);
SIGNAL \iClk~clkctrl_INCLK_bus\ : std_logic_vector(3 DOWNTO 0);
SIGNAL \rGray_valid~regout\ : std_logic;
SIGNAL \Mux2~0_combout\ : std_logic;
SIGNAL \rGray_valid~0_combout\ : std_logic;
SIGNAL \rGray~0_combout\ : std_logic;
SIGNAL \rRGB_R~1_combout\ : std_logic;
SIGNAL \rGray~1_combout\ : std_logic;
SIGNAL \rRGB_R~2_combout\ : std_logic;
SIGNAL \rGray~2_combout\ : std_logic;
SIGNAL \rRGB_R~3_combout\ : std_logic;
SIGNAL \rGray~3_combout\ : std_logic;
SIGNAL \rRGB_R~4_combout\ : std_logic;
SIGNAL \rGray~4_combout\ : std_logic;
SIGNAL \rThresh~5_combout\ : std_logic;
SIGNAL \rGray~5_combout\ : std_logic;
SIGNAL \rRGB_R~6_combout\ : std_logic;
SIGNAL \rGray~6_combout\ : std_logic;
SIGNAL \rRGB_G~1_combout\ : std_logic;
SIGNAL \rRGB_G~3_combout\ : std_logic;
SIGNAL \rRGB_G~4_combout\ : std_logic;
SIGNAL \rRGB_B~2_combout\ : std_logic;
SIGNAL \rRGB_B~3_combout\ : std_logic;
SIGNAL \rRGB_B~4_combout\ : std_logic;
SIGNAL \rRGB_B~7_combout\ : std_logic;
SIGNAL \rRGB_G~5_combout\ : std_logic;
SIGNAL \rRGB_G~6_combout\ : std_logic;
SIGNAL \rRGB_G~7_combout\ : std_logic;
SIGNAL \iGray_valid~combout\ : std_logic;
SIGNAL \rRGB_R[2]~feeder_combout\ : std_logic;
SIGNAL \iClk~combout\ : std_logic;
SIGNAL \iClk~clkctrl_outclk\ : std_logic;
SIGNAL \iThresh_valid~combout\ : std_logic;
SIGNAL \iRst_n~combout\ : std_logic;
SIGNAL \rThresh_valid~0_combout\ : std_logic;
SIGNAL \rThresh_valid~regout\ : std_logic;
SIGNAL \rSelect~2_combout\ : std_logic;
SIGNAL \rSelect~1_combout\ : std_logic;
SIGNAL \rSelect~0_combout\ : std_logic;
SIGNAL \iHist_valid~combout\ : std_logic;
SIGNAL \rHist_valid~0_combout\ : std_logic;
SIGNAL \rHist_valid~regout\ : std_logic;
SIGNAL \oWr1_valid~0_combout\ : std_logic;
SIGNAL \oWr1_valid~1_combout\ : std_logic;
SIGNAL \oWr1_valid~2_combout\ : std_logic;
SIGNAL \oWr1_valid~reg0_regout\ : std_logic;
SIGNAL \oWr2_valid~reg0_regout\ : std_logic;
SIGNAL \rRGB_R~0_combout\ : std_logic;
SIGNAL \rThresh~0_combout\ : std_logic;
SIGNAL \Mux7~0_combout\ : std_logic;
SIGNAL \disp_R[0]~0_combout\ : std_logic;
SIGNAL \rHist~0_combout\ : std_logic;
SIGNAL \Mux7~1_combout\ : std_logic;
SIGNAL \Mux7~2_combout\ : std_logic;
SIGNAL \iRGB_valid~combout\ : std_logic;
SIGNAL \rRGB_valid~0_combout\ : std_logic;
SIGNAL \rRGB_valid~regout\ : std_logic;
SIGNAL \disp_R[5]~8_combout\ : std_logic;
SIGNAL \disp_R[5]~9_combout\ : std_logic;
SIGNAL \rThresh~1_combout\ : std_logic;
SIGNAL \Mux6~0_combout\ : std_logic;
SIGNAL \disp_R[1]~1_combout\ : std_logic;
SIGNAL \rHist~1_combout\ : std_logic;
SIGNAL \Mux6~1_combout\ : std_logic;
SIGNAL \rThresh~2_combout\ : std_logic;
SIGNAL \Mux5~0_combout\ : std_logic;
SIGNAL \disp_R[2]~2_combout\ : std_logic;
SIGNAL \rHist~2_combout\ : std_logic;
SIGNAL \Mux5~1_combout\ : std_logic;
SIGNAL \rThresh~3_combout\ : std_logic;
SIGNAL \Mux4~0_combout\ : std_logic;
SIGNAL \disp_R[3]~3_combout\ : std_logic;
SIGNAL \rHist~3_combout\ : std_logic;
SIGNAL \Mux4~1_combout\ : std_logic;
SIGNAL \rThresh~4_combout\ : std_logic;
SIGNAL \Mux3~0_combout\ : std_logic;
SIGNAL \disp_R[4]~4_combout\ : std_logic;
SIGNAL \rHist~4_combout\ : std_logic;
SIGNAL \Mux3~1_combout\ : std_logic;
SIGNAL \rRGB_R~5_combout\ : std_logic;
SIGNAL \disp_R[5]~5_combout\ : std_logic;
SIGNAL \rHist~5_combout\ : std_logic;
SIGNAL \Mux2~1_combout\ : std_logic;
SIGNAL \rThresh~6_combout\ : std_logic;
SIGNAL \Mux1~0_combout\ : std_logic;
SIGNAL \disp_R[6]~6_combout\ : std_logic;
SIGNAL \rHist~6_combout\ : std_logic;
SIGNAL \Mux1~1_combout\ : std_logic;
SIGNAL \rRGB_R~7_combout\ : std_logic;
SIGNAL \rThresh~7_combout\ : std_logic;
SIGNAL \Mux0~0_combout\ : std_logic;
SIGNAL \disp_R[7]~7_combout\ : std_logic;
SIGNAL \rGray~7_combout\ : std_logic;
SIGNAL \Mux0~1_combout\ : std_logic;
SIGNAL \rRGB_G~0_combout\ : std_logic;
SIGNAL \disp_G[3]~0_combout\ : std_logic;
SIGNAL \disp_G[4]~1_combout\ : std_logic;
SIGNAL \rRGB_G~2_combout\ : std_logic;
SIGNAL \disp_G[5]~2_combout\ : std_logic;
SIGNAL \disp_G[6]~3_combout\ : std_logic;
SIGNAL \disp_G[7]~4_combout\ : std_logic;
SIGNAL \rRGB_B~0_combout\ : std_logic;
SIGNAL \disp_B[0]~0_combout\ : std_logic;
SIGNAL \disp_B[4]~8_combout\ : std_logic;
SIGNAL \disp_B[4]~9_combout\ : std_logic;
SIGNAL \rRGB_B~1_combout\ : std_logic;
SIGNAL \disp_B[1]~1_combout\ : std_logic;
SIGNAL \disp_B[2]~2_combout\ : std_logic;
SIGNAL \disp_B[3]~3_combout\ : std_logic;
SIGNAL \disp_B[4]~4_combout\ : std_logic;
SIGNAL \rRGB_B~5_combout\ : std_logic;
SIGNAL \disp_B[5]~5_combout\ : std_logic;
SIGNAL \rRGB_B~6_combout\ : std_logic;
SIGNAL \disp_B[6]~6_combout\ : std_logic;
SIGNAL \rHist~7_combout\ : std_logic;
SIGNAL \disp_B[7]~7_combout\ : std_logic;
SIGNAL \disp_G[0]~5_combout\ : std_logic;
SIGNAL \disp_G[1]~6_combout\ : std_logic;
SIGNAL \disp_G[2]~7_combout\ : std_logic;
SIGNAL rThresh : std_logic_vector(7 DOWNTO 0);
SIGNAL rSelect : std_logic_vector(2 DOWNTO 0);
SIGNAL rRGB_R : std_logic_vector(7 DOWNTO 0);
SIGNAL rRGB_G : std_logic_vector(7 DOWNTO 0);
SIGNAL rRGB_B : std_logic_vector(7 DOWNTO 0);
SIGNAL rHist : std_logic_vector(7 DOWNTO 0);
SIGNAL rGray : std_logic_vector(7 DOWNTO 0);
SIGNAL disp_R : std_logic_vector(7 DOWNTO 0);
SIGNAL disp_G : std_logic_vector(7 DOWNTO 0);
SIGNAL disp_B : std_logic_vector(7 DOWNTO 0);
SIGNAL \iThresh~combout\ : std_logic_vector(7 DOWNTO 0);
SIGNAL \iSelect~combout\ : std_logic_vector(2 DOWNTO 0);
SIGNAL \iRGB_R~combout\ : std_logic_vector(7 DOWNTO 0);
SIGNAL \iRGB_G~combout\ : std_logic_vector(7 DOWNTO 0);
SIGNAL \iRGB_B~combout\ : std_logic_vector(7 DOWNTO 0);
SIGNAL \iHist~combout\ : std_logic_vector(7 DOWNTO 0);
SIGNAL \iGray~combout\ : std_logic_vector(7 DOWNTO 0);

BEGIN

ww_iClk <= iClk;
ww_iRst_n <= iRst_n;
ww_iSelect <= iSelect;
ww_iRGB_valid <= iRGB_valid;
ww_iRGB_R <= iRGB_R;
ww_iRGB_G <= iRGB_G;
ww_iRGB_B <= iRGB_B;
ww_iGray_valid <= iGray_valid;
ww_iGray <= iGray;
ww_iHist_valid <= iHist_valid;
ww_iHist <= iHist;
ww_iThresh_valid <= iThresh_valid;
ww_iThresh <= iThresh;
oWr1_valid <= ww_oWr1_valid;
oWr2_valid <= ww_oWr2_valid;
oWr1_data <= ww_oWr1_data;
oWr2_data <= ww_oWr2_data;
ww_devoe <= devoe;
ww_devclrn <= devclrn;
ww_devpor <= devpor;

\iClk~clkctrl_INCLK_bus\ <= (gnd & gnd & gnd & \iClk~combout\);

-- Location: LCFF_X51_Y7_N13
rGray_valid : cycloneii_lcell_ff
PORT MAP (
	clk => \iClk~clkctrl_outclk\,
	datain => \rGray_valid~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \rGray_valid~regout\);

-- Location: LCFF_X49_Y7_N21
\rGray[0]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \iClk~clkctrl_outclk\,
	datain => \rGray~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => rGray(0));

-- Location: LCFF_X53_Y7_N31
\rRGB_R[1]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \iClk~clkctrl_outclk\,
	datain => \rRGB_R~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => rRGB_R(1));

-- Location: LCFF_X50_Y7_N7
\rGray[1]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \iClk~clkctrl_outclk\,
	datain => \rGray~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => rGray(1));

-- Location: LCFF_X58_Y7_N25
\rRGB_R[2]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \iClk~clkctrl_outclk\,
	datain => \rRGB_R[2]~feeder_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => rRGB_R(2));

-- Location: LCFF_X53_Y7_N13
\rGray[2]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \iClk~clkctrl_outclk\,
	datain => \rGray~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => rGray(2));

-- Location: LCFF_X48_Y7_N17
\rRGB_R[3]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \iClk~clkctrl_outclk\,
	datain => \rRGB_R~3_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => rRGB_R(3));

-- Location: LCFF_X49_Y7_N13
\rGray[3]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \iClk~clkctrl_outclk\,
	datain => \rGray~3_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => rGray(3));

-- Location: LCFF_X53_Y7_N11
\rRGB_R[4]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \iClk~clkctrl_outclk\,
	datain => \rRGB_R~4_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => rRGB_R(4));

-- Location: LCFF_X53_Y7_N17
\rGray[4]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \iClk~clkctrl_outclk\,
	datain => \rGray~4_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => rGray(4));

-- Location: LCFF_X51_Y7_N17
\rThresh[5]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \iClk~clkctrl_outclk\,
	sdata => \rThresh~5_combout\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => rThresh(5));

-- Location: LCCOMB_X51_Y7_N16
\Mux2~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \Mux2~0_combout\ = (!rSelect(0) & (rThresh(5) & \rThresh_valid~regout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => rSelect(0),
	datac => rThresh(5),
	datad => \rThresh_valid~regout\,
	combout => \Mux2~0_combout\);

-- Location: LCFF_X51_Y7_N27
\rGray[5]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \iClk~clkctrl_outclk\,
	datain => \rGray~5_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => rGray(5));

-- Location: LCFF_X48_Y7_N21
\rRGB_R[6]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \iClk~clkctrl_outclk\,
	datain => \rRGB_R~6_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => rRGB_R(6));

-- Location: LCFF_X49_Y7_N17
\rGray[6]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \iClk~clkctrl_outclk\,
	datain => \rGray~6_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => rGray(6));

-- Location: LCFF_X53_Y7_N19
\rRGB_G[4]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \iClk~clkctrl_outclk\,
	datain => \rRGB_G~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => rRGB_G(4));

-- Location: LCFF_X52_Y7_N17
\rRGB_G[6]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \iClk~clkctrl_outclk\,
	datain => \rRGB_G~3_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => rRGB_G(6));

-- Location: LCFF_X48_Y7_N13
\rRGB_G[7]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \iClk~clkctrl_outclk\,
	datain => \rRGB_G~4_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => rRGB_G(7));

-- Location: LCFF_X53_Y7_N9
\rRGB_B[2]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \iClk~clkctrl_outclk\,
	datain => \rRGB_B~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => rRGB_B(2));

-- Location: LCFF_X49_Y4_N21
\rRGB_B[3]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \iClk~clkctrl_outclk\,
	datain => \rRGB_B~3_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => rRGB_B(3));

-- Location: LCFF_X49_Y4_N11
\rRGB_B[4]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \iClk~clkctrl_outclk\,
	datain => \rRGB_B~4_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => rRGB_B(4));

-- Location: LCFF_X53_Y7_N1
\rRGB_B[7]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \iClk~clkctrl_outclk\,
	datain => \rRGB_B~7_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => rRGB_B(7));

-- Location: LCFF_X48_Y7_N11
\rRGB_G[0]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \iClk~clkctrl_outclk\,
	datain => \rRGB_G~5_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => rRGB_G(0));

-- Location: LCFF_X53_Y7_N3
\rRGB_G[1]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \iClk~clkctrl_outclk\,
	datain => \rRGB_G~6_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => rRGB_G(1));

-- Location: LCFF_X53_Y7_N29
\rRGB_G[2]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \iClk~clkctrl_outclk\,
	datain => \rRGB_G~7_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => rRGB_G(2));

-- Location: LCCOMB_X51_Y7_N12
\rGray_valid~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \rGray_valid~0_combout\ = (\iRst_n~combout\ & \iGray_valid~combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \iRst_n~combout\,
	datad => \iGray_valid~combout\,
	combout => \rGray_valid~0_combout\);

-- Location: LCCOMB_X49_Y7_N20
\rGray~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \rGray~0_combout\ = (\iGray~combout\(0) & \iRst_n~combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \iGray~combout\(0),
	datad => \iRst_n~combout\,
	combout => \rGray~0_combout\);

-- Location: LCCOMB_X53_Y7_N30
\rRGB_R~1\ : cycloneii_lcell_comb
-- Equation(s):
-- \rRGB_R~1_combout\ = (\iRst_n~combout\ & \iRGB_R~combout\(1))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \iRst_n~combout\,
	datad => \iRGB_R~combout\(1),
	combout => \rRGB_R~1_combout\);

-- Location: LCCOMB_X50_Y7_N6
\rGray~1\ : cycloneii_lcell_comb
-- Equation(s):
-- \rGray~1_combout\ = (\iRst_n~combout\ & \iGray~combout\(1))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \iRst_n~combout\,
	datad => \iGray~combout\(1),
	combout => \rGray~1_combout\);

-- Location: LCCOMB_X59_Y4_N4
\rRGB_R~2\ : cycloneii_lcell_comb
-- Equation(s):
-- \rRGB_R~2_combout\ = (\iRGB_R~combout\(2) & \iRst_n~combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100000011000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \iRGB_R~combout\(2),
	datac => \iRst_n~combout\,
	combout => \rRGB_R~2_combout\);

-- Location: LCCOMB_X53_Y7_N12
\rGray~2\ : cycloneii_lcell_comb
-- Equation(s):
-- \rGray~2_combout\ = (\iRst_n~combout\ & \iGray~combout\(2))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \iRst_n~combout\,
	datad => \iGray~combout\(2),
	combout => \rGray~2_combout\);

-- Location: LCCOMB_X48_Y7_N16
\rRGB_R~3\ : cycloneii_lcell_comb
-- Equation(s):
-- \rRGB_R~3_combout\ = (\iRGB_R~combout\(3) & \iRst_n~combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \iRGB_R~combout\(3),
	datad => \iRst_n~combout\,
	combout => \rRGB_R~3_combout\);

-- Location: LCCOMB_X49_Y7_N12
\rGray~3\ : cycloneii_lcell_comb
-- Equation(s):
-- \rGray~3_combout\ = (\iGray~combout\(3) & \iRst_n~combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \iGray~combout\(3),
	datad => \iRst_n~combout\,
	combout => \rGray~3_combout\);

-- Location: LCCOMB_X53_Y7_N10
\rRGB_R~4\ : cycloneii_lcell_comb
-- Equation(s):
-- \rRGB_R~4_combout\ = (\iRst_n~combout\ & \iRGB_R~combout\(4))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \iRst_n~combout\,
	datad => \iRGB_R~combout\(4),
	combout => \rRGB_R~4_combout\);

-- Location: LCCOMB_X53_Y7_N16
\rGray~4\ : cycloneii_lcell_comb
-- Equation(s):
-- \rGray~4_combout\ = (\iRst_n~combout\ & \iGray~combout\(4))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \iRst_n~combout\,
	datad => \iGray~combout\(4),
	combout => \rGray~4_combout\);

-- Location: LCCOMB_X59_Y4_N24
\rThresh~5\ : cycloneii_lcell_comb
-- Equation(s):
-- \rThresh~5_combout\ = (\iRst_n~combout\ & \iThresh~combout\(5))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \iRst_n~combout\,
	datad => \iThresh~combout\(5),
	combout => \rThresh~5_combout\);

-- Location: LCCOMB_X51_Y7_N26
\rGray~5\ : cycloneii_lcell_comb
-- Equation(s):
-- \rGray~5_combout\ = (\iRst_n~combout\ & \iGray~combout\(5))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \iRst_n~combout\,
	datad => \iGray~combout\(5),
	combout => \rGray~5_combout\);

-- Location: LCCOMB_X48_Y7_N20
\rRGB_R~6\ : cycloneii_lcell_comb
-- Equation(s):
-- \rRGB_R~6_combout\ = (\iRGB_R~combout\(6) & \iRst_n~combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \iRGB_R~combout\(6),
	datad => \iRst_n~combout\,
	combout => \rRGB_R~6_combout\);

-- Location: LCCOMB_X49_Y7_N16
\rGray~6\ : cycloneii_lcell_comb
-- Equation(s):
-- \rGray~6_combout\ = (\iGray~combout\(6) & \iRst_n~combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \iGray~combout\(6),
	datad => \iRst_n~combout\,
	combout => \rGray~6_combout\);

-- Location: LCCOMB_X53_Y7_N18
\rRGB_G~1\ : cycloneii_lcell_comb
-- Equation(s):
-- \rRGB_G~1_combout\ = (\iRst_n~combout\ & \iRGB_G~combout\(4))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100000011000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \iRst_n~combout\,
	datac => \iRGB_G~combout\(4),
	combout => \rRGB_G~1_combout\);

-- Location: LCCOMB_X52_Y7_N16
\rRGB_G~3\ : cycloneii_lcell_comb
-- Equation(s):
-- \rRGB_G~3_combout\ = (\iRst_n~combout\ & \iRGB_G~combout\(6))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \iRst_n~combout\,
	datad => \iRGB_G~combout\(6),
	combout => \rRGB_G~3_combout\);

-- Location: LCCOMB_X48_Y7_N12
\rRGB_G~4\ : cycloneii_lcell_comb
-- Equation(s):
-- \rRGB_G~4_combout\ = (\iRGB_G~combout\(7) & \iRst_n~combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \iRGB_G~combout\(7),
	datad => \iRst_n~combout\,
	combout => \rRGB_G~4_combout\);

-- Location: LCCOMB_X53_Y7_N8
\rRGB_B~2\ : cycloneii_lcell_comb
-- Equation(s):
-- \rRGB_B~2_combout\ = (\iRst_n~combout\ & \iRGB_B~combout\(2))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100000011000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \iRst_n~combout\,
	datac => \iRGB_B~combout\(2),
	combout => \rRGB_B~2_combout\);

-- Location: LCCOMB_X49_Y4_N20
\rRGB_B~3\ : cycloneii_lcell_comb
-- Equation(s):
-- \rRGB_B~3_combout\ = (\iRGB_B~combout\(3) & \iRst_n~combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100000011000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \iRGB_B~combout\(3),
	datac => \iRst_n~combout\,
	combout => \rRGB_B~3_combout\);

-- Location: LCCOMB_X49_Y4_N10
\rRGB_B~4\ : cycloneii_lcell_comb
-- Equation(s):
-- \rRGB_B~4_combout\ = (\iRst_n~combout\ & \iRGB_B~combout\(4))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100000011000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \iRst_n~combout\,
	datac => \iRGB_B~combout\(4),
	combout => \rRGB_B~4_combout\);

-- Location: LCCOMB_X53_Y7_N0
\rRGB_B~7\ : cycloneii_lcell_comb
-- Equation(s):
-- \rRGB_B~7_combout\ = (\iRGB_B~combout\(7) & \iRst_n~combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100000011000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \iRGB_B~combout\(7),
	datac => \iRst_n~combout\,
	combout => \rRGB_B~7_combout\);

-- Location: LCCOMB_X48_Y7_N10
\rRGB_G~5\ : cycloneii_lcell_comb
-- Equation(s):
-- \rRGB_G~5_combout\ = (\iRGB_G~combout\(0) & \iRst_n~combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \iRGB_G~combout\(0),
	datad => \iRst_n~combout\,
	combout => \rRGB_G~5_combout\);

-- Location: LCCOMB_X53_Y7_N2
\rRGB_G~6\ : cycloneii_lcell_comb
-- Equation(s):
-- \rRGB_G~6_combout\ = (\iRGB_G~combout\(1) & \iRst_n~combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100000011000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \iRGB_G~combout\(1),
	datac => \iRst_n~combout\,
	combout => \rRGB_G~6_combout\);

-- Location: LCCOMB_X53_Y7_N28
\rRGB_G~7\ : cycloneii_lcell_comb
-- Equation(s):
-- \rRGB_G~7_combout\ = (\iRst_n~combout\ & \iRGB_G~combout\(2))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \iRst_n~combout\,
	datad => \iRGB_G~combout\(2),
	combout => \rRGB_G~7_combout\);

-- Location: PIN_AH22,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\iGray_valid~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "input",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	padio => ww_iGray_valid,
	combout => \iGray_valid~combout\);

-- Location: PIN_AE20,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\iHist[0]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "input",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	padio => ww_iHist(0),
	combout => \iHist~combout\(0));

-- Location: PIN_AJ9,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\iGray[0]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "input",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	padio => ww_iGray(0),
	combout => \iGray~combout\(0));

-- Location: PIN_AG22,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\iRGB_R[1]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "input",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	padio => ww_iRGB_R(1),
	combout => \iRGB_R~combout\(1));

-- Location: PIN_AE16,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\iGray[1]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "input",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	padio => ww_iGray(1),
	combout => \iGray~combout\(1));

-- Location: PIN_AB19,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\iRGB_R[2]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "input",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	padio => ww_iRGB_R(2),
	combout => \iRGB_R~combout\(2));

-- Location: PIN_AJ19,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\iGray[2]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "input",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	padio => ww_iGray(2),
	combout => \iGray~combout\(2));

-- Location: PIN_AG13,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\iRGB_R[3]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "input",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	padio => ww_iRGB_R(3),
	combout => \iRGB_R~combout\(3));

-- Location: PIN_AH9,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\iHist[3]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "input",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	padio => ww_iHist(3),
	combout => \iHist~combout\(3));

-- Location: PIN_AB12,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\iGray[3]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "input",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	padio => ww_iGray(3),
	combout => \iGray~combout\(3));

-- Location: PIN_AK20,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\iRGB_R[4]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "input",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	padio => ww_iRGB_R(4),
	combout => \iRGB_R~combout\(4));

-- Location: PIN_AH18,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\iGray[4]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "input",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	padio => ww_iGray(4),
	combout => \iGray~combout\(4));

-- Location: PIN_AJ20,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\iRGB_R[5]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "input",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	padio => ww_iRGB_R(5),
	combout => \iRGB_R~combout\(5));

-- Location: PIN_AG18,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\iThresh[5]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "input",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	padio => ww_iThresh(5),
	combout => \iThresh~combout\(5));

-- Location: PIN_AC19,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\iGray[5]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "input",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	padio => ww_iGray(5),
	combout => \iGray~combout\(5));

-- Location: PIN_AJ14,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\iRGB_R[6]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "input",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	padio => ww_iRGB_R(6),
	combout => \iRGB_R~combout\(6));

-- Location: PIN_AF12,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\iGray[6]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "input",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	padio => ww_iGray(6),
	combout => \iGray~combout\(6));

-- Location: PIN_AJ17,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\iRGB_G[4]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "input",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	padio => ww_iRGB_G(4),
	combout => \iRGB_G~combout\(4));

-- Location: PIN_AC17,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\iRGB_G[6]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "input",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	padio => ww_iRGB_G(6),
	combout => \iRGB_G~combout\(6));

-- Location: PIN_AB13,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\iRGB_G[7]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "input",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	padio => ww_iRGB_G(7),
	combout => \iRGB_G~combout\(7));

-- Location: PIN_AH19,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\iRGB_B[1]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "input",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	padio => ww_iRGB_B(1),
	combout => \iRGB_B~combout\(1));

-- Location: PIN_AG16,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\iRGB_B[2]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "input",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	padio => ww_iRGB_B(2),
	combout => \iRGB_B~combout\(2));

-- Location: PIN_AK12,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\iRGB_B[3]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "input",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	padio => ww_iRGB_B(3),
	combout => \iRGB_B~combout\(3));

-- Location: PIN_AK10,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\iRGB_B[4]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "input",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	padio => ww_iRGB_B(4),
	combout => \iRGB_B~combout\(4));

-- Location: PIN_AG19,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\iRGB_B[7]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "input",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	padio => ww_iRGB_B(7),
	combout => \iRGB_B~combout\(7));

-- Location: PIN_AG9,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\iRGB_G[0]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "input",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	padio => ww_iRGB_G(0),
	combout => \iRGB_G~combout\(0));

-- Location: PIN_AD20,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\iRGB_G[1]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "input",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	padio => ww_iRGB_G(1),
	combout => \iRGB_G~combout\(1));

-- Location: PIN_AJ18,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\iRGB_G[2]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "input",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	padio => ww_iRGB_G(2),
	combout => \iRGB_G~combout\(2));

-- Location: LCCOMB_X58_Y7_N24
\rRGB_R[2]~feeder\ : cycloneii_lcell_comb
-- Equation(s):
-- \rRGB_R[2]~feeder_combout\ = \rRGB_R~2_combout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \rRGB_R~2_combout\,
	combout => \rRGB_R[2]~feeder_combout\);

-- Location: PIN_T2,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\iClk~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "input",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	padio => ww_iClk,
	combout => \iClk~combout\);

-- Location: CLKCTRL_G3
\iClk~clkctrl\ : cycloneii_clkctrl
-- pragma translate_off
GENERIC MAP (
	clock_type => "global clock",
	ena_register_mode => "none")
-- pragma translate_on
PORT MAP (
	inclk => \iClk~clkctrl_INCLK_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	outclk => \iClk~clkctrl_outclk\);

-- Location: PIN_AF16,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\iThresh_valid~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "input",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	padio => ww_iThresh_valid,
	combout => \iThresh_valid~combout\);

-- Location: PIN_AK17,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\iRst_n~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "input",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	padio => ww_iRst_n,
	combout => \iRst_n~combout\);

-- Location: LCCOMB_X52_Y7_N14
\rThresh_valid~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \rThresh_valid~0_combout\ = (\iThresh_valid~combout\ & \iRst_n~combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \iThresh_valid~combout\,
	datad => \iRst_n~combout\,
	combout => \rThresh_valid~0_combout\);

-- Location: LCFF_X51_Y7_N25
rThresh_valid : cycloneii_lcell_ff
PORT MAP (
	clk => \iClk~clkctrl_outclk\,
	sdata => \rThresh_valid~0_combout\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \rThresh_valid~regout\);

-- Location: PIN_AK22,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\iSelect[2]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "input",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	padio => ww_iSelect(2),
	combout => \iSelect~combout\(2));

-- Location: LCCOMB_X51_Y7_N0
\rSelect~2\ : cycloneii_lcell_comb
-- Equation(s):
-- \rSelect~2_combout\ = (\iRst_n~combout\ & \iSelect~combout\(2))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \iRst_n~combout\,
	datad => \iSelect~combout\(2),
	combout => \rSelect~2_combout\);

-- Location: LCFF_X51_Y7_N1
\rSelect[2]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \iClk~clkctrl_outclk\,
	datain => \rSelect~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => rSelect(2));

-- Location: PIN_AH20,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\iSelect[1]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "input",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	padio => ww_iSelect(1),
	combout => \iSelect~combout\(1));

-- Location: LCCOMB_X51_Y7_N30
\rSelect~1\ : cycloneii_lcell_comb
-- Equation(s):
-- \rSelect~1_combout\ = (\iRst_n~combout\ & \iSelect~combout\(1))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \iRst_n~combout\,
	datad => \iSelect~combout\(1),
	combout => \rSelect~1_combout\);

-- Location: LCFF_X51_Y7_N31
\rSelect[1]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \iClk~clkctrl_outclk\,
	datain => \rSelect~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => rSelect(1));

-- Location: PIN_AK21,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\iSelect[0]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "input",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	padio => ww_iSelect(0),
	combout => \iSelect~combout\(0));

-- Location: LCCOMB_X59_Y4_N28
\rSelect~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \rSelect~0_combout\ = (\iRst_n~combout\ & \iSelect~combout\(0))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \iRst_n~combout\,
	datad => \iSelect~combout\(0),
	combout => \rSelect~0_combout\);

-- Location: LCFF_X51_Y7_N3
\rSelect[0]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \iClk~clkctrl_outclk\,
	sdata => \rSelect~0_combout\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => rSelect(0));

-- Location: PIN_AH16,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\iHist_valid~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "input",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	padio => ww_iHist_valid,
	combout => \iHist_valid~combout\);

-- Location: LCCOMB_X51_Y7_N28
\rHist_valid~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \rHist_valid~0_combout\ = (\iRst_n~combout\ & \iHist_valid~combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100000011000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \iRst_n~combout\,
	datac => \iHist_valid~combout\,
	combout => \rHist_valid~0_combout\);

-- Location: LCFF_X51_Y7_N29
rHist_valid : cycloneii_lcell_ff
PORT MAP (
	clk => \iClk~clkctrl_outclk\,
	datain => \rHist_valid~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \rHist_valid~regout\);

-- Location: LCCOMB_X51_Y7_N6
\oWr1_valid~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \oWr1_valid~0_combout\ = (rSelect(0) & (((\rHist_valid~regout\) # (!rSelect(1))))) # (!rSelect(0) & (\rGray_valid~regout\ & (rSelect(1))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110110000101100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \rGray_valid~regout\,
	datab => rSelect(0),
	datac => rSelect(1),
	datad => \rHist_valid~regout\,
	combout => \oWr1_valid~0_combout\);

-- Location: LCCOMB_X51_Y7_N8
\oWr1_valid~1\ : cycloneii_lcell_comb
-- Equation(s):
-- \oWr1_valid~1_combout\ = (rSelect(2) & (((!rSelect(1) & !\oWr1_valid~0_combout\)))) # (!rSelect(2) & (\oWr1_valid~0_combout\ & ((\rRGB_valid~regout\) # (rSelect(1)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011001000001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \rRGB_valid~regout\,
	datab => rSelect(2),
	datac => rSelect(1),
	datad => \oWr1_valid~0_combout\,
	combout => \oWr1_valid~1_combout\);

-- Location: LCCOMB_X51_Y7_N14
\oWr1_valid~2\ : cycloneii_lcell_comb
-- Equation(s):
-- \oWr1_valid~2_combout\ = (\iRst_n~combout\ & (\oWr1_valid~1_combout\ & ((\rThresh_valid~regout\) # (\oWr1_valid~0_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010000010000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \iRst_n~combout\,
	datab => \rThresh_valid~regout\,
	datac => \oWr1_valid~1_combout\,
	datad => \oWr1_valid~0_combout\,
	combout => \oWr1_valid~2_combout\);

-- Location: LCFF_X51_Y7_N5
\oWr1_valid~reg0\ : cycloneii_lcell_ff
PORT MAP (
	clk => \iClk~clkctrl_outclk\,
	sdata => \oWr1_valid~2_combout\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \oWr1_valid~reg0_regout\);

-- Location: LCFF_X51_Y7_N15
\oWr2_valid~reg0\ : cycloneii_lcell_ff
PORT MAP (
	clk => \iClk~clkctrl_outclk\,
	datain => \oWr1_valid~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \oWr2_valid~reg0_regout\);

-- Location: PIN_AJ13,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\iRGB_R[0]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "input",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	padio => ww_iRGB_R(0),
	combout => \iRGB_R~combout\(0));

-- Location: LCCOMB_X48_Y7_N14
\rRGB_R~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \rRGB_R~0_combout\ = (\iRGB_R~combout\(0) & \iRst_n~combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \iRGB_R~combout\(0),
	datad => \iRst_n~combout\,
	combout => \rRGB_R~0_combout\);

-- Location: LCFF_X48_Y7_N15
\rRGB_R[0]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \iClk~clkctrl_outclk\,
	datain => \rRGB_R~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => rRGB_R(0));

-- Location: PIN_AG20,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\iThresh[0]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "input",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	padio => ww_iThresh(0),
	combout => \iThresh~combout\(0));

-- Location: LCCOMB_X59_Y4_N20
\rThresh~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \rThresh~0_combout\ = (\iRst_n~combout\ & \iThresh~combout\(0))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \iRst_n~combout\,
	datad => \iThresh~combout\(0),
	combout => \rThresh~0_combout\);

-- Location: LCFF_X52_Y7_N5
\rThresh[0]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \iClk~clkctrl_outclk\,
	sdata => \rThresh~0_combout\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => rThresh(0));

-- Location: LCCOMB_X52_Y7_N4
\Mux7~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \Mux7~0_combout\ = (!rSelect(0) & (rThresh(0) & \rThresh_valid~regout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => rSelect(0),
	datac => rThresh(0),
	datad => \rThresh_valid~regout\,
	combout => \Mux7~0_combout\);

-- Location: LCCOMB_X48_Y7_N8
\disp_R[0]~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \disp_R[0]~0_combout\ = (rSelect(2) & ((\Mux7~0_combout\))) # (!rSelect(2) & (rRGB_R(0)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110111001000100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => rSelect(2),
	datab => rRGB_R(0),
	datad => \Mux7~0_combout\,
	combout => \disp_R[0]~0_combout\);

-- Location: LCCOMB_X53_Y7_N20
\rHist~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \rHist~0_combout\ = (\iHist~combout\(0) & \iRst_n~combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010000010100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \iHist~combout\(0),
	datac => \iRst_n~combout\,
	combout => \rHist~0_combout\);

-- Location: LCFF_X53_Y7_N21
\rHist[0]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \iClk~clkctrl_outclk\,
	datain => \rHist~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => rHist(0));

-- Location: LCCOMB_X51_Y7_N2
\Mux7~1\ : cycloneii_lcell_comb
-- Equation(s):
-- \Mux7~1_combout\ = (!rSelect(2) & ((rSelect(0) & ((\rHist_valid~regout\))) # (!rSelect(0) & (\rGray_valid~regout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011001010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \rGray_valid~regout\,
	datab => \rHist_valid~regout\,
	datac => rSelect(0),
	datad => rSelect(2),
	combout => \Mux7~1_combout\);

-- Location: LCCOMB_X49_Y7_N14
\Mux7~2\ : cycloneii_lcell_comb
-- Equation(s):
-- \Mux7~2_combout\ = (\Mux7~1_combout\ & ((rSelect(0) & ((rHist(0)))) # (!rSelect(0) & (rGray(0)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110001000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => rGray(0),
	datab => rSelect(0),
	datac => rHist(0),
	datad => \Mux7~1_combout\,
	combout => \Mux7~2_combout\);

-- Location: PIN_AB18,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\iRGB_valid~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "input",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	padio => ww_iRGB_valid,
	combout => \iRGB_valid~combout\);

-- Location: LCCOMB_X59_Y4_N6
\rRGB_valid~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \rRGB_valid~0_combout\ = (\iRst_n~combout\ & \iRGB_valid~combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \iRst_n~combout\,
	datad => \iRGB_valid~combout\,
	combout => \rRGB_valid~0_combout\);

-- Location: LCFF_X51_Y7_N11
rRGB_valid : cycloneii_lcell_ff
PORT MAP (
	clk => \iClk~clkctrl_outclk\,
	sdata => \rRGB_valid~0_combout\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \rRGB_valid~regout\);

-- Location: LCCOMB_X51_Y7_N10
\disp_R[5]~8\ : cycloneii_lcell_comb
-- Equation(s):
-- \disp_R[5]~8_combout\ = (!rSelect(1) & (!rSelect(2) & ((!\rRGB_valid~regout\) # (!rSelect(0)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000010011",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => rSelect(0),
	datab => rSelect(1),
	datac => \rRGB_valid~regout\,
	datad => rSelect(2),
	combout => \disp_R[5]~8_combout\);

-- Location: LCCOMB_X51_Y7_N4
\disp_R[5]~9\ : cycloneii_lcell_comb
-- Equation(s):
-- \disp_R[5]~9_combout\ = (\disp_R[5]~8_combout\) # (!\iRst_n~combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100110011",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \iRst_n~combout\,
	datad => \disp_R[5]~8_combout\,
	combout => \disp_R[5]~9_combout\);

-- Location: LCFF_X48_Y7_N9
\disp_R[0]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \iClk~clkctrl_outclk\,
	datain => \disp_R[0]~0_combout\,
	sdata => \Mux7~2_combout\,
	sclr => \disp_R[5]~9_combout\,
	sload => rSelect(1),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => disp_R(0));

-- Location: PIN_AF20,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\iThresh[1]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "input",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	padio => ww_iThresh(1),
	combout => \iThresh~combout\(1));

-- Location: LCCOMB_X59_Y4_N22
\rThresh~1\ : cycloneii_lcell_comb
-- Equation(s):
-- \rThresh~1_combout\ = (\iRst_n~combout\ & \iThresh~combout\(1))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \iRst_n~combout\,
	datad => \iThresh~combout\(1),
	combout => \rThresh~1_combout\);

-- Location: LCFF_X52_Y7_N31
\rThresh[1]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \iClk~clkctrl_outclk\,
	sdata => \rThresh~1_combout\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => rThresh(1));

-- Location: LCCOMB_X52_Y7_N30
\Mux6~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \Mux6~0_combout\ = (!rSelect(0) & (rThresh(1) & \rThresh_valid~regout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => rSelect(0),
	datac => rThresh(1),
	datad => \rThresh_valid~regout\,
	combout => \Mux6~0_combout\);

-- Location: LCCOMB_X50_Y7_N4
\disp_R[1]~1\ : cycloneii_lcell_comb
-- Equation(s):
-- \disp_R[1]~1_combout\ = (rSelect(2) & ((\Mux6~0_combout\))) # (!rSelect(2) & (rRGB_R(1)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110111000100010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => rRGB_R(1),
	datab => rSelect(2),
	datad => \Mux6~0_combout\,
	combout => \disp_R[1]~1_combout\);

-- Location: PIN_AF14,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\iHist[1]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "input",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	padio => ww_iHist(1),
	combout => \iHist~combout\(1));

-- Location: LCCOMB_X49_Y7_N24
\rHist~1\ : cycloneii_lcell_comb
-- Equation(s):
-- \rHist~1_combout\ = (\iHist~combout\(1) & \iRst_n~combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \iHist~combout\(1),
	datad => \iRst_n~combout\,
	combout => \rHist~1_combout\);

-- Location: LCFF_X49_Y7_N25
\rHist[1]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \iClk~clkctrl_outclk\,
	datain => \rHist~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => rHist(1));

-- Location: LCCOMB_X50_Y7_N8
\Mux6~1\ : cycloneii_lcell_comb
-- Equation(s):
-- \Mux6~1_combout\ = (\Mux7~1_combout\ & ((rSelect(0) & ((rHist(1)))) # (!rSelect(0) & (rGray(1)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100101000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => rGray(1),
	datab => rHist(1),
	datac => rSelect(0),
	datad => \Mux7~1_combout\,
	combout => \Mux6~1_combout\);

-- Location: LCFF_X50_Y7_N5
\disp_R[1]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \iClk~clkctrl_outclk\,
	datain => \disp_R[1]~1_combout\,
	sdata => \Mux6~1_combout\,
	sclr => \disp_R[5]~9_combout\,
	sload => rSelect(1),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => disp_R(1));

-- Location: PIN_AC18,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\iThresh[2]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "input",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	padio => ww_iThresh(2),
	combout => \iThresh~combout\(2));

-- Location: LCCOMB_X59_Y4_N18
\rThresh~2\ : cycloneii_lcell_comb
-- Equation(s):
-- \rThresh~2_combout\ = (\iRst_n~combout\ & \iThresh~combout\(2))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \iRst_n~combout\,
	datad => \iThresh~combout\(2),
	combout => \rThresh~2_combout\);

-- Location: LCFF_X51_Y7_N19
\rThresh[2]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \iClk~clkctrl_outclk\,
	sdata => \rThresh~2_combout\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => rThresh(2));

-- Location: LCCOMB_X51_Y7_N18
\Mux5~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \Mux5~0_combout\ = (!rSelect(0) & (rThresh(2) & \rThresh_valid~regout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => rSelect(0),
	datac => rThresh(2),
	datad => \rThresh_valid~regout\,
	combout => \Mux5~0_combout\);

-- Location: LCCOMB_X50_Y7_N10
\disp_R[2]~2\ : cycloneii_lcell_comb
-- Equation(s):
-- \disp_R[2]~2_combout\ = (rSelect(2) & ((\Mux5~0_combout\))) # (!rSelect(2) & (rRGB_R(2)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110111000100010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => rRGB_R(2),
	datab => rSelect(2),
	datad => \Mux5~0_combout\,
	combout => \disp_R[2]~2_combout\);

-- Location: PIN_AC16,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\iHist[2]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "input",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	padio => ww_iHist(2),
	combout => \iHist~combout\(2));

-- Location: LCCOMB_X49_Y7_N18
\rHist~2\ : cycloneii_lcell_comb
-- Equation(s):
-- \rHist~2_combout\ = (\iHist~combout\(2) & \iRst_n~combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \iHist~combout\(2),
	datad => \iRst_n~combout\,
	combout => \rHist~2_combout\);

-- Location: LCFF_X49_Y7_N19
\rHist[2]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \iClk~clkctrl_outclk\,
	datain => \rHist~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => rHist(2));

-- Location: LCCOMB_X50_Y7_N14
\Mux5~1\ : cycloneii_lcell_comb
-- Equation(s):
-- \Mux5~1_combout\ = (\Mux7~1_combout\ & ((rSelect(0) & ((rHist(2)))) # (!rSelect(0) & (rGray(2)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100101000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => rGray(2),
	datab => rHist(2),
	datac => rSelect(0),
	datad => \Mux7~1_combout\,
	combout => \Mux5~1_combout\);

-- Location: LCFF_X50_Y7_N11
\disp_R[2]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \iClk~clkctrl_outclk\,
	datain => \disp_R[2]~2_combout\,
	sdata => \Mux5~1_combout\,
	sclr => \disp_R[5]~9_combout\,
	sload => rSelect(1),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => disp_R(2));

-- Location: PIN_AF18,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\iThresh[3]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "input",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	padio => ww_iThresh(3),
	combout => \iThresh~combout\(3));

-- Location: LCCOMB_X59_Y4_N8
\rThresh~3\ : cycloneii_lcell_comb
-- Equation(s):
-- \rThresh~3_combout\ = (\iRst_n~combout\ & \iThresh~combout\(3))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \iRst_n~combout\,
	datad => \iThresh~combout\(3),
	combout => \rThresh~3_combout\);

-- Location: LCFF_X51_Y7_N21
\rThresh[3]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \iClk~clkctrl_outclk\,
	sdata => \rThresh~3_combout\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => rThresh(3));

-- Location: LCCOMB_X51_Y7_N20
\Mux4~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \Mux4~0_combout\ = (\rThresh_valid~regout\ & (!rSelect(0) & rThresh(3)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0010000000100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \rThresh_valid~regout\,
	datab => rSelect(0),
	datac => rThresh(3),
	combout => \Mux4~0_combout\);

-- Location: LCCOMB_X48_Y7_N18
\disp_R[3]~3\ : cycloneii_lcell_comb
-- Equation(s):
-- \disp_R[3]~3_combout\ = (rSelect(2) & ((\Mux4~0_combout\))) # (!rSelect(2) & (rRGB_R(3)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110111000100010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => rRGB_R(3),
	datab => rSelect(2),
	datad => \Mux4~0_combout\,
	combout => \disp_R[3]~3_combout\);

-- Location: LCCOMB_X48_Y7_N26
\rHist~3\ : cycloneii_lcell_comb
-- Equation(s):
-- \rHist~3_combout\ = (\iHist~combout\(3) & \iRst_n~combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \iHist~combout\(3),
	datad => \iRst_n~combout\,
	combout => \rHist~3_combout\);

-- Location: LCFF_X48_Y7_N27
\rHist[3]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \iClk~clkctrl_outclk\,
	datain => \rHist~3_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => rHist(3));

-- Location: LCCOMB_X49_Y7_N30
\Mux4~1\ : cycloneii_lcell_comb
-- Equation(s):
-- \Mux4~1_combout\ = (\Mux7~1_combout\ & ((rSelect(0) & ((rHist(3)))) # (!rSelect(0) & (rGray(3)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100101000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => rGray(3),
	datab => rHist(3),
	datac => rSelect(0),
	datad => \Mux7~1_combout\,
	combout => \Mux4~1_combout\);

-- Location: LCFF_X48_Y7_N19
\disp_R[3]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \iClk~clkctrl_outclk\,
	datain => \disp_R[3]~3_combout\,
	sdata => \Mux4~1_combout\,
	sclr => \disp_R[5]~9_combout\,
	sload => rSelect(1),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => disp_R(3));

-- Location: PIN_AD18,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\iThresh[4]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "input",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	padio => ww_iThresh(4),
	combout => \iThresh~combout\(4));

-- Location: LCCOMB_X59_Y4_N10
\rThresh~4\ : cycloneii_lcell_comb
-- Equation(s):
-- \rThresh~4_combout\ = (\iRst_n~combout\ & \iThresh~combout\(4))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \iRst_n~combout\,
	datad => \iThresh~combout\(4),
	combout => \rThresh~4_combout\);

-- Location: LCFF_X51_Y7_N23
\rThresh[4]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \iClk~clkctrl_outclk\,
	sdata => \rThresh~4_combout\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => rThresh(4));

-- Location: LCCOMB_X51_Y7_N22
\Mux3~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \Mux3~0_combout\ = (!rSelect(0) & (rThresh(4) & \rThresh_valid~regout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => rSelect(0),
	datac => rThresh(4),
	datad => \rThresh_valid~regout\,
	combout => \Mux3~0_combout\);

-- Location: LCCOMB_X50_Y7_N20
\disp_R[4]~4\ : cycloneii_lcell_comb
-- Equation(s):
-- \disp_R[4]~4_combout\ = (rSelect(2) & ((\Mux3~0_combout\))) # (!rSelect(2) & (rRGB_R(4)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110111000100010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => rRGB_R(4),
	datab => rSelect(2),
	datad => \Mux3~0_combout\,
	combout => \disp_R[4]~4_combout\);

-- Location: PIN_AJ23,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\iHist[4]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "input",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	padio => ww_iHist(4),
	combout => \iHist~combout\(4));

-- Location: LCCOMB_X50_Y7_N0
\rHist~4\ : cycloneii_lcell_comb
-- Equation(s):
-- \rHist~4_combout\ = (\iRst_n~combout\ & \iHist~combout\(4))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \iRst_n~combout\,
	datad => \iHist~combout\(4),
	combout => \rHist~4_combout\);

-- Location: LCFF_X50_Y7_N1
\rHist[4]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \iClk~clkctrl_outclk\,
	datain => \rHist~4_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => rHist(4));

-- Location: LCCOMB_X50_Y7_N26
\Mux3~1\ : cycloneii_lcell_comb
-- Equation(s):
-- \Mux3~1_combout\ = (\Mux7~1_combout\ & ((rSelect(0) & ((rHist(4)))) # (!rSelect(0) & (rGray(4)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100101000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => rGray(4),
	datab => rHist(4),
	datac => rSelect(0),
	datad => \Mux7~1_combout\,
	combout => \Mux3~1_combout\);

-- Location: LCFF_X50_Y7_N21
\disp_R[4]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \iClk~clkctrl_outclk\,
	datain => \disp_R[4]~4_combout\,
	sdata => \Mux3~1_combout\,
	sclr => \disp_R[5]~9_combout\,
	sload => rSelect(1),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => disp_R(4));

-- Location: LCCOMB_X53_Y7_N26
\rRGB_R~5\ : cycloneii_lcell_comb
-- Equation(s):
-- \rRGB_R~5_combout\ = (\iRGB_R~combout\(5) & \iRst_n~combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010000010100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \iRGB_R~combout\(5),
	datac => \iRst_n~combout\,
	combout => \rRGB_R~5_combout\);

-- Location: LCFF_X53_Y7_N27
\rRGB_R[5]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \iClk~clkctrl_outclk\,
	datain => \rRGB_R~5_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => rRGB_R(5));

-- Location: LCCOMB_X50_Y7_N18
\disp_R[5]~5\ : cycloneii_lcell_comb
-- Equation(s):
-- \disp_R[5]~5_combout\ = (rSelect(2) & (\Mux2~0_combout\)) # (!rSelect(2) & ((rRGB_R(5))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011101110001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Mux2~0_combout\,
	datab => rSelect(2),
	datad => rRGB_R(5),
	combout => \disp_R[5]~5_combout\);

-- Location: PIN_AH17,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\iHist[5]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "input",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	padio => ww_iHist(5),
	combout => \iHist~combout\(5));

-- Location: LCCOMB_X52_Y7_N0
\rHist~5\ : cycloneii_lcell_comb
-- Equation(s):
-- \rHist~5_combout\ = (\iHist~combout\(5) & \iRst_n~combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \iHist~combout\(5),
	datad => \iRst_n~combout\,
	combout => \rHist~5_combout\);

-- Location: LCFF_X52_Y7_N1
\rHist[5]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \iClk~clkctrl_outclk\,
	datain => \rHist~5_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => rHist(5));

-- Location: LCCOMB_X50_Y7_N16
\Mux2~1\ : cycloneii_lcell_comb
-- Equation(s):
-- \Mux2~1_combout\ = (\Mux7~1_combout\ & ((rSelect(0) & ((rHist(5)))) # (!rSelect(0) & (rGray(5)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100101000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => rGray(5),
	datab => rHist(5),
	datac => rSelect(0),
	datad => \Mux7~1_combout\,
	combout => \Mux2~1_combout\);

-- Location: LCFF_X50_Y7_N19
\disp_R[5]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \iClk~clkctrl_outclk\,
	datain => \disp_R[5]~5_combout\,
	sdata => \Mux2~1_combout\,
	sclr => \disp_R[5]~9_combout\,
	sload => rSelect(1),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => disp_R(5));

-- Location: PIN_AK19,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\iThresh[6]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "input",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	padio => ww_iThresh(6),
	combout => \iThresh~combout\(6));

-- Location: LCCOMB_X53_Y7_N14
\rThresh~6\ : cycloneii_lcell_comb
-- Equation(s):
-- \rThresh~6_combout\ = (\iRst_n~combout\ & \iThresh~combout\(6))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \iRst_n~combout\,
	datad => \iThresh~combout\(6),
	combout => \rThresh~6_combout\);

-- Location: LCFF_X52_Y7_N7
\rThresh[6]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \iClk~clkctrl_outclk\,
	sdata => \rThresh~6_combout\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => rThresh(6));

-- Location: LCCOMB_X52_Y7_N6
\Mux1~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \Mux1~0_combout\ = (!rSelect(0) & (rThresh(6) & \rThresh_valid~regout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => rSelect(0),
	datac => rThresh(6),
	datad => \rThresh_valid~regout\,
	combout => \Mux1~0_combout\);

-- Location: LCCOMB_X48_Y7_N0
\disp_R[6]~6\ : cycloneii_lcell_comb
-- Equation(s):
-- \disp_R[6]~6_combout\ = (rSelect(2) & ((\Mux1~0_combout\))) # (!rSelect(2) & (rRGB_R(6)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110111000100010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => rRGB_R(6),
	datab => rSelect(2),
	datad => \Mux1~0_combout\,
	combout => \disp_R[6]~6_combout\);

-- Location: PIN_AF17,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\iHist[6]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "input",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	padio => ww_iHist(6),
	combout => \iHist~combout\(6));

-- Location: LCCOMB_X53_Y7_N4
\rHist~6\ : cycloneii_lcell_comb
-- Equation(s):
-- \rHist~6_combout\ = (\iRst_n~combout\ & \iHist~combout\(6))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \iRst_n~combout\,
	datad => \iHist~combout\(6),
	combout => \rHist~6_combout\);

-- Location: LCFF_X53_Y7_N5
\rHist[6]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \iClk~clkctrl_outclk\,
	datain => \rHist~6_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => rHist(6));

-- Location: LCCOMB_X49_Y7_N26
\Mux1~1\ : cycloneii_lcell_comb
-- Equation(s):
-- \Mux1~1_combout\ = (\Mux7~1_combout\ & ((rSelect(0) & ((rHist(6)))) # (!rSelect(0) & (rGray(6)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100101000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => rGray(6),
	datab => rHist(6),
	datac => rSelect(0),
	datad => \Mux7~1_combout\,
	combout => \Mux1~1_combout\);

-- Location: LCFF_X48_Y7_N1
\disp_R[6]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \iClk~clkctrl_outclk\,
	datain => \disp_R[6]~6_combout\,
	sdata => \Mux1~1_combout\,
	sclr => \disp_R[5]~9_combout\,
	sload => rSelect(1),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => disp_R(6));

-- Location: PIN_AC14,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\iRGB_R[7]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "input",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	padio => ww_iRGB_R(7),
	combout => \iRGB_R~combout\(7));

-- Location: LCCOMB_X48_Y7_N2
\rRGB_R~7\ : cycloneii_lcell_comb
-- Equation(s):
-- \rRGB_R~7_combout\ = (\iRGB_R~combout\(7) & \iRst_n~combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \iRGB_R~combout\(7),
	datad => \iRst_n~combout\,
	combout => \rRGB_R~7_combout\);

-- Location: LCFF_X48_Y7_N3
\rRGB_R[7]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \iClk~clkctrl_outclk\,
	datain => \rRGB_R~7_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => rRGB_R(7));

-- Location: PIN_AJ21,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\iThresh[7]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "input",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	padio => ww_iThresh(7),
	combout => \iThresh~combout\(7));

-- Location: LCCOMB_X59_Y4_N2
\rThresh~7\ : cycloneii_lcell_comb
-- Equation(s):
-- \rThresh~7_combout\ = (\iRst_n~combout\ & \iThresh~combout\(7))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \iRst_n~combout\,
	datad => \iThresh~combout\(7),
	combout => \rThresh~7_combout\);

-- Location: LCFF_X52_Y7_N21
\rThresh[7]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \iClk~clkctrl_outclk\,
	sdata => \rThresh~7_combout\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => rThresh(7));

-- Location: LCCOMB_X52_Y7_N20
\Mux0~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \Mux0~0_combout\ = (!rSelect(0) & (rThresh(7) & \rThresh_valid~regout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => rSelect(0),
	datac => rThresh(7),
	datad => \rThresh_valid~regout\,
	combout => \Mux0~0_combout\);

-- Location: LCCOMB_X48_Y7_N22
\disp_R[7]~7\ : cycloneii_lcell_comb
-- Equation(s):
-- \disp_R[7]~7_combout\ = (rSelect(2) & ((\Mux0~0_combout\))) # (!rSelect(2) & (rRGB_R(7)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110111001000100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => rSelect(2),
	datab => rRGB_R(7),
	datad => \Mux0~0_combout\,
	combout => \disp_R[7]~7_combout\);

-- Location: PIN_AG17,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\iGray[7]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "input",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	padio => ww_iGray(7),
	combout => \iGray~combout\(7));

-- Location: LCCOMB_X52_Y7_N26
\rGray~7\ : cycloneii_lcell_comb
-- Equation(s):
-- \rGray~7_combout\ = (\iGray~combout\(7) & \iRst_n~combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \iGray~combout\(7),
	datad => \iRst_n~combout\,
	combout => \rGray~7_combout\);

-- Location: LCFF_X52_Y7_N27
\rGray[7]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \iClk~clkctrl_outclk\,
	datain => \rGray~7_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => rGray(7));

-- Location: LCCOMB_X48_Y7_N30
\Mux0~1\ : cycloneii_lcell_comb
-- Equation(s):
-- \Mux0~1_combout\ = (\Mux7~1_combout\ & ((rSelect(0) & (rHist(7))) # (!rSelect(0) & ((rGray(7))))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011100000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => rHist(7),
	datab => rSelect(0),
	datac => rGray(7),
	datad => \Mux7~1_combout\,
	combout => \Mux0~1_combout\);

-- Location: LCFF_X48_Y7_N23
\disp_R[7]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \iClk~clkctrl_outclk\,
	datain => \disp_R[7]~7_combout\,
	sdata => \Mux0~1_combout\,
	sclr => \disp_R[5]~9_combout\,
	sload => rSelect(1),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => disp_R(7));

-- Location: PIN_AK9,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\iRGB_G[3]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "input",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	padio => ww_iRGB_G(3),
	combout => \iRGB_G~combout\(3));

-- Location: LCCOMB_X49_Y4_N4
\rRGB_G~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \rRGB_G~0_combout\ = (\iRst_n~combout\ & \iRGB_G~combout\(3))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100000011000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \iRst_n~combout\,
	datac => \iRGB_G~combout\(3),
	combout => \rRGB_G~0_combout\);

-- Location: LCFF_X49_Y4_N5
\rRGB_G[3]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \iClk~clkctrl_outclk\,
	datain => \rRGB_G~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => rRGB_G(3));

-- Location: LCCOMB_X50_Y7_N12
\disp_G[3]~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \disp_G[3]~0_combout\ = (rSelect(2) & (\Mux4~0_combout\)) # (!rSelect(2) & ((rRGB_G(3))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011101110001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Mux4~0_combout\,
	datab => rSelect(2),
	datad => rRGB_G(3),
	combout => \disp_G[3]~0_combout\);

-- Location: LCFF_X50_Y7_N13
\disp_G[3]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \iClk~clkctrl_outclk\,
	datain => \disp_G[3]~0_combout\,
	sdata => \Mux4~1_combout\,
	sclr => \disp_R[5]~9_combout\,
	sload => rSelect(1),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => disp_G(3));

-- Location: LCCOMB_X50_Y7_N2
\disp_G[4]~1\ : cycloneii_lcell_comb
-- Equation(s):
-- \disp_G[4]~1_combout\ = (rSelect(2) & ((\Mux3~0_combout\))) # (!rSelect(2) & (rRGB_G(4)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110111000100010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => rRGB_G(4),
	datab => rSelect(2),
	datad => \Mux3~0_combout\,
	combout => \disp_G[4]~1_combout\);

-- Location: LCFF_X50_Y7_N3
\disp_G[4]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \iClk~clkctrl_outclk\,
	datain => \disp_G[4]~1_combout\,
	sdata => \Mux3~1_combout\,
	sclr => \disp_R[5]~9_combout\,
	sload => rSelect(1),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => disp_G(4));

-- Location: PIN_AD17,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\iRGB_G[5]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "input",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	padio => ww_iRGB_G(5),
	combout => \iRGB_G~combout\(5));

-- Location: LCCOMB_X53_Y7_N24
\rRGB_G~2\ : cycloneii_lcell_comb
-- Equation(s):
-- \rRGB_G~2_combout\ = (\iRst_n~combout\ & \iRGB_G~combout\(5))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \iRst_n~combout\,
	datad => \iRGB_G~combout\(5),
	combout => \rRGB_G~2_combout\);

-- Location: LCFF_X53_Y7_N25
\rRGB_G[5]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \iClk~clkctrl_outclk\,
	datain => \rRGB_G~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => rRGB_G(5));

-- Location: LCCOMB_X50_Y7_N28
\disp_G[5]~2\ : cycloneii_lcell_comb
-- Equation(s):
-- \disp_G[5]~2_combout\ = (rSelect(2) & (\Mux2~0_combout\)) # (!rSelect(2) & ((rRGB_G(5))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011101110001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Mux2~0_combout\,
	datab => rSelect(2),
	datad => rRGB_G(5),
	combout => \disp_G[5]~2_combout\);

-- Location: LCFF_X50_Y7_N29
\disp_G[5]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \iClk~clkctrl_outclk\,
	datain => \disp_G[5]~2_combout\,
	sdata => \Mux2~1_combout\,
	sclr => \disp_R[5]~9_combout\,
	sload => rSelect(1),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => disp_G(5));

-- Location: LCCOMB_X48_Y7_N4
\disp_G[6]~3\ : cycloneii_lcell_comb
-- Equation(s):
-- \disp_G[6]~3_combout\ = (rSelect(2) & ((\Mux1~0_combout\))) # (!rSelect(2) & (rRGB_G(6)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110111000100010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => rRGB_G(6),
	datab => rSelect(2),
	datad => \Mux1~0_combout\,
	combout => \disp_G[6]~3_combout\);

-- Location: LCFF_X48_Y7_N5
\disp_G[6]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \iClk~clkctrl_outclk\,
	datain => \disp_G[6]~3_combout\,
	sdata => \Mux1~1_combout\,
	sclr => \disp_R[5]~9_combout\,
	sload => rSelect(1),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => disp_G(6));

-- Location: LCCOMB_X48_Y7_N6
\disp_G[7]~4\ : cycloneii_lcell_comb
-- Equation(s):
-- \disp_G[7]~4_combout\ = (rSelect(2) & ((\Mux0~0_combout\))) # (!rSelect(2) & (rRGB_G(7)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110111000100010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => rRGB_G(7),
	datab => rSelect(2),
	datad => \Mux0~0_combout\,
	combout => \disp_G[7]~4_combout\);

-- Location: LCFF_X48_Y7_N7
\disp_G[7]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \iClk~clkctrl_outclk\,
	datain => \disp_G[7]~4_combout\,
	sdata => \Mux0~1_combout\,
	sclr => \disp_R[5]~9_combout\,
	sload => rSelect(1),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => disp_G(7));

-- Location: PIN_AH10,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\iRGB_B[0]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "input",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	padio => ww_iRGB_B(0),
	combout => \iRGB_B~combout\(0));

-- Location: LCCOMB_X49_Y4_N26
\rRGB_B~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \rRGB_B~0_combout\ = (\iRst_n~combout\ & \iRGB_B~combout\(0))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100000011000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \iRst_n~combout\,
	datac => \iRGB_B~combout\(0),
	combout => \rRGB_B~0_combout\);

-- Location: LCFF_X49_Y4_N27
\rRGB_B[0]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \iClk~clkctrl_outclk\,
	datain => \rRGB_B~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => rRGB_B(0));

-- Location: LCCOMB_X49_Y7_N4
\disp_B[0]~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \disp_B[0]~0_combout\ = (rSelect(2) & (rHist(0))) # (!rSelect(2) & ((rRGB_B(0))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011101110001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => rHist(0),
	datab => rSelect(2),
	datad => rRGB_B(0),
	combout => \disp_B[0]~0_combout\);

-- Location: LCCOMB_X51_Y7_N24
\disp_B[4]~8\ : cycloneii_lcell_comb
-- Equation(s):
-- \disp_B[4]~8_combout\ = (rSelect(2) & (((\rThresh_valid~regout\ & !rSelect(0))))) # (!rSelect(2) & (\rRGB_valid~regout\ & ((rSelect(0)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0010001011000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \rRGB_valid~regout\,
	datab => rSelect(2),
	datac => \rThresh_valid~regout\,
	datad => rSelect(0),
	combout => \disp_B[4]~8_combout\);

-- Location: LCCOMB_X50_Y7_N30
\disp_B[4]~9\ : cycloneii_lcell_comb
-- Equation(s):
-- \disp_B[4]~9_combout\ = ((!rSelect(1) & !\disp_B[4]~8_combout\)) # (!\iRst_n~combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101010101110111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \iRst_n~combout\,
	datab => rSelect(1),
	datad => \disp_B[4]~8_combout\,
	combout => \disp_B[4]~9_combout\);

-- Location: LCFF_X49_Y7_N5
\disp_B[0]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \iClk~clkctrl_outclk\,
	datain => \disp_B[0]~0_combout\,
	sdata => \Mux7~2_combout\,
	sclr => \disp_B[4]~9_combout\,
	sload => rSelect(1),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => disp_B(0));

-- Location: LCCOMB_X53_Y7_N6
\rRGB_B~1\ : cycloneii_lcell_comb
-- Equation(s):
-- \rRGB_B~1_combout\ = (\iRGB_B~combout\(1) & \iRst_n~combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010000010100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \iRGB_B~combout\(1),
	datac => \iRst_n~combout\,
	combout => \rRGB_B~1_combout\);

-- Location: LCFF_X53_Y7_N7
\rRGB_B[1]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \iClk~clkctrl_outclk\,
	datain => \rRGB_B~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => rRGB_B(1));

-- Location: LCCOMB_X49_Y7_N22
\disp_B[1]~1\ : cycloneii_lcell_comb
-- Equation(s):
-- \disp_B[1]~1_combout\ = (rSelect(2) & (rHist(1))) # (!rSelect(2) & ((rRGB_B(1))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011101110001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => rHist(1),
	datab => rSelect(2),
	datad => rRGB_B(1),
	combout => \disp_B[1]~1_combout\);

-- Location: LCFF_X49_Y7_N23
\disp_B[1]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \iClk~clkctrl_outclk\,
	datain => \disp_B[1]~1_combout\,
	sdata => \Mux6~1_combout\,
	sclr => \disp_B[4]~9_combout\,
	sload => rSelect(1),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => disp_B(1));

-- Location: LCCOMB_X49_Y7_N0
\disp_B[2]~2\ : cycloneii_lcell_comb
-- Equation(s):
-- \disp_B[2]~2_combout\ = (rSelect(2) & ((rHist(2)))) # (!rSelect(2) & (rRGB_B(2)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110111000100010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => rRGB_B(2),
	datab => rSelect(2),
	datad => rHist(2),
	combout => \disp_B[2]~2_combout\);

-- Location: LCFF_X49_Y7_N1
\disp_B[2]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \iClk~clkctrl_outclk\,
	datain => \disp_B[2]~2_combout\,
	sdata => \Mux5~1_combout\,
	sclr => \disp_B[4]~9_combout\,
	sload => rSelect(1),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => disp_B(2));

-- Location: LCCOMB_X49_Y7_N2
\disp_B[3]~3\ : cycloneii_lcell_comb
-- Equation(s):
-- \disp_B[3]~3_combout\ = (rSelect(2) & ((rHist(3)))) # (!rSelect(2) & (rRGB_B(3)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110111000100010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => rRGB_B(3),
	datab => rSelect(2),
	datad => rHist(3),
	combout => \disp_B[3]~3_combout\);

-- Location: LCFF_X49_Y7_N3
\disp_B[3]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \iClk~clkctrl_outclk\,
	datain => \disp_B[3]~3_combout\,
	sdata => \Mux4~1_combout\,
	sclr => \disp_B[4]~9_combout\,
	sload => rSelect(1),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => disp_B(3));

-- Location: LCCOMB_X49_Y7_N8
\disp_B[4]~4\ : cycloneii_lcell_comb
-- Equation(s):
-- \disp_B[4]~4_combout\ = (rSelect(2) & ((rHist(4)))) # (!rSelect(2) & (rRGB_B(4)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110111000100010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => rRGB_B(4),
	datab => rSelect(2),
	datad => rHist(4),
	combout => \disp_B[4]~4_combout\);

-- Location: LCFF_X49_Y7_N9
\disp_B[4]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \iClk~clkctrl_outclk\,
	datain => \disp_B[4]~4_combout\,
	sdata => \Mux3~1_combout\,
	sclr => \disp_B[4]~9_combout\,
	sload => rSelect(1),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => disp_B(4));

-- Location: PIN_AK24,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\iRGB_B[5]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "input",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	padio => ww_iRGB_B(5),
	combout => \iRGB_B~combout\(5));

-- Location: LCCOMB_X53_Y7_N22
\rRGB_B~5\ : cycloneii_lcell_comb
-- Equation(s):
-- \rRGB_B~5_combout\ = (\iRst_n~combout\ & \iRGB_B~combout\(5))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \iRst_n~combout\,
	datad => \iRGB_B~combout\(5),
	combout => \rRGB_B~5_combout\);

-- Location: LCFF_X53_Y7_N23
\rRGB_B[5]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \iClk~clkctrl_outclk\,
	datain => \rRGB_B~5_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => rRGB_B(5));

-- Location: LCCOMB_X49_Y7_N10
\disp_B[5]~5\ : cycloneii_lcell_comb
-- Equation(s):
-- \disp_B[5]~5_combout\ = (rSelect(2) & (rHist(5))) # (!rSelect(2) & ((rRGB_B(5))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101110110001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => rSelect(2),
	datab => rHist(5),
	datad => rRGB_B(5),
	combout => \disp_B[5]~5_combout\);

-- Location: LCFF_X49_Y7_N11
\disp_B[5]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \iClk~clkctrl_outclk\,
	datain => \disp_B[5]~5_combout\,
	sdata => \Mux2~1_combout\,
	sclr => \disp_B[4]~9_combout\,
	sload => rSelect(1),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => disp_B(5));

-- Location: PIN_AF15,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\iRGB_B[6]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "input",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	padio => ww_iRGB_B(6),
	combout => \iRGB_B~combout\(6));

-- Location: LCCOMB_X49_Y4_N28
\rRGB_B~6\ : cycloneii_lcell_comb
-- Equation(s):
-- \rRGB_B~6_combout\ = (\iRst_n~combout\ & \iRGB_B~combout\(6))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100000011000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \iRst_n~combout\,
	datac => \iRGB_B~combout\(6),
	combout => \rRGB_B~6_combout\);

-- Location: LCFF_X49_Y4_N29
\rRGB_B[6]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \iClk~clkctrl_outclk\,
	datain => \rRGB_B~6_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => rRGB_B(6));

-- Location: LCCOMB_X49_Y7_N28
\disp_B[6]~6\ : cycloneii_lcell_comb
-- Equation(s):
-- \disp_B[6]~6_combout\ = (rSelect(2) & (rHist(6))) # (!rSelect(2) & ((rRGB_B(6))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101110110001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => rSelect(2),
	datab => rHist(6),
	datad => rRGB_B(6),
	combout => \disp_B[6]~6_combout\);

-- Location: LCFF_X49_Y7_N29
\disp_B[6]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \iClk~clkctrl_outclk\,
	datain => \disp_B[6]~6_combout\,
	sdata => \Mux1~1_combout\,
	sclr => \disp_B[4]~9_combout\,
	sload => rSelect(1),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => disp_B(6));

-- Location: PIN_AE13,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\iHist[7]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "input",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	padio => ww_iHist(7),
	combout => \iHist~combout\(7));

-- Location: LCCOMB_X48_Y7_N24
\rHist~7\ : cycloneii_lcell_comb
-- Equation(s):
-- \rHist~7_combout\ = (\iHist~combout\(7) & \iRst_n~combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \iHist~combout\(7),
	datad => \iRst_n~combout\,
	combout => \rHist~7_combout\);

-- Location: LCFF_X48_Y7_N25
\rHist[7]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \iClk~clkctrl_outclk\,
	datain => \rHist~7_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => rHist(7));

-- Location: LCCOMB_X49_Y7_N6
\disp_B[7]~7\ : cycloneii_lcell_comb
-- Equation(s):
-- \disp_B[7]~7_combout\ = (rSelect(2) & ((rHist(7)))) # (!rSelect(2) & (rRGB_B(7)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110111000100010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => rRGB_B(7),
	datab => rSelect(2),
	datad => rHist(7),
	combout => \disp_B[7]~7_combout\);

-- Location: LCFF_X49_Y7_N7
\disp_B[7]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \iClk~clkctrl_outclk\,
	datain => \disp_B[7]~7_combout\,
	sdata => \Mux0~1_combout\,
	sclr => \disp_B[4]~9_combout\,
	sload => rSelect(1),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => disp_B(7));

-- Location: LCCOMB_X48_Y7_N28
\disp_G[0]~5\ : cycloneii_lcell_comb
-- Equation(s):
-- \disp_G[0]~5_combout\ = (rSelect(2) & ((\Mux7~0_combout\))) # (!rSelect(2) & (rRGB_G(0)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110111000100010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => rRGB_G(0),
	datab => rSelect(2),
	datad => \Mux7~0_combout\,
	combout => \disp_G[0]~5_combout\);

-- Location: LCFF_X48_Y7_N29
\disp_G[0]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \iClk~clkctrl_outclk\,
	datain => \disp_G[0]~5_combout\,
	sdata => \Mux7~2_combout\,
	sclr => \disp_R[5]~9_combout\,
	sload => rSelect(1),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => disp_G(0));

-- Location: LCCOMB_X50_Y7_N22
\disp_G[1]~6\ : cycloneii_lcell_comb
-- Equation(s):
-- \disp_G[1]~6_combout\ = (rSelect(2) & ((\Mux6~0_combout\))) # (!rSelect(2) & (rRGB_G(1)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110111000100010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => rRGB_G(1),
	datab => rSelect(2),
	datad => \Mux6~0_combout\,
	combout => \disp_G[1]~6_combout\);

-- Location: LCFF_X50_Y7_N23
\disp_G[1]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \iClk~clkctrl_outclk\,
	datain => \disp_G[1]~6_combout\,
	sdata => \Mux6~1_combout\,
	sclr => \disp_R[5]~9_combout\,
	sload => rSelect(1),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => disp_G(1));

-- Location: LCCOMB_X50_Y7_N24
\disp_G[2]~7\ : cycloneii_lcell_comb
-- Equation(s):
-- \disp_G[2]~7_combout\ = (rSelect(2) & ((\Mux5~0_combout\))) # (!rSelect(2) & (rRGB_G(2)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110111000100010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => rRGB_G(2),
	datab => rSelect(2),
	datad => \Mux5~0_combout\,
	combout => \disp_G[2]~7_combout\);

-- Location: LCFF_X50_Y7_N25
\disp_G[2]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \iClk~clkctrl_outclk\,
	datain => \disp_G[2]~7_combout\,
	sdata => \Mux5~1_combout\,
	sclr => \disp_R[5]~9_combout\,
	sload => rSelect(1),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => disp_G(2));

-- Location: PIN_AJ22,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\oWr1_valid~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \oWr1_valid~reg0_regout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_oWr1_valid);

-- Location: PIN_AG10,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\oWr2_valid~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \oWr2_valid~reg0_regout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_oWr2_valid);

-- Location: PIN_W23,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\oWr1_data[0]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => GND,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_oWr1_data(0));

-- Location: PIN_C5,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\oWr1_data[1]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => GND,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_oWr1_data(1));

-- Location: PIN_AG12,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\oWr1_data[2]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => disp_R(0),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_oWr1_data(2));

-- Location: PIN_AJ10,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\oWr1_data[3]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => disp_R(1),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_oWr1_data(3));

-- Location: PIN_AJ16,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\oWr1_data[4]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => disp_R(2),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_oWr1_data(4));

-- Location: PIN_AJ12,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\oWr1_data[5]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => disp_R(3),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_oWr1_data(5));

-- Location: PIN_AJ24,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\oWr1_data[6]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => disp_R(4),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_oWr1_data(6));

-- Location: PIN_AE19,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\oWr1_data[7]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => disp_R(5),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_oWr1_data(7));

-- Location: PIN_AH12,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\oWr1_data[8]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => disp_R(6),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_oWr1_data(8));

-- Location: PIN_AJ15,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\oWr1_data[9]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => disp_R(7),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_oWr1_data(9));

-- Location: PIN_AE17,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\oWr1_data[10]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => disp_G(3),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_oWr1_data(10));

-- Location: PIN_AK23,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\oWr1_data[11]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => disp_G(4),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_oWr1_data(11));

-- Location: PIN_AD19,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\oWr1_data[12]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => disp_G(5),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_oWr1_data(12));

-- Location: PIN_AJ11,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\oWr1_data[13]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => disp_G(6),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_oWr1_data(13));

-- Location: PIN_AD14,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\oWr1_data[14]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => disp_G(7),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_oWr1_data(14));

-- Location: PIN_AJ7,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\oWr1_data[15]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => GND,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_oWr1_data(15));

-- Location: PIN_C10,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\oWr2_data[0]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => GND,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_oWr2_data(0));

-- Location: PIN_AH3,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\oWr2_data[1]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => GND,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_oWr2_data(1));

-- Location: PIN_AH13,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\oWr2_data[2]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => disp_B(0),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_oWr2_data(2));

-- Location: PIN_AD13,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\oWr2_data[3]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => disp_B(1),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_oWr2_data(3));

-- Location: PIN_AK14,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\oWr2_data[4]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => disp_B(2),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_oWr2_data(4));

-- Location: PIN_AD16,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\oWr2_data[5]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => disp_B(3),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_oWr2_data(5));

-- Location: PIN_AD12,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\oWr2_data[6]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => disp_B(4),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_oWr2_data(6));

-- Location: PIN_AG14,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\oWr2_data[7]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => disp_B(5),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_oWr2_data(7));

-- Location: PIN_AH15,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\oWr2_data[8]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => disp_B(6),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_oWr2_data(8));

-- Location: PIN_AC13,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\oWr2_data[9]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => disp_B(7),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_oWr2_data(9));

-- Location: PIN_Y30,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\oWr2_data[10]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => GND,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_oWr2_data(10));

-- Location: PIN_AK28,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\oWr2_data[11]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => GND,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_oWr2_data(11));

-- Location: PIN_AK11,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\oWr2_data[12]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => disp_G(0),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_oWr2_data(12));

-- Location: PIN_AE15,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\oWr2_data[13]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => disp_G(1),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_oWr2_data(13));

-- Location: PIN_AF21,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\oWr2_data[14]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => disp_G(2),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_oWr2_data(14));

-- Location: PIN_B24,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\oWr2_data[15]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => GND,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_oWr2_data(15));
END structure;


