// You can insert code here by setting file_header_inc in file common.tpl

//=============================================================================
// Project  : tb
//
// File Name: axi_lite_seq_item.sv
//
// Author   : Name   : Shaun Steele
//            Email  : shaun.steele.1020@gmail.com
//            Year   : 2025
//
// Version:   1.0
//
// Code created by Easier UVM Code Generator version 2017-01-19 on Wed Jan 29 00:00:49 2025
//=============================================================================
// Description: Sequence item for axi_lite_sequencer
//=============================================================================

`ifndef AXI_LITE_SEQ_ITEM_SV
`define AXI_LITE_SEQ_ITEM_SV

// You can insert code here by setting trans_inc_before_class in file axi_lite.tpl

class axi_lite_seq_item extends uvm_sequence_item; 

  `uvm_object_utils(axi_lite_seq_item)

  // To include variables in copy, compare, print, record, pack, unpack, and compare2string, define them using trans_var in file axi_lite.tpl
  // To exclude variables from compare, pack, and unpack methods, define them using trans_meta in file axi_lite.tpl

  // Transaction variables
  rand uvm_access_e cmd
  rand bit [63:0] addr;
  rand bit [63:0] data;


  extern function new(string name = "");

  // You can remove do_copy/compare/print/record and convert2string method by setting trans_generate_methods_inside_class = no in file axi_lite.tpl
  extern function void do_copy(uvm_object rhs);
  extern function bit  do_compare(uvm_object rhs, uvm_comparer comparer);
  extern function void do_print(uvm_printer printer);
  extern function void do_record(uvm_recorder recorder);
  extern function void do_pack(uvm_packer packer);
  extern function void do_unpack(uvm_packer packer);
  extern function string convert2string();

  // Start of inlined include file tb/tb/include/axi_lite_seq_item_inside_class.sv
  constraint c_cmd {cmd = UVM_WRITE || cmd = UVM_READ;}
  // End of inlined include file

endclass : axi_lite_seq_item 


function axi_lite_seq_item::new(string name = "");
  super.new(name);
endfunction : new


// You can remove do_copy/compare/print/record and convert2string method by setting trans_generate_methods_after_class = no in file axi_lite.tpl

function void axi_lite_seq_item::do_copy(uvm_object rhs);
  axi_lite_seq_item rhs_;
  if (!$cast(rhs_, rhs))
    `uvm_fatal(get_type_name(), "Cast of rhs object failed")
  super.do_copy(rhs);
  cmd  = rhs_.cmd; 
  addr = rhs_.addr;
  data = rhs_.data;
endfunction : do_copy


function bit axi_lite_seq_item::do_compare(uvm_object rhs, uvm_comparer comparer);
  bit result;
  axi_lite_seq_item rhs_;
  if (!$cast(rhs_, rhs))
    `uvm_fatal(get_type_name(), "Cast of rhs object failed")
  result = super.do_compare(rhs, comparer);
  result &= comparer.compare_field("cmd", cmd,   rhs_.cmd,  $bits(cmd));
  result &= comparer.compare_field("addr", addr, rhs_.addr, $bits(addr));
  result &= comparer.compare_field("data", data, rhs_.data, $bits(data));
  return result;
endfunction : do_compare


function void axi_lite_seq_item::do_print(uvm_printer printer);
  if (printer.knobs.sprint == 0)
    `uvm_info(get_type_name(), convert2string(), UVM_MEDIUM)
  else
    printer.m_string = convert2string();
endfunction : do_print


function void axi_lite_seq_item::do_record(uvm_recorder recorder);
  super.do_record(recorder);
  // Use the record macros to record the item fields:
  `uvm_record_field("cmd",  cmd) 
  `uvm_record_field("addr", addr)
  `uvm_record_field("data", data)
endfunction : do_record


function void axi_lite_seq_item::do_pack(uvm_packer packer);
  super.do_pack(packer);
  `uvm_pack_int(cmd)  
  `uvm_pack_int(addr) 
  `uvm_pack_int(data) 
endfunction : do_pack


function void axi_lite_seq_item::do_unpack(uvm_packer packer);
  super.do_unpack(packer);
  `uvm_unpack_int(cmd)  
  `uvm_unpack_int(addr) 
  `uvm_unpack_int(data) 
endfunction : do_unpack


function string axi_lite_seq_item::convert2string();
  string s;
  $sformat(s, "%s\n", super.convert2string());
  $sformat(s, {"%s\n",
    "cmd  = 'h%0h  'd%0d\n", 
    "addr = 'h%0h  'd%0d\n", 
    "data = 'h%0h  'd%0d\n"},
    get_full_name(), cmd, cmd, addr, addr, data, data);
  return s;
endfunction : convert2string


// You can insert code here by setting trans_inc_after_class in file axi_lite.tpl

`endif // AXI_LITE_SEQ_ITEM_SV

