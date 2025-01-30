function void basic_io_seq_item::post_randomize();
    this.delay_real = this.delay_int / 10.0;
endfunction

function bit basic_io_seq_item::do_compare(uvm_object rhs, uvm_comparer comparer);
    bit result;
    basic_io_seq_item rhs_;
    if (!$cast(rhs_, rhs))
        `uvm_fatal(get_type_name(), "Cast of rhs object failed")
    result = super.do_compare(rhs, comparer);
    result &= comparer.compare_field("buttons", buttons,   rhs_.buttons,  $bits(buttons));
    result &= comparer.compare_field("switches", switches, rhs_.switches, $bits(switches));
    result &= comparer.compare_field("leds", leds,         rhs_.leds,     $bits(leds));
    return result;
endfunction

// unchanged easierUVM generated
function void basic_io_seq_item::do_copy(uvm_object rhs);
  basic_io_seq_item rhs_;
  if (!$cast(rhs_, rhs))
    `uvm_fatal(get_type_name(), "Cast of rhs object failed")
  super.do_copy(rhs);
  delay10_int = rhs_.delay10_int;
  delay_real  = rhs_.delay_real; 
  buttons     = rhs_.buttons;    
  switches    = rhs_.switches;   
  leds        = rhs_.leds;       
endfunction : do_copy


// function bit basic_io_seq_item::do_compare(uvm_object rhs, uvm_comparer comparer);
//   bit result;
//   basic_io_seq_item rhs_;
//   if (!$cast(rhs_, rhs))
//     `uvm_fatal(get_type_name(), "Cast of rhs object failed")
//   result = super.do_compare(rhs, comparer);
//   result &= comparer.compare_field("delay10_int", delay10_int, rhs_.delay10_int, $bits(delay10_int));
//   result &= comparer.compare_field("delay_real", delay_real,   rhs_.delay_real,  $bits(delay_real));
//   result &= comparer.compare_field("buttons", buttons,         rhs_.buttons,     $bits(buttons));
//   result &= comparer.compare_field("switches", switches,       rhs_.switches,    $bits(switches));
//   result &= comparer.compare_field("leds", leds,               rhs_.leds,        $bits(leds));
//   return result;
// endfunction : do_compare


function void basic_io_seq_item::do_print(uvm_printer printer);
  if (printer.knobs.sprint == 0)
    `uvm_info(get_type_name(), convert2string(), UVM_MEDIUM)
  else
    printer.m_string = convert2string();
endfunction : do_print


function void basic_io_seq_item::do_record(uvm_recorder recorder);
  super.do_record(recorder);
  // Use the record macros to record the item fields:
  `uvm_record_field("delay10_int", delay10_int)
  `uvm_record_field("delay_real",  delay_real) 
  `uvm_record_field("buttons",     buttons)    
  `uvm_record_field("switches",    switches)   
  `uvm_record_field("leds",        leds)       
endfunction : do_record


function void basic_io_seq_item::do_pack(uvm_packer packer);
  super.do_pack(packer);
//   `uvm_pack_int(delay10_int) 
//   `uvm_pack_int(delay_real)  
//   `uvm_pack_int(buttons)     
//   `uvm_pack_int(switches)    
//   `uvm_pack_int(leds)        
endfunction : do_pack


function void basic_io_seq_item::do_unpack(uvm_packer packer);
  super.do_unpack(packer);
//   `uvm_unpack_int(delay10_int) 
//   `uvm_unpack_int(delay_real)  
//   `uvm_unpack_int(buttons)     
//   `uvm_unpack_int(switches)    
//   `uvm_unpack_int(leds)        
endfunction : do_unpack


function string basic_io_seq_item::convert2string();
  string s;
  $sformat(s, "%s\n", super.convert2string());
  $sformat(s, {"%s\n",
    "delay10_int = 'h%0h  'd%0d\n", 
    "delay_real  = 'h%0h  'd%0d\n", 
    "buttons     = 'h%0h  'd%0d\n", 
    "switches    = 'h%0h  'd%0d\n", 
    "leds        = 'h%0h  'd%0d\n"},
    get_full_name(), delay10_int, delay10_int, delay_real, delay_real, buttons, buttons, switches, switches, leds, leds);
  return s;
endfunction : convert2string

