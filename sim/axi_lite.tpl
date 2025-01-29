agent_name = axi_lite

trans_item  = axi_lite_seq_item
trans_var   = rand uvm_access_e cmd
trans_var   = rand bit [63:0] addr;
trans_var   = rand bit [63:0] data;

trans_inc_inside_class = axi_lite_seq_item_inside_class.sv  inline
monitor_inc = axi_lite_do_mon.sv    inline

if_port = logic         aclk;
if_port = logic         aresetn;
if_port = logic         awvalid;
if_port = logic         awready;
if_port = logic [0:0]   awid;
if_port = logic [63:0]  awaddr;
if_port = logic [2:0]   awprot;
if_port = logic         wvalid;
if_port = logic         wready;
if_port = logic [63:0]  wdata;
if_port = logic [8:0]   wstrb;
if_port = logic         bvalid;
if_port = logic         bready;
if_port = logic [0:0]   bid;
if_port = logic [1:0]   bresp;
if_port = logic         arvalid;
if_port = logic         arready;
if_port = logic [0:0]   arid;
if_port = logic [63:0]  araddr;
if_port = logic [2:0]   arprot;
if_port = logic         rvalid;
if_port = logic         rready;
if_port = logic [0:0]   rid;
if_port = logic [63:0]  rdata;
if_port = logic [1:0]   rresp;

if_clock    = aclk;
if_reset    = aresetn;

reg_access_mode = WR
reg_access_block_type   = basic_io_reg_block

uvm_reg_kind    = cmd
uvm_reg_addr    = addr
uvm_reg_data    = data

