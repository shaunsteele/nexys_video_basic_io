// basic_io_reg.sv

`ifndef __BASIC_IO_REG
`define __BASIC_IO_REG

class basic_io_reg extends uvm_reg;

`uvm_object_utils(basic_io_reg)

rand uvm_reg_field  reserved_basic_io;
rand uvm_reg_field  buttons;
rand uvm_reg_field  switches;
rand uvm_reg_field  leds;

covergroup cg_basic_io;
    buttons     : coverpoint buttons.value[4:0];
    switches    : coverpoint switches.value[7:0];
    leds        : coverpoint leds.value[7:0];
endgroup

function new (string name = "leds_reg");
    super.new(name, 64, build_coverage(UVM_CVR_FIELD_VALS));
    add_coverage(build_coverage(UVM_CVR_FIELD_VALS));
    if (has_coverage(UVM_CVR_FIELD_VALS))
        cg_basic_io = new();
endfunction

virtual function void sample_values();
    super.sample_values();
    if (get_coverage(UVM_CVR_FIELD_VALS))
        cg_leds.sample();
endfunction

virtual function void build();
    reserved_basic_io   = uvm_reg_field::type_id::create("reserved_basic_io");
    buttons = uvm_reg_field::type_id::create("buttons");
    switches = uvm_reg_field::type_id::create("switches");
    leds = uvm_reg_field::type_id::create("leds");

    reserved_basic_io.configure(this, REGISTER_WIDTH - 21, "RW", 0, 'h0, 1, 1, 1)
    buttons.configure(this, 5, 0, "RO", 1, 5'b0, 1, 1, 1);
    switches.configure(this, 8, 0, "RO", 1, 8'b0, 1, 1, 1);
    leds.configure(this, 8, 0, "RW", 0, 8'b0, 1, 1, 1);
endfunction

endclass

`endif
