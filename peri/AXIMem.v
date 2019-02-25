`timescale 1ns / 1ps

module AXIMem (
    input clock,    
    input reset,    
    
      output        io_axi4_0_aw_ready, 
      input         io_axi4_0_aw_valid, 
      input  [3:0]  io_axi4_0_aw_id, 
      input  [31:0] io_axi4_0_aw_addr, 
      input  [7:0]  io_axi4_0_aw_len, 
      input  [2:0]  io_axi4_0_aw_size, 
      input  [1:0]  io_axi4_0_aw_burst, 

      output        io_axi4_0_w_ready, 
      input         io_axi4_0_w_valid, 
      input  [63:0] io_axi4_0_w_data, 
      input  [7:0]  io_axi4_0_w_strb, 
      input         io_axi4_0_w_last, 

      input         io_axi4_0_b_ready, 
      output        io_axi4_0_b_valid, 
      output [3:0]  io_axi4_0_b_id, 
      output [1:0]  io_axi4_0_b_resp, 

      output        io_axi4_0_ar_ready, 
      input         io_axi4_0_ar_valid, 
      input  [3:0]  io_axi4_0_ar_id, 
      input  [31:0] io_axi4_0_ar_addr, 
      input  [7:0]  io_axi4_0_ar_len, 
      input  [2:0]  io_axi4_0_ar_size, 
      input  [1:0]  io_axi4_0_ar_burst, 

      input         io_axi4_0_r_ready, 
      output        io_axi4_0_r_valid, 
      output [3:0]  io_axi4_0_r_id, 
      output [63:0] io_axi4_0_r_data, 
      output [1:0]  io_axi4_0_r_resp, 
      output        io_axi4_0_r_last 
  );
      assign io_axi4_0_aw_ready     =     0     ;

      assign io_axi4_0_w_ready      =     0     ;

      assign io_axi4_0_b_valid      =     0     ;
      assign io_axi4_0_b_id         =     0     ;
      assign io_axi4_0_b_resp       =     0     ;

      assign io_axi4_0_ar_ready     =     0     ;

      assign io_axi4_0_r_valid      =     0     ;
      assign io_axi4_0_r_id         =     0     ;
      assign io_axi4_0_r_data       =     0     ;
      assign io_axi4_0_r_resp       =     0     ;
      assign io_axi4_0_r_last       =     0     ;
      
endmodule