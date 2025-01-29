// axi_lite_agent_config.sv

`ifndef __AXI_LITE_AGENT_CONFIG
`define __AXI_LITE_AGENT_CONFIG

class axi_lite_agent_config extends uvm_object;

`uvm_object_utils(axi_lite_agent_config)

int reset_cycles = 20;

bit m_sn;   // 1 - manager, 0 - subordinate

int id_width = 1;
int addr_width = 64;
int data_width = 64;
int strb_width = data_width / 8;
int resp_width = 2;

function new(string name="axi_lite_agent_config");
    super.new(name);
endfunction

endclass

`endif
