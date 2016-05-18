## Generated SDC file "DE2_70.out.sdc"

## Copyright (C) 1991-2011 Altera Corporation
## Your use of Altera Corporation's design tools, logic functions 
## and other software and tools, and its AMPP partner logic 
## functions, and any output files from any of the foregoing 
## (including device programming or simulation files), and any 
## associated documentation or information are expressly subject 
## to the terms and conditions of the Altera Program License 
## Subscription Agreement, Altera MegaCore Function License 
## Agreement, or other applicable license agreement, including, 
## without limitation, that your use is for the sole purpose of 
## programming logic devices manufactured by Altera and sold by 
## Altera or its authorized distributors.  Please refer to the 
## applicable agreement for further details.


## VENDOR  "Altera"
## PROGRAM "Quartus II"
## VERSION "Version 10.1 Build 197 01/19/2011 Service Pack 1 SJ Full Version"

## DATE    "Fri Sep 09 15:01:30 2011"

##
## DEVICE  "EP2C70F896C6"
##


#**************************************************************
# Time Information
#**************************************************************

set_time_format -unit ns -decimal_places 3



#**************************************************************
# Create Clock
#**************************************************************

create_clock -name {GPIO_CLKIN_N1} -period 16.667 -waveform { 0.000 8.333 } [get_ports { GPIO_CLKIN_N1 }]
create_clock -name {iCLK_50} -period 20.000 -waveform { 0.000 10.000 } [get_ports {iCLK_50}]
create_clock -name {GPIO_CLKOUT_N1} -period 40.000 -waveform { 0.000 20.000 } [get_ports { GPIO_CLKOUT_N1 }]
create_clock -name {oDRAM0_CLK} -period 6.000 -waveform { 0.000 3.000 } [get_ports { oDRAM0_CLK }]
create_clock -name {iCLK_50_3} -period 20.000 -waveform { 0.000 10.000 } [get_ports {iCLK_50_3}]
create_clock -name {iCLK_50_2} -period 20.000 -waveform { 0.000 10.000 } [get_ports {iCLK_50_2}]
create_clock -name {N/C} -period 10.000 -waveform { 0.000 5.000 } 
create_clock -name I2C_CTRL_CLK -period 100000.000 [get_nets {u9|mI2C_CTRL_CLK}]
#create_clock -name I2S_CLK -period 50000.000 [get_nets {u11|u0|mI2S_CLK}]
#the following slightly less constrained version caused faulty initialisation of display - coloured blurred screen 
#create_clock -name I2S_CLK -period 100000.000 [get_nets {u11|u0|mI2S_CLK}]

#**************************************************************
# Create Generated Clock
#**************************************************************

create_generated_clock -name {sdram_pll:u6|altpll:altpll_component|_clk0} -source [get_pins {u6|altpll_component|pll|inclk[0]}] -duty_cycle 50.000 -multiply_by 10 -divide_by 3 -master_clock {iCLK_50_3} [get_pins {u6|altpll_component|pll|clk[0]}] 
create_generated_clock -name {sdram_pll:u6|altpll:altpll_component|_clk1} -source [get_pins {u6|altpll_component|pll|inclk[0]}] -duty_cycle 50.000 -multiply_by 10 -divide_by 3 -phase -90.000 -master_clock {iCLK_50_3} [get_pins {u6|altpll_component|pll|clk[1]}] 
create_generated_clock -name {sdram_pll:u6|altpll:altpll_component|_clk2} -source [get_pins {u6|altpll_component|pll|inclk[0]}] -duty_cycle 50.000 -multiply_by 10 -divide_by 3 -phase -90.000 -master_clock {iCLK_50_3} [get_pins {u6|altpll_component|pll|clk[2]}] 
create_generated_clock -name {vga_pll:u5|altpll:altpll_component|_clk0} -source [get_pins {u5|altpll_component|pll|inclk[0]}] -duty_cycle 50.000 -multiply_by 2 -divide_by 3 -master_clock {iCLK_50_2} [get_pins {u5|altpll_component|pll|clk[0]}] 


#**************************************************************
# Set Clock Latency
#**************************************************************



#**************************************************************
# Set Clock Uncertainty
#**************************************************************



#**************************************************************
# Set Input Delay
#**************************************************************



#**************************************************************
# Set Output Delay
#**************************************************************

set_output_delay -add_delay  -clock [get_clocks {N/C}]  0.000 [get_ports {DRAM_DQ[0]}]
set_output_delay -add_delay  -clock [get_clocks {N/C}]  0.000 [get_ports {DRAM_DQ[1]}]
set_output_delay -add_delay  -clock [get_clocks {N/C}]  0.000 [get_ports {DRAM_DQ[2]}]
set_output_delay -add_delay  -clock [get_clocks {N/C}]  0.000 [get_ports {DRAM_DQ[3]}]
set_output_delay -add_delay  -clock [get_clocks {N/C}]  0.000 [get_ports {DRAM_DQ[4]}]
set_output_delay -add_delay  -clock [get_clocks {N/C}]  0.000 [get_ports {DRAM_DQ[5]}]
set_output_delay -add_delay  -clock [get_clocks {N/C}]  0.000 [get_ports {DRAM_DQ[6]}]
set_output_delay -add_delay  -clock [get_clocks {N/C}]  0.000 [get_ports {DRAM_DQ[7]}]
set_output_delay -add_delay  -clock [get_clocks {N/C}]  0.000 [get_ports {DRAM_DQ[8]}]
set_output_delay -add_delay  -clock [get_clocks {N/C}]  0.000 [get_ports {DRAM_DQ[9]}]
set_output_delay -add_delay  -clock [get_clocks {N/C}]  0.000 [get_ports {DRAM_DQ[10]}]
set_output_delay -add_delay  -clock [get_clocks {N/C}]  0.000 [get_ports {DRAM_DQ[11]}]
set_output_delay -add_delay  -clock [get_clocks {N/C}]  0.000 [get_ports {DRAM_DQ[12]}]
set_output_delay -add_delay  -clock [get_clocks {N/C}]  0.000 [get_ports {DRAM_DQ[13]}]
set_output_delay -add_delay  -clock [get_clocks {N/C}]  0.000 [get_ports {DRAM_DQ[14]}]
set_output_delay -add_delay  -clock [get_clocks {N/C}]  0.000 [get_ports {DRAM_DQ[15]}]
set_output_delay -add_delay  -clock [get_clocks {N/C}]  0.000 [get_ports {DRAM_DQ[16]}]
set_output_delay -add_delay  -clock [get_clocks {N/C}]  0.000 [get_ports {DRAM_DQ[17]}]
set_output_delay -add_delay  -clock [get_clocks {N/C}]  0.000 [get_ports {DRAM_DQ[18]}]
set_output_delay -add_delay  -clock [get_clocks {N/C}]  0.000 [get_ports {DRAM_DQ[19]}]
set_output_delay -add_delay  -clock [get_clocks {N/C}]  0.000 [get_ports {DRAM_DQ[20]}]
set_output_delay -add_delay  -clock [get_clocks {N/C}]  0.000 [get_ports {DRAM_DQ[21]}]
set_output_delay -add_delay  -clock [get_clocks {N/C}]  0.000 [get_ports {DRAM_DQ[22]}]
set_output_delay -add_delay  -clock [get_clocks {N/C}]  0.000 [get_ports {DRAM_DQ[23]}]
set_output_delay -add_delay  -clock [get_clocks {N/C}]  0.000 [get_ports {DRAM_DQ[24]}]
set_output_delay -add_delay  -clock [get_clocks {N/C}]  0.000 [get_ports {DRAM_DQ[25]}]
set_output_delay -add_delay  -clock [get_clocks {N/C}]  0.000 [get_ports {DRAM_DQ[26]}]
set_output_delay -add_delay  -clock [get_clocks {N/C}]  0.000 [get_ports {DRAM_DQ[27]}]
set_output_delay -add_delay  -clock [get_clocks {N/C}]  0.000 [get_ports {DRAM_DQ[28]}]
set_output_delay -add_delay  -clock [get_clocks {N/C}]  0.000 [get_ports {DRAM_DQ[29]}]
set_output_delay -add_delay  -clock [get_clocks {N/C}]  0.000 [get_ports {DRAM_DQ[30]}]
set_output_delay -add_delay  -clock [get_clocks {N/C}]  0.000 [get_ports {DRAM_DQ[31]}]


#**************************************************************
# Set Clock Groups
#**************************************************************

set_clock_groups -asynchronous -group [get_clocks {  GPIO_CLKOUT_N1  }] -group [get_clocks {  GPIO_CLKIN_N1  }] -group [get_clocks {  vga_pll:u5|altpll:altpll_component|_clk0  iCLK_50_2  }] -group [get_clocks {  oDRAM0_CLK  }] -group [get_clocks {  sdram_pll:u6|altpll:altpll_component|_clk0  sdram_pll:u6|altpll:altpll_component|_clk1  sdram_pll:u6|altpll:altpll_component|_clk2  iCLK_50_3  }] -group [get_clocks {  iCLK_50  }] 


#**************************************************************
# Set False Path
#**************************************************************

set_false_path -from [get_keepers {*rdptr_g*}] -to [get_keepers {*ws_dgrp|dffpipe_qe9:dffpipe22|dffe23a*}]
set_false_path -from [get_keepers {*delayed_wrptr_g*}] -to [get_keepers {*rs_dgwp|dffpipe_pe9:dffpipe18|dffe19a*}]


#**************************************************************
# Set Multicycle Path
#**************************************************************



#**************************************************************
# Set Maximum Delay
#**************************************************************

set_max_delay -from [get_ports *] -to [get_registers {rCCD_DATA[*]}] 5.000
set_max_delay -from [get_ports *] -to [get_registers {rCCD_FVAL}] 5.000
set_max_delay -from [get_ports *] -to [get_registers {rCCD_LVAL}] 5.000
set_max_delay -from [get_ports {DRAM_DQ[*]}] -to [get_registers *] 1.000
set_max_delay -from [get_keepers *] -to [get_ports {DRAM_DQ[*]}] 1.000


#**************************************************************
# Set Minimum Delay
#**************************************************************



#**************************************************************
# Set Input Transition
#**************************************************************

