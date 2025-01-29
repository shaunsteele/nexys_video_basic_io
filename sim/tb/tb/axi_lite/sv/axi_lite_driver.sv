// You can insert code here by setting file_header_inc in file common.tpl

//=============================================================================
// Project  : tb
//
// File Name: axi_lite_driver.sv
//
// Author   : Name   : Shaun Steele
//            Email  : shaun.steele.1020@gmail.com
//            Year   : 2025
//
// Version:   1.0
//
// Code created by Easier UVM Code Generator version 2017-01-19 on Wed Jan 29 00:00:49 2025
//=============================================================================
// Description: Driver for axi_lite
//=============================================================================

`ifndef AXI_LITE_DRIVER_SV
`define AXI_LITE_DRIVER_SV

// You can insert code here by setting driver_inc_before_class in file axi_lite.tpl

class axi_lite_driver extends uvm_driver #(axi_lite_seq_item);

  `uvm_component_utils(axi_lite_driver)

  virtual axi_lite_bfm vif;

  axi_lite_config     m_config;

  extern function new(string name, uvm_component parent);

  // You can insert code here by setting driver_inc_inside_class in file axi_lite.tpl

endclass : axi_lite_driver 


function axi_lite_driver::new(string name, uvm_component parent);
  super.new(name, parent);
endfunction : new


// You can insert code here by setting driver_inc_after_class in file axi_lite.tpl

`endif // AXI_LITE_DRIVER_SV

