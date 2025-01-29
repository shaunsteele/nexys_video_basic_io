// hdl_top.sv

module hdl_top;

// Clock and Reset
logic aclk;
logic aresetn;

// pin interfaces
basic_io_if bio();

// bus functional models
basic_io_driver_bfm bio_drv_bfm(
    .o_buttons  (bio.buttons),
    .o_switches (bio.switches),
    .i_leds     (bio.leds)
);

basic_io_monitor_bfm bio_mon_bfm(
    .i_buttons  (bio.buttons),
    .i_switches (bio.switches),
    .i_leds     (bio.leds)
);

// DUT

// UVM
initial begin
    import uvm_pkg::uvm_config_db;
    uvm_config_db #(virtual basic_io_driver_bfm_if)::set(null, "uvm_test_top", "basic_io_driver_bfm", bio_drv_bfm);
    uvm_config_db #(virtual basic_io_monitor_bfm_if)::set(null, "uvm_test_top", "basic_io_monitor_bfm", bio_mon_bfm);
end

// clock and reset
initial begin
    aclk = 0;
    forever #5 aclk = ~aclk;
end

initial begin
    aresetn = 0;
    repeat (20) @(posedge aclk);
    aresetn = 1;
end

endmodule
