// led_reg.sv

`ifndef __LED_REG
`define __LED_REG

class led_reg extends uvm_reg;

`uvm_object_utils(led_reg)

rand uvm_reg_field  leds;

function new (string name = "led_reg");
    super.new(name, 8, UVM_NO_COVERAGE);
endfunction

virtual function void build();
    leds = uvm_reg_field::type_id::create("leds");
    leds.configure(this, 8, 0, "RW", 0, 1'b0, 1, 1, 1);
endfunction

endclass

`endif
