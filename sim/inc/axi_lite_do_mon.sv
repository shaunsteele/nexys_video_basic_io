task axi_lite_monitor::do_mon();
    forever @(posedge vif.clk)
    begin
        m_trans = axi_lite_seq_item::type_id::create("m_trans");
    end
endtask