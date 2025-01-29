// basic_io_agent_pkg.sv

`include "uvm_macros.svh"

package basic_io_agent_pkg;

import uvm_pkg::*;

`include "basic_io_seq_item.svh"
`include "basic_io_driver.svh"
`include "basic_io_monitor.svh"
typedef uvm_sequencer#(basic_io_seq_item) basic_io_sequencer;

endpackage
