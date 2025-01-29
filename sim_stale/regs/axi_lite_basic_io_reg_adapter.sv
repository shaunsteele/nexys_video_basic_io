// axi_lite_basic_io_reg_adapter.sv

`ifndef __AXI_LITE_BASIC_IO_REG_ADAPTER
`define __AXI_LITE_BASIC_IO_REG_ADAPTER

class axi_lite_basic_io_reg_adapter extends uvm_reg_adapter;

`uvm_object_utils(basic_io_reg_axi_lite_adapter)

function new(string name="axi_lite_basic_io_reg_adapter");
    super.new(name);
endfunction

virtual function uvm_sequence_item reg2bus(const ref uvm_reg_bus_op rw);
    axi_lite_seq_item txn = axi_lite_seq_item::type_id::create("txn");
    txn.r_wn = (rw.kind == UVM_WRITE) ? 1 : 0;
    txn.addr = rw.addr;
    txn.data = rw.data;
    return txn;
endfunction

virtual function void bus2reg(uvm_sequence_item bus_item, ref uvm_reg_bus_op rw);
    axi_lite_seq_item txn;
    if (!$cast(txn, bus_item)) begin
        `uvm_fatal("basic_io_reg_axi_lite_adapter","Failed to cast bus_item to axi_lite_seq_item")
    end
    rw.kind = txn.w_rn ? UVM_WRITE : UVM_READ;
    rw.addr = txn.addr;
    rw.data = txn.data;
endfunction

endclass

`endif
