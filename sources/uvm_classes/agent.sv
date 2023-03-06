

class agent extends uvm_agent;
    // Test variable
    int i;

    `uvm_component_utils_begin(agent)
        `uvm_field_int(i, UVM_ALL_ON)
    `uvm_component_utils_end

    extern function      new            (string name, uvm_component parent);
    extern function void build_phase    (uvm_phase phase);
    extern function void connect_phase  (uvm_phase phase); 

endclass: agent

function agent::new(string name, uvm_component parent);
    super.new(name, parent);
endfunction: new

function void agent::build_phase(uvm_phase phase);
    super.build_phase(phase);    // Mandatory, otherwise i = 0
    // apply_config_settings(1); // The same thing
endfunction: build_phase

function void agent::connect_phase(uvm_phase phase);
    super.connect_phase(phase);
    `uvm_info("Agent", $sformatf("i = %0d", i), UVM_LOW)
endfunction: connect_phase