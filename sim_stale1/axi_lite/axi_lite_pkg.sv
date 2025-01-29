// axi_lite_pkg.sv

`include "uvm_macros.svh"

package axi_lite_pkg;

import uvm_pkg::*;

`include "axi_lite_seq_item.sv"
`include "axi_lite_agent_config.sv"
`include "axi_lite_driver.sv"
`include "axi_lite_monitor.sv"
`include "axi_lite_agent.sv"

endpackage
