constraint c_cmd        {cmd == UVM_WRITE || cmd == UVM_READ;}

localparam int DelayLimit = 2;
constraint c_awdelay    {awdelay < DelayLimit;}
constraint c_wdelay     {wdelay < DelayLimit;}
constraint c_bdelay     {bdelay < DelayLimit;}
constraint c_ardelay    {ardelay < DelayLimit;}
constraint c_rdelay     {rdelay < DelayLimit;}

constraint c_id         {awid == 0;}
constraint c_id_eq      {awid == bid && awid == arid && awid == rid;}

constraint c_prot       {prot == 3'b0;}

constraint c_strb       {strb == 8'hFF;}

constraint c_resp       {resp == 2'b00;}
