

class base_test extends uvm_test;
    `uvm_component_utils(base_test)

    // Interface handle
    virtual dut_if vif;

    // Environment handle
    environment env_h;

    // Command Line variables
    int    a = 2;
    string color = "blue";

    extern function      new        (string name = "base_test", uvm_component parent = null);
    extern function void build_phase(uvm_phase phase);
    extern task          run_phase  (uvm_phase phase);

endclass: base_test

function base_test::new(string name = "base_test", uvm_component parent = null);
    super.new(name, parent);
endfunction: new

function void base_test::build_phase(uvm_phase phase);
    super.build_phase(phase);
    // Create a new environment
    env_h = environment::type_id::create("env_h", this);
    // Send data to environment via command line
    uvm_config_db#(uvm_bitstream_t)::set(this, "env_h", "a", a); // Sending a
    uvm_config_db#(string)::set(this, "env_h", "color", color); // Sending color
endfunction: build_phase

task base_test::run_phase(uvm_phase phase);
    super.run_phase(phase);
endtask: run_phase