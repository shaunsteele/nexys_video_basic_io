// basic_io_agent.svh

class basic_io_agent extends uvm_agent;

`uvm_component_utils(basic_io_agent)

uvm_analysis_port #(basic_io_seq_item) ap;
basic_io_monitor    m_monitor;
basic_io_sequencer  m_sequencer;
basic_io_driver     m_driver;

function new(string name="basic_io_agent", uvm_component parent=null);
    super.new(name, parent);
endfunction

virtual function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    m_monitor = basic_io_monitor::type_id::create("m_monitor", this);
    
endfunction

endclass
