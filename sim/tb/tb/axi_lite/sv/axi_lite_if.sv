// You can insert code here by setting file_header_inc in file common.tpl

//=============================================================================
// Project  : tb
//
// File Name: axi_lite_if.sv
//
// Author   : Name   : Shaun Steele
//            Email  : shaun.steele.1020@gmail.com
//            Year   : 2025
//
// Version:   1.0
//
// Code created by Easier UVM Code Generator version 2017-01-19 on Wed Jan 29 00:00:49 2025
//=============================================================================
// Description: Signal interface for agent axi_lite
//=============================================================================

`ifndef AXI_LITE_IF_SV
`define AXI_LITE_IF_SV

interface axi_lite_if(); 

  timeunit      1ns;
  timeprecision 10ps;

  import axi_lite_pkg::*;

  logic         aclk;
  logic         aresetn;
  logic         awvalid;
  logic         awready;
  logic [0:0]   awid;
  logic [63:0]  awaddr;
  logic [2:0]   awprot;
  logic         wvalid;
  logic         wready;
  logic [63:0]  wdata;
  logic [8:0]   wstrb;
  logic         bvalid;
  logic         bready;
  logic [0:0]   bid;
  logic [1:0]   bresp;
  logic         arvalid;
  logic         arready;
  logic [0:0]   arid;
  logic [63:0]  araddr;
  logic [2:0]   arprot;
  logic         rvalid;
  logic         rready;
  logic [0:0]   rid;
  logic [63:0]  rdata;
  logic [1:0]   rresp;

  // You can insert properties and assertions here

  // You can insert code here by setting if_inc_inside_interface in file axi_lite.tpl

endinterface : axi_lite_if

`endif // AXI_LITE_IF_SV

