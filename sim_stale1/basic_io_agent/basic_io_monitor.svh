// basic_io_monitor.svh

class basic_io_monitor extends uvm_monitor;

`uvm_component_utils(basic_io_monitor)

local virtual basic_io_monitor_bfm_if m_bfm;

uvm_analysis_port #(basic_io_seq_item) ap;

function new(string name="basic_io_monitor", uvm_component parent=null);
    super.new(name, parent);
endfunction

virtual function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    if (!uvm_config_db #(virtual basic_io_monitor_bfm_if)::get(this, "", "basic_io_monitor_bfm", m_bfm)) begin
        `uvm_fatal("basic_io_monitor/build_phase","Cannot get basic_io_monitor_bfm")
    end
    m_bfm.proxy = this;

    ap = new("ap", this);
endfunction

virtual task run_phase(uvm_phase phase);
    m_bfm.run();
endtask

virtual function void report_phase(uvm_phase phase);
    super.report_phase(phase);
endfunction

virtual function void notify_transaction(basic_io_seq_item item);
    ap.write(item);
endfunction

endclass
