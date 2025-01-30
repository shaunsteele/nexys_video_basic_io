function bit axi_lite_seq_item::do_compare(uvm_object rhs, uvm_comparer comparer);
    bit result;
    axi_lite_seq_item rhs_;
    if (!$cast(rhs_, rhs))
        `uvm_fatal(get_type_name(), "Cast of rhs object failed")
    result = super.do_compare(rhs, comparer);
    result &= comparer.compare_field("cmd", cmd,         rhs_.cmd,     $bits(cmd));
    if (cmd == UVM_WRITE) begin
        result &= comparer.compare_field("awid", awid,       rhs_.awid,    $bits(awid));
        result &= comparer.compare_field("bid", bid,         rhs_.bid,     $bits(bid));
    end
    if (cmd == UVM_READ) begin
        result &= comparer.compare_field("arid", arid,       rhs_.arid,    $bits(arid));
        result &= comparer.compare_field("rid", rid,         rhs_.rid,     $bits(rid));
    end
    result &= comparer.compare_field("prot", prot,       rhs_.prot,    $bits(prot));
    result &= comparer.compare_field("data", data,       rhs_.data,    $bits(data));
    result &= comparer.compare_field("strb", strb,       rhs_.strb,    $bits(strb));
    result &= comparer.compare_field("resp", resp,       rhs_.resp,    $bits(resp));
    return result;
endfunction

// unchanged easierUVM generated
function void axi_lite_seq_item::do_copy(uvm_object rhs);
  axi_lite_seq_item rhs_;
  if (!$cast(rhs_, rhs))
    `uvm_fatal(get_type_name(), "Cast of rhs object failed")
  super.do_copy(rhs);
  cmd     = rhs_.cmd;    
  awdelay = rhs_.awdelay;
  wdelay  = rhs_.wdelay; 
  bdelay  = rhs_.bdelay; 
  ardelay = rhs_.ardelay;
  rdelay  = rhs_.rdelay; 
  awid    = rhs_.awid;   
  bid     = rhs_.bid;    
  arid    = rhs_.arid;   
  rid     = rhs_.rid;    
  addr    = rhs_.addr;   
  prot    = rhs_.prot;   
  data    = rhs_.data;   
  strb    = rhs_.strb;   
  resp    = rhs_.resp;   
endfunction : do_copy

function void axi_lite_seq_item::do_print(uvm_printer printer);
  if (printer.knobs.sprint == 0)
    `uvm_info(get_type_name(), convert2string(), UVM_MEDIUM)
  else
    printer.m_string = convert2string();
endfunction : do_print


function void axi_lite_seq_item::do_record(uvm_recorder recorder);
  super.do_record(recorder);
  // Use the record macros to record the item fields:
  `uvm_record_field("cmd",     cmd)    
  `uvm_record_field("awdelay", awdelay)
  `uvm_record_field("wdelay",  wdelay) 
  `uvm_record_field("bdelay",  bdelay) 
  `uvm_record_field("ardelay", ardelay)
  `uvm_record_field("rdelay",  rdelay) 
  `uvm_record_field("awid",    awid)   
  `uvm_record_field("bid",     bid)    
  `uvm_record_field("arid",    arid)   
  `uvm_record_field("rid",     rid)    
  `uvm_record_field("addr",    addr)   
  `uvm_record_field("prot",    prot)   
  `uvm_record_field("data",    data)   
  `uvm_record_field("strb",    strb)   
  `uvm_record_field("resp",    resp)   
endfunction : do_record


function void axi_lite_seq_item::do_pack(uvm_packer packer);
  super.do_pack(packer);
//   `uvm_pack_int(cmd)     
//   `uvm_pack_int(awdelay) 
//   `uvm_pack_int(wdelay)  
//   `uvm_pack_int(bdelay)  
//   `uvm_pack_int(ardelay) 
//   `uvm_pack_int(rdelay)  
//   `uvm_pack_int(awid)    
//   `uvm_pack_int(bid)     
//   `uvm_pack_int(arid)    
//   `uvm_pack_int(rid)     
//   `uvm_pack_int(addr)    
//   `uvm_pack_int(prot)    
//   `uvm_pack_int(data)    
//   `uvm_pack_int(strb)    
//   `uvm_pack_int(resp)    
endfunction : do_pack


function void axi_lite_seq_item::do_unpack(uvm_packer packer);
  super.do_unpack(packer);
//   `uvm_unpack_int(cmd)     
//   `uvm_unpack_int(awdelay) 
//   `uvm_unpack_int(wdelay)  
//   `uvm_unpack_int(bdelay)  
//   `uvm_unpack_int(ardelay) 
//   `uvm_unpack_int(rdelay)  
//   `uvm_unpack_int(awid)    
//   `uvm_unpack_int(bid)     
//   `uvm_unpack_int(arid)    
//   `uvm_unpack_int(rid)     
//   `uvm_unpack_int(addr)    
//   `uvm_unpack_int(prot)    
//   `uvm_unpack_int(data)    
//   `uvm_unpack_int(strb)    
//   `uvm_unpack_int(resp)    
endfunction : do_unpack


function string axi_lite_seq_item::convert2string();
  string s;
  $sformat(s, "%s\n", super.convert2string());
  $sformat(s, {"%s\n",
    "cmd     = 'h%0h  'd%0d\n", 
    "awdelay = 'h%0h  'd%0d\n", 
    "wdelay  = 'h%0h  'd%0d\n", 
    "bdelay  = 'h%0h  'd%0d\n", 
    "ardelay = 'h%0h  'd%0d\n", 
    "rdelay  = 'h%0h  'd%0d\n", 
    "awid    = 'h%0h  'd%0d\n", 
    "bid     = 'h%0h  'd%0d\n", 
    "arid    = 'h%0h  'd%0d\n", 
    "rid     = 'h%0h  'd%0d\n", 
    "addr    = 'h%0h  'd%0d\n", 
    "prot    = 'h%0h  'd%0d\n", 
    "data    = 'h%0h  'd%0d\n", 
    "strb    = 'h%0h  'd%0d\n", 
    "resp    = 'h%0h  'd%0d\n"},
    get_full_name(), cmd, cmd, awdelay, awdelay, wdelay, wdelay, bdelay, bdelay, ardelay, ardelay, rdelay, rdelay, awid, awid, bid, bid, arid, arid, rid, rid, addr, addr, prot, prot, data, data, strb, strb, resp, resp);
  return s;
endfunction : convert2string

