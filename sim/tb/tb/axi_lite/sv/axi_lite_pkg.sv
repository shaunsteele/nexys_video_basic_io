// You can insert code here by setting file_header_inc in file common.tpl

//=============================================================================
// Project  : tb
//
// File Name: axi_lite_pkg.sv
//
// Author   : Name   : Shaun Steele
//            Email  : shaun.steele.1020@gmail.com
//            Year   : 2025
//
// Version:   1.0
//
// Code created by Easier UVM Code Generator version 2017-01-19 on Wed Jan 29 00:00:49 2025
//=============================================================================
// Description: Package for agent axi_lite
//=============================================================================

package axi_lite_pkg;

  `include "uvm_macros.svh"

  import uvm_pkg::*;

  import regmodel_pkg::*;

  `include "axi_lite_axi_lite_seq_item.sv"
  `include "axi_lite_config.sv"
  `include "axi_lite_driver.sv"
  `include "axi_lite_monitor.sv"
  `include "axi_lite_sequencer.sv"
  `include "axi_lite_coverage.sv"
  `include "axi_lite_agent.sv"
  `include "axi_lite_seq_lib.sv"
  `include "reg2axi_lite_adapter.sv"
  `include "axi_lite_env_coverage.sv"
  `include "axi_lite_env.sv"
  `include "axi_lite_env_seq_lib.sv"

endpackage : axi_lite_pkg
