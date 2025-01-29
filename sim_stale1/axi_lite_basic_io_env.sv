// axi_lite_basic_io_env.sv

`ifndef __AXI_LITE_BASIC_IO_ENV
`define __AXI_LITE_BASIC_IO_ENV

class axi_lite_basic_io_env extends uvm_env;

`uvm_component_utils(axi_lite_basic_io_reg_env)

axi_lite_agent                          bus_agent;
basic_io_reg_block                      reg_model;
axi_lite_basic_io_reg_adapter           reg_bus_adapter;
uvm_reg_predictor #(axi_lite_seq_item)  bus_predictor;

function new(string name="axi_lite_basic_io_env", uvm_component parent);
    super.new(name, parent);
endfunction

virtual function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    reg_model = basic_io_reg_block::type_id::create("reg_model", this);
    reg_bus_adapter = axi_lite_basic_io_reg_adapter::type_id::create("reg_bus_adapter");
    bus_predictor = uvm_reg_predictor#(axi_lite_seq_item)::type_id::create("bus_predictor", this);
    reg_model.build();
    reg_model.lock_model();
    uvm_config_db#(basic_io_reg_block)::set(null, "uvm_test_top", "reg_model", reg_model);
endfunction

virtual function void connect_phase(uvm_phase phase);
    super.connect_phase(phase);
    bus_predictor.map = reg_model.default_map;
    bus_predictor.adapter = reg_bus_adapter;
    bus_agent.ap.connect(bus_predictor.bus_in);
endfunction

endclass

`endif
