// You can insert code here by setting file_header_inc in file common.tpl

//=============================================================================
// Project  : tb
//
// File Name: axi_lite_seq_lib.sv
//
// Author   : Name   : Shaun Steele
//            Email  : shaun.steele.1020@gmail.com
//            Year   : 2025
//
// Version:   1.0
//
// Code created by Easier UVM Code Generator version 2017-01-19 on Wed Jan 29 00:00:49 2025
//=============================================================================
// Description: Sequence for agent axi_lite
//=============================================================================

`ifndef AXI_LITE_SEQ_LIB_SV
`define AXI_LITE_SEQ_LIB_SV

class axi_lite_default_seq extends uvm_sequence #(axi_lite_seq_item);

  `uvm_object_utils(axi_lite_default_seq)

  axi_lite_config  m_config;

  extern function new(string name = "");
  extern task body();

`ifndef UVM_POST_VERSION_1_1
  // Functions to support UVM 1.2 objection API in UVM 1.1
  extern function uvm_phase get_starting_phase();
  extern function void set_starting_phase(uvm_phase phase);
`endif

endclass : axi_lite_default_seq


function axi_lite_default_seq::new(string name = "");
  super.new(name);
endfunction : new


task axi_lite_default_seq::body();
  `uvm_info(get_type_name(), "Default sequence starting", UVM_HIGH)

  req = axi_lite_seq_item::type_id::create("req");
  start_item(req); 
  if ( !req.randomize() )
    `uvm_error(get_type_name(), "Failed to randomize transaction")
  finish_item(req); 

  `uvm_info(get_type_name(), "Default sequence completed", UVM_HIGH)
endtask : body


`ifndef UVM_POST_VERSION_1_1
function uvm_phase axi_lite_default_seq::get_starting_phase();
  return starting_phase;
endfunction: get_starting_phase


function void axi_lite_default_seq::set_starting_phase(uvm_phase phase);
  starting_phase = phase;
endfunction: set_starting_phase
`endif


// You can insert code here by setting agent_seq_inc in file axi_lite.tpl

`endif // AXI_LITE_SEQ_LIB_SV

