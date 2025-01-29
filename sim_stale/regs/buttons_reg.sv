// buttons_reg.sv

`ifndef __BUTTONS_REG
`define __BUTTONS_REG

class buttons_reg extends uvm_reg;

`uvm_object_utils(buttons_reg)

rand uvm_reg_field  buttons;

function new (string name = "buttons_reg");
    super.new(name, 8, UVM_NO_COVERAGE);
endfunction

virtual function void build();
    buttons = uvm_reg_field::type_id::create("buttons");
    buttons.configure(this, 5, 0, "RO", 1, 1'b0, 1, 1, 1);
endfunction

endclass

`endif
