// basic_io_monitor_bfm.sv

`default_nettype none

interface basic_io_driver_monitor_if (
    input var logic [5:0]   i_buttons,
    input var logic [7:0]   i_switches,
    input var logic [7:0]   i_leds
);

import basic_io_agent_pkg::*;

basic_io_monitor    proxy;
basic_io_seq_item   item;

task run();
    basic_io_seq_item   cloned_item;

    item = basic_io_seq_item::type_id::create("item");

    forver begin
        @(i_buttons, i_switches, i_leds);
        item.buttons = i_buttons;
        item.switches = i_switches;
        item.leds = i_leds;

        // clone and publish the cloned item to the subscribers
        $cast(cloned_item, item.clone());
        proxy.notify_transaction(cloned_item);
    end
    
endtask

endinterface
