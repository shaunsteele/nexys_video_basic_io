function void top_env::build_phase(uvm_phase phase);
    regmodel = basic_io_reg_block::type_id::create("regmodel");
    regmodel.build();
    m_bus_config.remodel = regmodel.bus;
endfunction
