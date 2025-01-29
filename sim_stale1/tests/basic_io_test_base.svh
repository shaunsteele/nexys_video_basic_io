// basic_io_test_base.svh

class basic_io_test_base extends uvm_test;

`uvm_component_utils(basic_io_test_base)

function new(string name="basic_io_test_base", uvm_component parent=null);
    super.new(name, parent);
endfunction

virtual function void build_phase(uvm_phase phase);
    super.build_phase(phase);
endfunction

virtual function void connect_phase(uvm_phase phase);
    super.connect_phase(phase);
endfunction

endclass
