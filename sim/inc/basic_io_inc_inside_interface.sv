task do_mon(output axi_lite_seq_item m_item);
    m_item = axi_lite_seq_item::type_id::create("m_item");

    @(buttons, switches, leds);
    m_item.buttons = buttons;
    m_item.switches = switches;
    m_item.leds = leds;
endtask

task drive(input real delay, input bit [4:0] rhs_buttons, input bit [7:0] rhs_switches);
    #(delay);
    buttons = rhs_buttons;
    switches = rhs_switches;
endtask
