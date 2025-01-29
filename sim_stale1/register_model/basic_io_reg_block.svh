// basic_io_reg_block.sv

`ifndef __BASIC_IO_REG_BLOCK
`define __BASIC_IO_REG_BLOCK

class basic_io_reg_block extends uvm_reg_block;

`uvm_object_utils(basic_io_reg_block)

rand led_reg        leds;
rand switches_reg   switches;
rand buttons_reg    buttons;

uvm_reg_map basic_io_reg_block_map;

function new(string name = "basic_io_reg_block");
    super.new(name, build_coverage(UVM_CVR_ALL));
endfunction

virtual function void build();
    basic_io_reg = leds::type_id::create("leds");
    basic_io_reg = configure(this);
    basic_io_reg.build();

    basic_io_reg_block_map = create_map("", 0, 8, UVM_LITTLE_ENDIAN, 0);
    default_map = basic_io_reg_block_map;

    basic_io_reg_block_map.add_reg(basic_io_reg, 'h0, "RW", 0);

    lock_model();
endfunction

endclass

`endif
