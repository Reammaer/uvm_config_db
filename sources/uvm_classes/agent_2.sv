

class agent_2 extends uvm_agent;

    int k;

    `uvm_component_utils_begin(agent_2)
        `uvm_field_int(k, UVM_ALL_ON)
    `uvm_component_utils_end

    extern function      new            (string name, uvm_component parent);
    extern function void build_phase    (uvm_phase phase);
    extern function void connect_phase  (uvm_phase phase); 

endclass: agent_2

function agent_2::new(string name, uvm_component parent);
    super.new(name, parent);
endfunction: new

function void agent_2::build_phase(uvm_phase phase);
    super.build_phase(phase);    // Mandatory, otherwise i = 0
    // apply_config_settings(1); // The same thing
endfunction: build_phase

function void agent_2::connect_phase(uvm_phase phase);
    super.connect_phase(phase);
    `uvm_info("Agent_2", $sformatf("k=%0d", k), UVM_LOW)
endfunction: connect_phase