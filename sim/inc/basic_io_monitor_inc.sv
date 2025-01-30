task basic_io_monitor::do_mon;
    forever begin
        vif.do_mon(m_trans);
        analysis_port.write(m_trans);
    end
endtask