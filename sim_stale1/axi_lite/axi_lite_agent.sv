// axi_lite_agent.sv

`ifndef __AXI_LITE_AGENT
`define __AXI_LITE_AGENT

class axi_lite_agent extends uvm_agent;

`uvm_component_utils(axi_lite_agent)

axi_lite_driver                     drv;
axi_lite_monitor                    mon;
uvm_sequencer #(axi_lite_seq_item)  sqr;

axi_lite_agent_config               cfg;

uvm_analysis_port #(axi_lite_seq_item)  ap;

function new(string name="axi_lite_agent", uvm_component parent);
    super.new(name, parent);
endfunction

virtual function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    if (!uvm_config_db #(axi_lite_agent_config)::get(this,"","axi_lite_agent_config",cfg)) begin
        `uvm_fatal("axi_lite_agent", "Cannot find configuration")
    end
    drv = axi_lite_driver::type_id::create("drv", this);
    mon = axi_lite_monitor::type_id::create("mon", this);
    sqr = uvm_sequencer#(axi_lite_seq_item)::type_id::create("sqr", this);
    ap = new("ap", this);
endfunction

virtual function void connect_phase(uvm_phase phase);
    super.connect_phase(phase);
    drv.seq_item_port.connect(sqr.seq_item_export);
    ap = mon.ap;
endfunction

endclass

`endif
