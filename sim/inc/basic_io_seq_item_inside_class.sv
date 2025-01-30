localparam int DelayLimit = 100;
constraint c_delay10_int  {delay10_int < DelayLimit;}

extern function void post_randomize();
