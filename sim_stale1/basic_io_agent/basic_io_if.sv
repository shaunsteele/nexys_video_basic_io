// basic_io_if.sv

`default_nettype none

interface basic_io_if;

logic [4:0] buttons;
logic [7:0] switches;
logic [7:0] leds;

endinterface
