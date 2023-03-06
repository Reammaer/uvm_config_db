

class base_test extends uvm_test;
    `uvm_component_utils(base_test)

    // Interface handle
    virtual dut_if vif;

    // Environment handle
    environment env_h;

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
endfunction: build_phase

task base_test::run_phase(uvm_phase phase);
    super.run_phase(phase);
endtask: run_phase