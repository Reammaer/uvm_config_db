

quit -sim

cd ../modelsim

vlib work

vlog -work work ../sources/dut_if.sv
vlog -work work ../sources/dut_test.sv
vlog -work work ../tb/tb.sv

vsim -novopt -t 1ns work.tb

add wave -divider "Top-level signals"
add wave -radix unsigned tb/*

add wave -divider "DUT interface"
add wave -radix unsigned tb/_if/*

run 10us