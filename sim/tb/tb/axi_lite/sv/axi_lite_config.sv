// You can insert code here by setting file_header_inc in file common.tpl

//=============================================================================
// Project  : tb
//
// File Name: axi_lite_config.sv
//
// Author   : Name   : Shaun Steele
//            Email  : shaun.steele.1020@gmail.com
//            Year   : 2025
//
// Version:   1.0
//
// Code created by Easier UVM Code Generator version 2017-01-19 on Wed Jan 29 00:00:49 2025
//=============================================================================
// Description: Configuration for agent axi_lite
//=============================================================================

`ifndef AXI_LITE_CONFIG_SV
`define AXI_LITE_CONFIG_SV

// You can insert code here by setting agent_config_inc_before_class in file axi_lite.tpl

class axi_lite_config extends uvm_object;

  // Do not register config class with the factory

  virtual axi_lite_bfm     vif;
                  
  basic_io_reg_block       regmodel;
             
  uvm_active_passive_enum  is_active = UVM_ACTIVE;
  bit                      coverage_enable;       
  bit                      checks_enable;         

  // You can insert variables here by setting config_var in file axi_lite.tpl

  // You can remove new by setting agent_config_generate_methods_inside_class = no in file axi_lite.tpl

  extern function new(string name = "");

  // You can insert code here by setting agent_config_inc_inside_class in file axi_lite.tpl

endclass : axi_lite_config 


// You can remove new by setting agent_config_generate_methods_after_class = no in file axi_lite.tpl

function axi_lite_config::new(string name = "");
  super.new(name);
endfunction : new


// You can insert code here by setting agent_config_inc_after_class in file axi_lite.tpl

`endif // AXI_LITE_CONFIG_SV

