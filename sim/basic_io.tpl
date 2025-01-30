agent_name = basic_io

trans_item = basic_io_seq_item
trans_var = rand int            delay10_int;
trans_var = real                delay_real;
trans_var = rand bit    [4:0]   buttons;
trans_var = rand bit    [7:0]   switches;
trans_var = bit         [7:0]   leds;

if_port = logic [4:0]   buttons;
if_port = logic [7:0]   switches;
if_port = logic [7:0]   leds;

trans_generate_methods_after_class  = no

monitor_inc             = basic_io_monitor_inc.sv           inline
driver_inc              = basic_io_driver_inc.sv            inline

if_inc_inside_interface = basic_io_inc_inside_interface.sv  inline

trans_inc_inside_class  = basic_io_seq_item_inside_class.sv inline
trans_inc_after_class   = basic_io_seq_item_after_class.sv  inline

reg_access_mode         = WR
reg_access_map          = basic_io_reg_block
reg_access_block_type   = basic_io_reg_block

uvm_reg_kind = cmd
uvm_reg_addr = addr
uvm_reg_data = data
