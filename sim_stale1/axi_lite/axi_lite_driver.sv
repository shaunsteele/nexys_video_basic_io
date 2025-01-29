// axi_lite_driver.sv

`ifndef __AXI_LITE_DRIVER
`define __AXI_LITE_DRIVER

class axi_lite_driver extends uvm_driver #(axi_lite_seq_item);

`uvm_component_utils(axi_lite_driver)

virtual axi_lite_if vif;

axi_lite_agent_config cfg;

axi_lite_seq_item txn;

function new(string name="axi_lite_driver", uvm_component parent);
    super.new(name, parent);
endfunction

virtual function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    if (!uvm_config_db#(virtual axi_lite_vif)::get(this, "*", "axi_lite_vif", vif)) begin
        `uvm_error("axi_lite_driver", "No virtual interface is found")
    end

    if (!uvm_config_db#(axi_lite_agent_config)::get(this,"","axi_lite_agent_config", cfg)) begin
        `uvm_error("axi_lite_driver", "Cannot find configuration")
    end
endfunction

virtual task run_phase(uvm_phase phase);
    reset();
    forever begin
        seq_item_port.get_next_item(txn);
        if (cfg.m_sn) begin
            if (txn.w_rn) begin
                m_write(txn);
            end else begin
                m_read(txn);
            end
        end else begin
            if (txn.w_rn) begin
                s_write(txn);
            end else begin
                s_read(txn);
            end
        end
        seq_item_port.item_done();
    end
endtask

virtual task reset();
    vif.aresetn <= 0;
    repeat (20) @(posedge vif.aclk);
    vif.aresetn <= 1;
endtask

// drives a manager device, acts as a subordinate
virtual task m_write(input axi_lite_seq_item txn);
    fork
        m_aw(txn);
        m_w(txn);
    join
    m_b(txn);
endtask

task m_aw(input axi_lite_seq_item txn);
    vif.m_cb_drv.awready <= 0;

    repeat (txn.awdelay) @(posedge vif.aclk);
    vif.m_cb_drv.awready <= 1;

    @(posedge vif.aclk);
    wait(vif.m_cb_drv.awvalid);
    vif.m_cb_drv.awready <= 0;
endtask

task m_w(input axi_lite_seq_item txn);
    vif.m_cb_drv.wready <= 0;

    repeat (txn.wdelay) @(posedge vif.aclk);
    vif.m_cb_drv.wready <= 1;

    @(posedge vif.aclk);
    wait(vif.m_cb_drv.wvalid);
    vif.m_cb_drv.wready <= 0;
endtask

task m_b(input axi_lite_seq_item txn);
    vif.m_cb_drv.bvalid <= 0;
    vif.m_cb_drv.bid    <= 0;
    vif.m_cb_drv.bresp  <= 0;

    repeat (txn.bdelay) @(posedge vif.aclk);
    vif.m_cb_drv.bvalid <= 1;
    vif.m_cb_drv.bid    <= txn.rsp_id;
    vif.m_cb_drv.bresp  <= txn.resp;

    @(posedge vif.aclk);
    wait(vif.m_cb_drv.bready);
    vif.m_cb_drv.bvalid <= 0;
endtask

task m_read(input axi_lite_seq_item txn);
    m_ar(txn);
    m_r(txn);
endtask

task m_ar(input axi_lite_seq_item txn);
    vif.m_cb_drv.arready <= 0;

    repeat (txn.ardelay) @(posedge vif.aclk);
    vif.m_cb_drv.arready <= 1;

    @(posedge vif.aclk);
    wait (vif.m_cb_drv.arvalid);
    vif.m_cb_drv.arready <= 0;
endtask

task m_r(input axi_lite_seq_item txn);
    vif.m_cb_drv.rvalid <= 0;
    vif.m_cb_drv.rid    <= 0;
    vif.m_cb_drv.rdata  <= 0;
    vif.m_cb_drv.rresp  <= 0;

    repeat (txn.rdelay) @(posedge vif.aclk);
    vif.m_cb_drv.rvalid <= 1;
    vif.m_cb_drv.rid    <= txn.rsp_id;
    vif.m_cb_drv.rdata  <= txn.data;
    vif.m_cb_drv.rresp  <= txn.resp;

    @(posedge vif.aclk);
    wait (vif.m_cb_drv.rready);
    vif.m_cb_drv.rvalid <= 0;
endtask

// drives a subordinate device, acts as a manager
virtual task s_write(input axi_lite_seq_item txn);
    fork
        s_aw(txn);
        s_w(txn);
    join
    s_b(txn);
endtask

task s_aw(input axi_lite_seq_item txn);
    vif.s_cb_drv.awvalid    <= 0;
    vif.s_cb_drv.awid       <= 0;
    vif.s_cb_drv.awaddr     <= 0;
    vif.s_cb_drv.awprot     <= 0;

    repeat (txn.awdelay) @(posedge vif.aclk);
    vif.s_cb_drv.awvalid    <= 1;
    vif.s_cb_drv.awid       <= txn.req_id;
    vif.s_cb_drv.awaddr     <= txn.addr;
    vif.s_cb_drv.awprot     <= txn.prot;

    @(posedge vif.aclk);
    wait(vif.m_cb_drv.awready);
    vif.m_cb_drv.awvalid <= 0;
endtask

task s_w(input axi_lite_seq_item txn);
    vif.s_cb_drv.wvalid <= 0;
    vif.s_cb_drv.wdata  <= 0;
    vif.s_cb_drv.wstrb  <= 0;

    repeat (txn.wdelay) @(posedge vif.aclk);
    vif.s_cb_drv.wvalid <= 1;
    vif.s_cb_drv.wdata  <= txn.data;
    vif.s_cb_drv.wstrb  <= txn.strb;

    @(posedge vif.aclk);
    wait(vif.m_cb_drv.wready);
    vif.s_cb_drv.wvalid <= 0;
endtask

task s_b(input axi_lite_seq_item txn);
    vif.s_cb_drv.bready <= 0;

    repeat (txn.bdelay) @(posedge vif.aclk);
    vif.s_cb_drv.bready <= 1;

    @(posedge vif.aclk);
    wait(vif.s_cb_drv.bvalid);
    vif.s_cb_drv.bready <= 0;
endtask

task s_read(input axi_lite_seq_item txn);
    s_ar(txn);
    s_r(txn);
endtask

task s_ar(input axi_lite_seq_item txn);
    vif.s_cb_drv.arvalid    <= 0;
    vif.s_cb_drv.arid       <= 0;
    vif.s_cb_drv.araddr     <= 0;
    vif.s_cb_drv.arprot     <= 0;

    repeat (txn.ardelay) @(posedge vif.aclk);
    vif.s_cb_drv.arvalid    <= 1;
    vif.s_cb_drv.arid       <= txn.req_id;
    vif.s_cb_drv.araddr     <= txn.addr;
    vif.s_cb_drv.arprot     <= txn.prot;

    @(posedge vif.aclk);
    wait (vif.s_cb_drv.arready);
    vif.s_cb_drv.arvalid <= 0;
endtask

task s_r(input axi_lite_seq_item txn);
    vif.s_cb_drv.rready <= 0;

    repeat (txn.rdelay) @(posedge vif.aclk);
    vif.s_cb_drv.rready <= 1;

    @(posedge vif.aclk);
    wait (vif.s_cb_drv.rvalid);
    vif.s_cb_drv.rready <= 0;
endtask


endclass

`endif
