// basic_io_driver_bfm.sv

`default_nettype none

`include "uvm_macros.svh"

interface basic_io_driver_bfm_if (
    output var logic    [5:0]   o_buttons,
    output var logic    [7:0]   o_switches,
    input var logic     [7:0]   i_leds
);

import uvm_pkg::*;
import basic_io_agent_pkg::*;

task drive(basic_io_seq_item req);
    #(req.delay);
    o_buttons <= req.buttons;
    o_switches <= req.switches;
endtask

endinterface
