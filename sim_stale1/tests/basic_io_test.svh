// basic_io_test.svh

class basic_io_test extends basic_io_test_base;

`uvm_component_utils(basic_io_test)

function new(string name="basic_io_test", uvm_component parent=null);
    super.new(name, parent);
endfunction

function void build_phase(uvm_phase phase);
    super.build_phase(phase);
endfunction

task run_phase(uvm_phase phase);
    phase.raise_objection(this, "basic_io_test");
    #100ns;
    phase.drop_objection(this, "basic_io_test");
endtask

endclass
