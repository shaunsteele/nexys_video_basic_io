// basic_io_base_test.sv

`ifndef __BASIC_IO_BASE_TEST
`define __BASIC_IO_BASE_TEST

class axi_lite_basic_io_base_test extends uvm_test;

`uvm_component_utils(axi_lite_baseic_io_base_test)

function new(string name="axi_lite_basic_io_base_test", uvm_component parent);
    super.new(name, parent);
endfunction



endclass

`endif
