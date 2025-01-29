// basic_io_reg_block.sv

`ifndef __BASIC_IO_REG_BLOCK
`define __BASIC_IO_REG_BLOCK

class basic_io_reg_block extends uvm_reg_block;

rand led_reg        leds;
rand switches_reg   switches;
rand buttons_reg    buttons;

function new(string name = "basic_io_reg_block");
    super.new(name, UVM_NO_COVERAGE);
endfunction

virtual function void build();
    this.default_map = create_map("", 0, 24, UVM_LITTLE_ENDIAN, 0);
    this.leds = leds::type_id::create("leds", , get_full_name);
    this.switches = leds::type_id::create("switches", , get_full_name);
    this.buttons = leds::type_id::create("buttons", , get_full_name);

    this.leds = configure(this, null, "");
    this.switches = configure(this, null, "");
    this.buttons = configure(this, null, "");

    this.leds.build();
    this.switches.build();
    this.buttons.build();

    this.default_map.add_reg(this.leds, `UVM_REG_ADDR_WIDTH'h0, "RW", 0);
    this.default_map.add_reg(this.switches, `UVM_REG_ADDR_WIDTH'h8, "RO", 0);
    this.default_map.add_reg(this.buttons, `UVM_REG_ADDR_WIDTH'h10, "RO", 0);
endfunction

endclass

`endif
