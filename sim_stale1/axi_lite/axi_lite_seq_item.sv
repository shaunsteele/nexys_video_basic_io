// axi_lite_seq_item.sv

`ifndef __AXI_LITE_SEQ_ITEM
`define __AXI_LITE_SEQ_ITEM

class axi_lite_seq_item extends uvm_sequence_item;

// parameters
int id_width = 1;
int addr_width = 64;
int data_width = 64;
int strb_width = data_width / 8;
int resp_width = 2;

// transaction variables
rand bit w_rn;  // 1 - write, 0 - read

int delay_limit = 4;
rand int awdelay;
rand int wdelay;
rand int bdelay;
rand int ardelay;
rand int rdelay;


// address channel
rand bit [31:0]     req_id;
rand bit [63:0]     addr;
rand bit [2:0]      prot;

// data/response channel
rand bit [31:0]     rsp_id;
rand bit [1023:0]   data;
rand bit [128:0]    strb;
rand bit [3:0]      resp;

// constraints
constraint req_id_c { req_id inside {[0:id_width-1]}; }
constraint rsp_id_c { rsp_id inside {[0:id_width-1]}; }
constraint addr_c   { addr inside {0, 4, 8}; }
constraint data_c   { data inside {[0:data_width-1]}; }
constraint strb_c   { strb inside {[0:strb_width-1]}; }
constraint resp_c   { resp inside {[0:resp_width-1]}; }

constraint awdelay_c    { awdelay inside {[0:delay_limit-1]}; }
constraint wdelay_c     { awdelay inside {[0:delay_limit-1]}; }
constraint bdelay_c     { awdelay inside {[0:delay_limit-1]}; }
constraint ardelay_c    { awdelay inside {[0:delay_limit-1]}; }
constraint rdelay_c     { awdelay inside {[0:delay_limit-1]}; }

// constructor
function new(string name = "axi_lite_seq_item");
    super.new(name);
endfunction

endclass

`endif
