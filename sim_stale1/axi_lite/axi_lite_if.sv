// axi_lite_if.sv
//  optional AXI5-Lite signals:
//      - bresp

`default_nettype none

interface axi_lite_if#(
    parameter int ID_WIDTH = 1,
    parameter int ADDR_WIDTH = 64,
    parameter int DATA_WIDTH = 64,
    parameter int STRB_WIDTH = DATA_WIDTH / 8,
    parameter int RESP_WIDTH = 2

)(
    input var aclk,
    input var aresetn
);

// write address channel
logic                       awvalid;
logic                       awready;
logic   [ID_WIDTH-1:0]      awid;
logic   [ADDR_WIDTH-1:0]    awaddr;
logic   [2:0]               awprot;

// write data channel
logic                       wvalid;
logic                       wready;
logic   [DATA_WIDTH-1:0]    wdata;
logic   [STRB_WIDTH-1:0]    wstrb;

// write response channel
logic                       bvalid;
logic                       bready;
logic   [ID_WIDTH-1:0]      bid;
logic   [RESP_WIDTH-1:0]    bresp;

// read address channel
logic                       arvalid;
logic                       arready;
logic   [ID_WIDTH-1:0]      arid;
logic   [ADDR_WIDTH-1:0]    araddr;
logic   [2:0]               arprot;

// read data channel
logic                       rvalid;
logic                       rready;
logic   [ID_WIDTH-1:0]      rid;
logic   [DATA_WIDTH-1:0]    rdata;
logic   [RESP_WIDTH-1:0]    rresp;


endinterface
