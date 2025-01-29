// switches_reg.sv

`ifndef __SWITCHES_REG
`define __SWITCHES_REG

class switches_reg extends uvm_reg;

`uvm_object_utils(switches_reg)

rand uvm_reg_field  switches;

function new (string name = "switches_reg");
    super.new(name, 8, UVM_NO_COVERAGE);
endfunction

virtual function void build();
    switches = uvm_reg_field::type_id::create("switches");
    switches.configure(this, 8, 0, "RO", 1, 1'b0, 1, 1, 1);
endfunction

endclass

`endif
