// basic_io_driver.svh

class basic_io_driver extends uvm_driver #(basic_io_seq_item, basic_io_seq_item);

`uvm_component_utils(basic_io_driver)

local virtual basic_io_driver_bfm_if m_bfm;

function new(string name="basic_io_driver", uvm_component parent=null);
    super.new(name, parent);
endfunction

virtual function build_phase(uvm_phase phase);
    super.build_phase(phase);
    if (!uvm_config_db #(virtual basic_io_driver_bfm_if)::get(this, "", "basic_io_driver_bfm", m_bfm)) begin
        `uvm_fatal("basic_io_driver/build_phase","Cannot get basic_io_driver_bfm")
    end
endfunction

virtual task run_phase(uvm_phase phase);
    basic_io_seq_item   req;
    basic_io_seq_item   rsp;

    forever begin
        seq_item_port.get_next_item(req);
        m_bfm.drive(req);
        seq_item_port.item_done();
    end
endtask

endclass
