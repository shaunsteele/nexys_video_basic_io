task axi_lite_monitor::do_mon();
    forever @(posedge vif.clk)
    begin
        vif.do_mon(m_trans);
        analysis_port.write(m_trans);
    end
endtask