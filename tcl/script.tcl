

quit -sim

cd ../modelsim

vlib work

vlog -work work ../sources/dut_if.sv
vlog -work work ../sources/dut_test.sv
vlog -work work ../tb/tb.sv

# Set variables for the UVM
# Test
set TEST_NAME base_test
# uvm_config variables
set {int_variable}  a
set ${int_variable} 6

set {string_variable}  color
set ${string_variable} "pink"

vsim -novopt -t 1ns work.tb \
            +UVM_TESTNAME=$TEST_NAME \
            +uvm_set_config_int=uvm_test_top.env_h,${int_variable},$a \
            +uvm_set_config_string=uvm_test_top.env_h,${string_variable},$color 


add wave -divider "Top-level signals"
add wave -radix unsigned tb/*

add wave -divider "DUT interface"
add wave -radix unsigned tb/_if/*

run 10us