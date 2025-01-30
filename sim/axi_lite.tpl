agent_name = axi_lite

trans_item  = axi_lite_seq_item
trans_var = rand uvm_access_e   cmd;
trans_var = rand int            awdelay;
trans_var = rand int            wdelay;
trans_var = rand int            bdelay;
trans_var = rand int            ardelay;
trans_var = rand int            rdelay;
trans_var = rand bit [0:0]      awid;
trans_var = rand bit [0:0]      bid;
trans_var = rand bit [0:0]      arid;
trans_var = rand bit [0:0]      rid;
trans_var = rand bit [63:0]     addr;
trans_var = rand bit [2:0]      prot;
trans_var = rand bit [63:0]     data;
trans_var = rand bit [7:0]      strb;
trans_var = rand bit [1:0]      resp;

config_var = bit m_sn               = 1;
config_var = int id_width          = 32;
config_var = int addr_width        = 64;
#config_var = bit prot_present      = 1;
#config_var = bit user_present      = 0;
#config_var = bit user_req_width    = 0;
config_var = int data_width        = 64;
config_var = bit strb_present      = 1;
config_var = int strb_width        = data_width / 8;
config_var = int resp_width        = 3;

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

if_clock    = aclk
if_reset    = aresetn

trans_generate_methods_after_class  = no

monitor_inc             = axi_lite_monitor_inc.sv           inline
driver_inc              = axi_lite_driver_inc.sv            inline

if_inc_inside_interface = axi_lite_inc_inside_interface.sv  inline

trans_inc_inside_class  = axi_lite_seq_item_inside_class.sv inline
trans_inc_after_class   = axi_lite_seq_item_after_class.sv  inline

reg_access_mode         = WR
reg_access_map          = basic_io_reg_block
reg_access_block_type   = basic_io_reg_block

uvm_reg_kind    = cmd
uvm_reg_addr    = addr
uvm_reg_data    = data

