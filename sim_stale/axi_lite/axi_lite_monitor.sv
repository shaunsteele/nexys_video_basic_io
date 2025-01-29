// axi_lite_monitor.sv

`ifndef __AXI_LITE_MONITOR
`define __AXI_LITE_MONITOR

class axi_lite_monitor extends uvm_monitor;

`uvm_component_utils(axi_lite_monitor)

virtual axi_lite_if vif;

axi_lite_agent_config cfg;

uvm_analysis_port #(axi_lite_seq_item) ap;

function new(string name="axi_lite_monitor", uvm_component parent);
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
    axi_lite_seq_item txn;
    forever begin
        txn = axi_lite_seq_item::type_id::create("txn");
        wait ((vif.cb_mon.awvalid && vif.cb_mon.awready) ||
            (vif.cb_mon.wvalid && vif.cb_mon.wready) ||
            (vif.cb_mon.arvalid && vif.cb_mon.arready)
        );
        if ((vif.cb_mon.awvalid && vif.cb_mon.awready) ||
            (vif.cb_mon.wvalid && vif.cb_mon.wready)
        ) begin
            fork
                mon_aw(txn);
                mon_w(txn);
            join
            mon_b(txn);
        end else begin
            mon_ar(txn);
            mon_r(txn);
        end
        ap.write(txn);
    end
endtask

task mon_aw(ref axi_lite_seq_item txn);
    wait(vif.cb_mon.awvalid && vif.cb_mon.awready);
    txn.w_rn = 1;
    txn.req_id = vif.cb_mon.awid;
    txn.addr = vif.cb_mon.awaddr;
    txn.prot = vif.cb_mon.awprot;
endtask

task mon_w(ref axi_lite_seq_item txn);
    wait(vif.cb_mon.wvalid && vif.cb_mon.wready);
    txn.data = vif.cb_mon.wdata;
    txn.strb = vif.cb_mon.wstrb;
endtask

task mon_b(ref axi_lite_seq_item txn);
    wait(vif.cb_mon.bvalid && vif.cb_mon.bready);
    txn.rsp_id = vif.cb_mon.bid;
    txn.resp = vif.cb_mon.bresp;
endtask

task mon_ar(ref axi_lite_seq_item txn);
    wait(vif.cb_mon.arvalid && vif.cb_mon.arready);
    txn.w_rn = 0;
    txn.req_id = vif.cb_mon.arid;
    txn.addr = vif.cb_mon.araddr;
    txn.prot = vif.cb_mon.arprot;
endtask

task mon_r(ref axi_lite_seq_item txn);
    wait(vif.cb_mon.rvalid && vif.cb_mon.rready);
    txn.rsp_id = vif.cb_mon.rid;
    txn.data = vif.cb_mon.rdata;
    txn.resp = vif.cb_mon.rresp;
endtask

endclass

`endif
