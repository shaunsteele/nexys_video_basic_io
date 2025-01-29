task body();
    regmodel.LD.write(status, .value('hFF), .parent(this));
    assert (status == UVM_IS_OK);

    regmodel.LD.read(status, .value(data), .parent(this));
    assert(status == UVM_IS_OK);
endtask
