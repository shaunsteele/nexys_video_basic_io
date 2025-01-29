function void top_env::connect_phase(uvm_phase phase);
    m_bus_env.m_bus2reg_predictor.map       = regmodel.bus_map;
    m_bus_env.m_bus2reg_predictor.adapter   = m_bus_env.m_reg2bus;

    regmodel.bus_map.set_sequencer(m_bus_env.m_bus_agent.m_sequencer, m_bus_env.m_reg2bus);
    regmodel.bus_map.set_auto_predict(0);
endfunction
