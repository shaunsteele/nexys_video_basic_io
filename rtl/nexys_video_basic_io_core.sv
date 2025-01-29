// nexys_video_basic_io_core.sv

`default_nettype none

module nexys_video_basic_io_core #(
    int AXI_ID_WIDTH = 1,
    int AXI_ADDR_WIDTH = 64,
    int AXI_DATA_WIDTH = 64,
    int AXI_STRB_WIDTH = AXI_DATA_WIDTH / 8,
    int AXI_RESP_WIDTH = 2
)(
    /* AXI Lite Subordinate Interface */
    input var logic                             aclk,
    input var logic                             areset,

    // write address channel
    input var logic                             i_awvalid,
    output var logic                            o_awready,
    input var logic     [AXI_ID_WIDTH-1:0]      i_awid,
    input var logic     [AXI_ADDR_WIDTH-1:0]    i_awaddr,
    input var logic     [2:0]                   i_awprot,

    // write data channel
    input var logic                             i_wvalid,
    output var logic                            o_wready,
    input var logic     [AXI_DATA_WIDTH-1:0]    i_wdata,
    input var logic     [AXI_STRB_WIDTH-1:0]    i_wstrb,

    // write response channel
    output var logic                            o_bvalid,
    input var logic                             i_bready,
    output var logic    [AXI_ID_WIDTH-1:0]      o_bid,
    output var logic    [AXI_RESP_WIDTH-1:0]    o_bresp,

    // read address channel
    input var logic                             i_arvalid,
    output var logic                            o_arready,
    input var logic     [AXI_ID_WIDTH-1:0]      i_arid,
    input var logic     [AXI_ADDR_WIDTH-1:0]    i_araddr,
    input var logic     [2:0]                   i_arprot,

    // read data channel
    output var logic                            o_rvalid,
    input var logic                             i_rready,
    output var logic    [AXI_ID_WIDTH-1:0]      o_rid,
    output var logic    [AXI_DATA_WIDTH-1:0]    o_rdata,
    output var logic    [AXI_RESP_WIDTH-1:0]    o_rresp,

    /* Basic IO Interface */
    input var logic     [4:0]                   i_buttons,
    input var logic     [7:0]                   i_switches,
    output var logic    [7:0]                   o_leds
);

endmodule
