// You can insert code here by setting file_header_inc in file common.tpl

//=============================================================================
// Project  : tb
//
// File Name: axi_lite_coverage.sv
//
// Author   : Name   : Shaun Steele
//            Email  : shaun.steele.1020@gmail.com
//            Year   : 2025
//
// Version:   1.0
//
// Code created by Easier UVM Code Generator version 2017-01-19 on Wed Jan 29 00:00:49 2025
//=============================================================================
// Description: Coverage for agent axi_lite
//=============================================================================

`ifndef AXI_LITE_COVERAGE_SV
`define AXI_LITE_COVERAGE_SV

// You can insert code here by setting agent_cover_inc_before_class in file axi_lite.tpl

class axi_lite_coverage extends uvm_subscriber #(axi_lite_seq_item);

  `uvm_component_utils(axi_lite_coverage)

  axi_lite_config   m_config;    
  bit               m_is_covered;
  axi_lite_seq_item m_item;
     
  // You can replace covergroup m_cov by setting agent_cover_inc in file axi_lite.tpl
  // or remove covergroup m_cov by setting agent_cover_generate_methods_inside_class = no in file axi_lite.tpl

  covergroup m_cov;
    option.per_instance = 1;
    // You may insert additional coverpoints here ...

    cp_cmd: coverpoint m_item.cmd;
    //  Add bins here if required

    cp_addr: coverpoint m_item.addr;
    //  Add bins here if required

    cp_data: coverpoint m_item.data;
    //  Add bins here if required

  endgroup

  // You can remove new, write, and report_phase by setting agent_cover_generate_methods_inside_class = no in file axi_lite.tpl

  extern function new(string name, uvm_component parent);
  extern function void write(input axi_lite_seq_item t);
  extern function void build_phase(uvm_phase phase);
  extern function void report_phase(uvm_phase phase);

  // You can insert code here by setting agent_cover_inc_inside_class in file axi_lite.tpl

endclass : axi_lite_coverage 


// You can remove new, write, and report_phase by setting agent_cover_generate_methods_after_class = no in file axi_lite.tpl

function axi_lite_coverage::new(string name, uvm_component parent);
  super.new(name, parent);
  m_is_covered = 0;
  m_cov = new();
endfunction : new


function void axi_lite_coverage::write(input axi_lite_seq_item t);
  if (m_config.coverage_enable)
  begin
    m_item = t;
    m_cov.sample();
    // Check coverage - could use m_cov.option.goal instead of 100 if your simulator supports it
    if (m_cov.get_inst_coverage() >= 100) m_is_covered = 1;
  end
endfunction : write


function void axi_lite_coverage::build_phase(uvm_phase phase);
  if (!uvm_config_db #(axi_lite_config)::get(this, "", "config", m_config))
    `uvm_error(get_type_name(), "axi_lite config not found")
endfunction : build_phase


function void axi_lite_coverage::report_phase(uvm_phase phase);
  if (m_config.coverage_enable)
    `uvm_info(get_type_name(), $sformatf("Coverage score = %3.1f%%", m_cov.get_inst_coverage()), UVM_MEDIUM)
  else
    `uvm_info(get_type_name(), "Coverage disabled for this agent", UVM_MEDIUM)
endfunction : report_phase


// You can insert code here by setting agent_cover_inc_after_class in file axi_lite.tpl

`endif // AXI_LITE_COVERAGE_SV

