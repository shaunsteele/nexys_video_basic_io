// basic_io_seq_item.svh

`ifndef __BASIC_IO_SEQ_ITEM
`define __BASIC_IO_SEQ_ITEM

class basic_io_seq_item extends uvm_sequence_item;

`uvm_object_utils(basic_io_seq_item)


/* Configuration */
parameter real MAX_DELAY = 100;


/* Data Members */
rand real           delay; // time not clocks
rand bit    [4:0]   buttons;
rand bit    [7:0]   switches;
bit         [7:0]   leds;


/* Constraints */
constraint c_basic_io_delay {delay inside {[0:MAX_DELAY]}}


/* Methods */
function new(string name="basic_io_seq_item");
    super.new(name);
endfunction

virtual function void do_copy(uvm_object rhs);
    spi_seq_item rhs_data;

    if ($!cast(rhs_data, rhs)) begin
        `uvm_fatal("do_copy", "cast of rhs object failed")
    end
    super.do_copy(rhs);

    buttons = rhs_data.buttons;
    switches = rhs_data.switches;
    leds = rhs_data.leds;
endfunction

virtual function void do_compare(uvm_object rhs, uvm_comparer comparer);
    spi_seq_item rhs_data;

    if (!$cast(rhs_data, rhs)) begin
        `uvm_error("do_copy", "cast of rhs object failed")
    end
    return super.do_compare(rsh, comparer) &&
            buttons == rhs_data.buttons &&
            switches == rhs_data.switches &&
            leds == rhs_data.leds;
endfunction

virtual function string convert2string();
    string s;
    $sformat(s,"%sbasic_io_seq_item\n",s);
    $sformat(s,"%s delay:\t%f\n buttons:\t0b%08b\n switches:\t0b%05b\n leds:\t0b%08b\n",
        s, buttons, switches, leds);
    return s;
endfunction

virtual function void do_print(uvm_printer printer);
    printer.m_string = convert2string();
endfunction

virtual function void do_record(uvm_recorder recorder);
    super.do_record(recorder);

    `uvm_record_field("delay", delay)
    `uvm_record_field("buttons", buttons)
    `uvm_record_field("switches", switches)
    `uvm_record_field("leds", leds)
endfunction

endclass

`endif
