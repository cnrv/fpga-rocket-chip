`timescale 1ns / 1ps

module DTModule ( // @[Peripheryscala 157:23:freechipsrocketchipsystemDefaultFPGAConfigfir@1947114]
    input reset,    //(SimDTM_reset),
    input clk,    //(SimDTM_clk)

    output [31:0] exit,    //(SimDTM_exit),

    input debug_req_ready,    //(SimDTM_debug_req_ready),
    output debug_req_valid,    //(SimDTM_debug_req_valid),
    output [6:0] debug_req_addr,    //(SimDTM_debug_req_addr),
    output [31:0] debug_req_data,    //(SimDTM_debug_req_data),
    output [1:0] debug_req_op,    //(SimDTM_debug_req_op),

    output debug_resp_ready,    //(SimDTM_debug_resp_ready),
    input debug_resp_valid,    //(SimDTM_debug_resp_valid),
    input [31:0] debug_resp_data,    //(SimDTM_debug_resp_data),
    input [1:0] debug_resp_resp    //(SimDTM_debug_resp_resp),
  );
  
  assign exit                   =   0;
  
  assign debug_req_valid        =   0;
  assign debug_req_addr    =   0;
  assign debug_req_data    =   0;
  assign debug_req_op      =   0;

  assign debug_resp_ready       =   0;
  
endmodule