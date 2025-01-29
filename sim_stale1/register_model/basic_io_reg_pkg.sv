// basic_io_reg_pkg.sv

`include "uvm_macros.svh"

package basic_io_reg_pkg;

import uvm_pkg::*;

parameter int REGISTER_WIDTH = 64;

`include "basic_io_reg.svh"
`include "basic_io_reg_block.svh"

endpackage
