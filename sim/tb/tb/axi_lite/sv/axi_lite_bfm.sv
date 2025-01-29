// You can insert code here by setting file_header_inc in file common.tpl

//=============================================================================
// Project  : tb
//
// File Name: axi_lite_bfm.sv
//
// Author   : Name   : Shaun Steele
//            Email  : shaun.steele.1020@gmail.com
//            Year   : 2025
//
// Version:   1.0
//
// Code created by Easier UVM Code Generator version 2017-01-19 on Wed Jan 29 00:00:49 2025
//=============================================================================
// Description: Synthesizable BFM for agent axi_lite
//=============================================================================

`ifndef AXI_LITE_BFM_SV
`define AXI_LITE_BFM_SV

interface axi_lite_bfm(axi_lite_if if_port); 

  timeunit      1ns;
  timeprecision 10ps;

  import axi_lite_pkg::*;

  // You can insert code here by setting agent_inc_inside_bfm in file axi_lite.tpl

endinterface : axi_lite_bfm

`endif // AXI_LITE_BFM_SV

