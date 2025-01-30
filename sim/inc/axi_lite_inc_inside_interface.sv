// monitor handling
task do_mon(output axi_lite_seq_item m_item);
    m_item = axi_lite_seq_item::type_id::create("m_item");

    wait ((awvalid && awready) || (wvalid && wready) || (arvalid && arready));
    if ((awvalid && awready) || (wvalid && wready)) begin
        m_item.cmd = UVM_WRITE;
        fork
            mon_aw(m_item);
            mon_w(m_item);
        join
        mon_b(m_item);
    end else begin
        m_item.cmd = UVM_READ;
        mon_ar(m_item);
        mon_r(m_item);
    end
endtask

task mon_aw(ref axi_lite_seq_item m_item);
    wait(awvalid && awready);
    m_item.awid     = awid;
    m_item.awaddr   = awaddr;
    m_item.awprot   = awprot;
endtask

task mon_w(ref axi_lite_seq_item m_item);
    wait(wvalid && wready);
    m_item.wdata    = wdata;
    m_item.wstrb    = wstrb;
endtask

task mon_b(ref axi_lite_seq_item m_item);
    wait(bvalid && bready);
    m_item.bid      = bid;
    m_item.bresp    = bresp;
endtask

task mon_ar(ref axi_lite_seq_item m_item);
    wait(arvalid && arready);
    m_item.arid     = arid;
    m_item.araddr   = araddr;
    m_item.arprot   = arprot;
endtask

task mon_r(ref axi_lite_seq_item m_item);
    wait(rvalid && rready);
    m_item.rid      = rid;
    m_item.rdata    = rdata;
    m_item.rresp    = rresp;
endtask


// driver handling
task reset();
    if (cfg.m_sn) begin
        awvalid <= 0;
        awid    <= 0;
        awaddr  <= 0;
        awprot  <= 0;
        wvalid  <= 0;
        wdata   <= 0;
        wstrb   <= 0;
        bready  <= 0;
        arvalid <= 0;
        arid    <= 0;
        araddr  <= 0;
        arprot  <= 0;
        rready  <= 0;
    end else begin
        awready <= 0;
        wready  <= 0;
        bvalid  <= 0;
        bid     <= 0;
        bresp   <= 0;
        arready <= 0;
        rid     <= 0;
        rdata   <= 0;
        rresp   <= 0;
    end
endtask

task do_drive(input axi_lite_seq_item req);
    bit status = 1;

    if (cfg.m_sn) begin
        if (req.cmd == UVM_WRITE) begin
            fork
                write_addr(req.awdelay, req.id, req.addr, req.prot);
                write_data(req.wdelay, req.data, req.strb);
            join
            write_resp(req.bdelay, status);
        end

        if (req.cmd == UVM_READ) begin
            read_addr(req.ardelay, req.id, req.addr, req.prot);
            read_data(req.rdelay, status);
        end
    end

    if (status)
        `uvm_fatal(get_type_name(),$sformatf("bad cmd: %s",cmd.name()))
endtask

task write_addr(input int delay, input bit [0:0] id, input bit [63:0] addr, input bit [2:0] prot);
    repeat (delay) @(posedge aclk);
    awvalid <= 1;
    awid <= id;
    awaddr <= addr;
    awprot <= prot;
    @(posedge aclk);
    wait (awready);
    awvalid <= 0;
endtask

task write_data(input int delay, input bit [63:0] data, input bit [7:0] strb);
    repeat (delay) @(posedge aclk);
    wvalid <= 1;
    wdata <= data;
    wstrb <= strb;
    @(posedge aclk);
    wait (wready);
    wvalid <= 0;
endtask

task write_resp(input int delay, output bit status);
    repeat (delay) @(posedge aclk);
    bready <= 1;
    @(posedge aclk);
    wait (bvalid);
    bready <= 0;
    status = 0;
endtask

task read_addr(input int delay, input bit [0:0] id, input bit [63:0] addr, input bit [2:0] prot);
    repeat (delay) @(posedge aclk);
    arvalid <= 1;
    arid <= id;
    araddr <= addr;
    arprot <= prot;
    @(posedge aclk);
    wait (arready);
    arvalid <= 0;
endtask

task read_data(input int delay, output bit status);
    repeat (delay) @(posedge aclk);
    rready <= 1;
    @(posedge aclk);
    wait (rvalid);
    rready <= 0;
    status = 0;
endtask
