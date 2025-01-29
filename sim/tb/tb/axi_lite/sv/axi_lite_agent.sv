// You can insert code here by setting file_header_inc in file common.tpl

//=============================================================================
// Project  : tb
//
// File Name: axi_lite_agent.sv
//
// Author   : Name   : Shaun Steele
//            Email  : shaun.steele.1020@gmail.com
//            Year   : 2025
//
// Version:   1.0
//
// Code created by Easier UVM Code Generator version 2017-01-19 on Wed Jan 29 00:00:49 2025
//=============================================================================
// Description: Agent for axi_lite
//=============================================================================

`ifndef AXI_LITE_AGENT_SV
`define AXI_LITE_AGENT_SV

// You can insert code here by setting agent_inc_before_class in file axi_lite.tpl

class axi_lite_agent extends uvm_agent;

  `uvm_component_utils(axi_lite_agent)

  uvm_analysis_port #(axi_lite_seq_item) analysis_port;

  axi_lite_config       m_config;
  axi_lite_sequencer_t  m_sequencer;
  axi_lite_driver       m_driver;
  axi_lite_monitor      m_monitor;

  local int m_is_active = -1;

  extern function new(string name, uvm_component parent);

  // You can remove build/connect_phase and get_is_active by setting agent_generate_methods_inside_class = no in file axi_lite.tpl

  extern function void build_phase(uvm_phase phase);
  extern function void connect_phase(uvm_phase phase);
  extern function uvm_active_passive_enum get_is_active();

  // You can insert code here by setting agent_inc_inside_class in file axi_lite.tpl

endclass : axi_lite_agent 


function  axi_lite_agent::new(string name, uvm_component parent);
  super.new(name, parent);
  analysis_port = new("analysis_port", this);
endfunction : new


// You can remove build/connect_phase and get_is_active by setting agent_generate_methods_after_class = no in file axi_lite.tpl

function void axi_lite_agent::build_phase(uvm_phase phase);

  // You can insert code here by setting agent_prepend_to_build_phase in file axi_lite.tpl

  if (!uvm_config_db #(axi_lite_config)::get(this, "", "config", m_config))
    `uvm_error(get_type_name(), "axi_lite config not found")

  m_monitor     = axi_lite_monitor    ::type_id::create("m_monitor", this);

  if (get_is_active() == UVM_ACTIVE)
  begin
    m_driver    = axi_lite_driver     ::type_id::create("m_driver", this);
    m_sequencer = axi_lite_sequencer_t::type_id::create("m_sequencer", this);
  end

  // You can insert code here by setting agent_append_to_build_phase in file axi_lite.tpl

endfunction : build_phase


function void axi_lite_agent::connect_phase(uvm_phase phase);
  if (m_config.vif == null)
    `uvm_warning(get_type_name(), "axi_lite virtual interface is not set!")

  m_monitor.vif      = m_config.vif;
  m_monitor.m_config = m_config;
  m_monitor.analysis_port.connect(analysis_port);

  if (get_is_active() == UVM_ACTIVE)
  begin
    m_driver.seq_item_port.connect(m_sequencer.seq_item_export);
    m_driver.vif      = m_config.vif;
    m_driver.m_config = m_config;
  end

  // You can insert code here by setting agent_append_to_connect_phase in file axi_lite.tpl

endfunction : connect_phase


function uvm_active_passive_enum axi_lite_agent::get_is_active();
  if (m_is_active == -1)
  begin
    if (uvm_config_db#(uvm_bitstream_t)::get(this, "", "is_active", m_is_active))
    begin
      if (m_is_active != m_config.is_active)
        `uvm_warning(get_type_name(), "is_active field in config_db conflicts with config object")
    end
    else 
      m_is_active = m_config.is_active;
  end
  return uvm_active_passive_enum'(m_is_active);
endfunction : get_is_active


// You can insert code here by setting agent_inc_after_class in file axi_lite.tpl

`endif // AXI_LITE_AGENT_SV

