transcript on
if {[file exists rtl_work]} {
    vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vlog -vlog01compat -work work +incdir+/home/xavieran/BEngBSc/YEAR\ 5/Sem\ 1/ECE4063/ECE4063-Project/CameraLCD {/home/xavieran/BEngBSc/YEAR 5/Sem 1/ECE4063/ECE4063-Project/CameraLCD/HistogramDisplayer.v}
vlog -vlog01compat -work work +incdir+/home/xavieran/BEngBSc/YEAR\ 5/Sem\ 1/ECE4063/ECE4063-Project/CameraLCD {/home/xavieran/BEngBSc/YEAR 5/Sem 1/ECE4063/ECE4063-Project/CameraLCD/Histogram.v}
vlog -vlog01compat -work work +incdir+/home/xavieran/BEngBSc/YEAR\ 5/Sem\ 1/ECE4063/ECE4063-Project/CameraLCD {/home/xavieran/BEngBSc/YEAR 5/Sem 1/ECE4063/ECE4063-Project/CameraLCD/Arbitrator.v}
vlog -vlog01compat -work work +incdir+/home/xavieran/BEngBSc/YEAR\ 5/Sem\ 1/ECE4063/ECE4063-Project/CameraLCD {/home/xavieran/BEngBSc/YEAR 5/Sem 1/ECE4063/ECE4063-Project/CameraLCD/Thresholder.v}
vlog -vlog01compat -work work +incdir+/home/xavieran/BEngBSc/YEAR\ 5/Sem\ 1/ECE4063/ECE4063-Project/CameraLCD {/home/xavieran/BEngBSc/YEAR 5/Sem 1/ECE4063/ECE4063-Project/CameraLCD/RGB2GRAY.v}
vlog -vlog01compat -work work +incdir+/home/xavieran/BEngBSc/YEAR\ 5/Sem\ 1/ECE4063/ECE4063-Project/CameraLCD {/home/xavieran/BEngBSc/YEAR 5/Sem 1/ECE4063/ECE4063-Project/CameraLCD/true_dpram_sclk.v}
vlog -vlog01compat -work work +incdir+/home/xavieran/BEngBSc/YEAR\ 5/Sem\ 1/ECE4063/ECE4063-Project/CameraLCD {/home/xavieran/BEngBSc/YEAR 5/Sem 1/ECE4063/ECE4063-Project/CameraLCD/Total_Histogram.v}
vlog -vlog01compat -work work +incdir+/home/xavieran/BEngBSc/YEAR\ 5/Sem\ 1/ECE4063/ECE4063-Project/CameraLCD {/home/xavieran/BEngBSc/YEAR 5/Sem 1/ECE4063/ECE4063-Project/CameraLCD/CumulativeHistogram.v}
vlog -vlog01compat -work work +incdir+/home/xavieran/BEngBSc/YEAR\ 5/Sem\ 1/ECE4063/ECE4063-Project/CameraLCD {/home/xavieran/BEngBSc/YEAR 5/Sem 1/ECE4063/ECE4063-Project/CameraLCD/Total_Module.v}
vlog -vlog01compat -work work +incdir+/home/xavieran/BEngBSc/YEAR\ 5/Sem\ 1/ECE4063/ECE4063-Project/CameraLCD {/home/xavieran/BEngBSc/YEAR 5/Sem 1/ECE4063/ECE4063-Project/CameraLCD/MultiThresh.v}

vlog -vlog01compat -work work +incdir+/home/xavieran/BEngBSc/YEAR\ 5/Sem\ 1/ECE4063/ECE4063-Project/CameraLCD {/home/xavieran/BEngBSc/YEAR 5/Sem 1/ECE4063/ECE4063-Project/CameraLCD/DelayThresholder_Testbench.v}

vsim -t 1ps -L altera_ver -L lpm_ver -L sgate_ver -L altera_mf_ver -L altera_lnsim_ver -L cycloneii_ver -L rtl_work -L work -voptargs="+acc"  DelayThresholder_Testbench

add wave *
view structure
view signals

onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /DelayThresholder_Testbench/i
add wave -noupdate /DelayThresholder_Testbench/rfile
add wave -noupdate /DelayThresholder_Testbench/gfile
add wave -noupdate /DelayThresholder_Testbench/bfile
add wave -noupdate /DelayThresholder_Testbench/file
add wave -noupdate /DelayThresholder_Testbench/clk
add wave -noupdate /DelayThresholder_Testbench/rst
add wave -noupdate /DelayThresholder_Testbench/frame_val
add wave -noupdate /DelayThresholder_Testbench/pix_val
add wave -noupdate /DelayThresholder_Testbench/X
add wave -noupdate /DelayThresholder_Testbench/Y
add wave -noupdate /DelayThresholder_Testbench/R
add wave -noupdate /DelayThresholder_Testbench/G
add wave -noupdate /DelayThresholder_Testbench/B
add wave -noupdate /DelayThresholder_Testbench/CCD_PIXCLK
add wave -noupdate /DelayThresholder_Testbench/DLY_RST_1
add wave -noupdate /DelayThresholder_Testbench/mCCD_FVAL
add wave -noupdate /DelayThresholder_Testbench/Y_Cont
add wave -noupdate /DelayThresholder_Testbench/X_Cont
add wave -noupdate /DelayThresholder_Testbench/sCCD_R
add wave -noupdate /DelayThresholder_Testbench/sCCD_G
add wave -noupdate /DelayThresholder_Testbench/sCCD_B
add wave -noupdate /DelayThresholder_Testbench/sCCD_DVAL
add wave -noupdate /DelayThresholder_Testbench/iSW
add wave -noupdate /DelayThresholder_Testbench/wr1_data
add wave -noupdate /DelayThresholder_Testbench/wr2_data
add wave -noupdate /DelayThresholder_Testbench/wr1_data_ram
add wave -noupdate /DelayThresholder_Testbench/wr2_data_ram
add wave -noupdate /DelayThresholder_Testbench/wr1_data_processed
add wave -noupdate /DelayThresholder_Testbench/wr2_data_processed
add wave -noupdate /DelayThresholder_Testbench/WR_DATA_VAL
add wave -noupdate /DelayThresholder_Testbench/ReadAddr
add wave -noupdate /DelayThresholder_Testbench/sdram_write
add wave -noupdate /DelayThresholder_Testbench/oRed
add wave -noupdate /DelayThresholder_Testbench/oGreen
add wave -noupdate /DelayThresholder_Testbench/oBlue
add wave -noupdate /DelayThresholder_Testbench/threshold
add wave -noupdate /DelayThresholder_Testbench/TOTAL/arbiter/dGray
add wave -noupdate /DelayThresholder_Testbench/TOTAL/arbiter/iGray
add wave -noupdate /DelayThresholder_Testbench/TOTAL/arbiter/iGray_Valid
add wave -noupdate /DelayThresholder_Testbench/TOTAL/arbiter/iThresholdLevel
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {8322769340 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 384
configure wave -valuecolwidth 201
configure wave -justifyvalue left
configure wave -signalnamewidth 0
configure wave -snapdistance 10
configure wave -datasetprefix 0
configure wave -rowmargin 4
configure wave -childrowmargin 2
configure wave -gridoffset 0
configure wave -gridperiod 1
configure wave -griddelta 40
configure wave -timeline 0
configure wave -timelineunits ps
update
WaveRestoreZoom {0 ps} {12161124150 ps}


run -all
