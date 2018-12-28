module DTModule ( // @[Peripheryscala 157:23:freechipsrocketchipsystemDefaultFPGAConfigfir@1947114]
    input reset,    //(SimDTM_reset),
    input clk,    //(SimDTM_clk)
    output [31:0] exit,    //(SimDTM_exit),
    input debug_req_ready,    //(SimDTM_debug_req_ready),
    output debug_req_valid,    //(SimDTM_debug_req_valid),
    output [6:0] debug_req_bits_addr,    //(SimDTM_debug_req_bits_addr),
    output [31:0] debug_req_bits_data,    //(SimDTM_debug_req_bits_data),
    output [1:0] debug_req_bits_op,    //(SimDTM_debug_req_bits_op),
    output debug_resp_ready,    //(SimDTM_debug_resp_ready),
    input debug_resp_valid,    //(SimDTM_debug_resp_valid),
    input [31:0] debug_resp_bits_data,    //(SimDTM_debug_resp_bits_data),
    input [1:0] debug_resp_bits_resp    //(SimDTM_debug_resp_bits_resp),
  );
  
  assign exit                   =   0;
  assign debug_req_valid        =   0;
  assign debug_req_bits_addr    =   0;
  assign debug_req_bits_data    =   0;
  assign debug_req_bits_op      =   0;
  assign debug_resp_ready       =   0;
  
endmodule