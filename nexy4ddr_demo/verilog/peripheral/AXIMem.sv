module AXIMem ( // @[Portsscala 76:15:freechipsrocketchipsystemDefaultFPGAConfigfir@1946804]
    input clock,    //(mem_clock),
    input reset,    //(mem_reset),
    
      output        io_axi4_0_aw_ready, // @[:freechips.rocketchip.system.DefaultFPGAConfig.fir@193230.4]
      input         io_axi4_0_aw_valid, // @[:freechips.rocketchip.system.DefaultFPGAConfig.fir@193230.4]
      input  [3:0]  io_axi4_0_aw_bits_id, // @[:freechips.rocketchip.system.DefaultFPGAConfig.fir@193230.4]
      input  [27:0] io_axi4_0_aw_bits_addr, // @[:freechips.rocketchip.system.DefaultFPGAConfig.fir@193230.4]
      input  [7:0]  io_axi4_0_aw_bits_len, // @[:freechips.rocketchip.system.DefaultFPGAConfig.fir@193230.4]
      input  [2:0]  io_axi4_0_aw_bits_size, // @[:freechips.rocketchip.system.DefaultFPGAConfig.fir@193230.4]
      input  [1:0]  io_axi4_0_aw_bits_burst, // @[:freechips.rocketchip.system.DefaultFPGAConfig.fir@193230.4]
      output        io_axi4_0_w_ready, // @[:freechips.rocketchip.system.DefaultFPGAConfig.fir@193230.4]
      input         io_axi4_0_w_valid, // @[:freechips.rocketchip.system.DefaultFPGAConfig.fir@193230.4]
      input  [63:0] io_axi4_0_w_bits_data, // @[:freechips.rocketchip.system.DefaultFPGAConfig.fir@193230.4]
      input  [7:0]  io_axi4_0_w_bits_strb, // @[:freechips.rocketchip.system.DefaultFPGAConfig.fir@193230.4]
      input         io_axi4_0_w_bits_last, // @[:freechips.rocketchip.system.DefaultFPGAConfig.fir@193230.4]
      input         io_axi4_0_b_ready, // @[:freechips.rocketchip.system.DefaultFPGAConfig.fir@193230.4]
      output        io_axi4_0_b_valid, // @[:freechips.rocketchip.system.DefaultFPGAConfig.fir@193230.4]
      output [3:0]  io_axi4_0_b_bits_id, // @[:freechips.rocketchip.system.DefaultFPGAConfig.fir@193230.4]
      output [1:0]  io_axi4_0_b_bits_resp, // @[:freechips.rocketchip.system.DefaultFPGAConfig.fir@193230.4]
      output        io_axi4_0_ar_ready, // @[:freechips.rocketchip.system.DefaultFPGAConfig.fir@193230.4]
      input         io_axi4_0_ar_valid, // @[:freechips.rocketchip.system.DefaultFPGAConfig.fir@193230.4]
      input  [3:0]  io_axi4_0_ar_bits_id, // @[:freechips.rocketchip.system.DefaultFPGAConfig.fir@193230.4]
      input  [27:0] io_axi4_0_ar_bits_addr, // @[:freechips.rocketchip.system.DefaultFPGAConfig.fir@193230.4]
      input  [7:0]  io_axi4_0_ar_bits_len, // @[:freechips.rocketchip.system.DefaultFPGAConfig.fir@193230.4]
      input  [2:0]  io_axi4_0_ar_bits_size, // @[:freechips.rocketchip.system.DefaultFPGAConfig.fir@193230.4]
      input  [1:0]  io_axi4_0_ar_bits_burst, // @[:freechips.rocketchip.system.DefaultFPGAConfig.fir@193230.4]
      input         io_axi4_0_r_ready, // @[:freechips.rocketchip.system.DefaultFPGAConfig.fir@193230.4]
      output        io_axi4_0_r_valid, // @[:freechips.rocketchip.system.DefaultFPGAConfig.fir@193230.4]
      output [3:0]  io_axi4_0_r_bits_id, // @[:freechips.rocketchip.system.DefaultFPGAConfig.fir@193230.4]
      output [63:0] io_axi4_0_r_bits_data, // @[:freechips.rocketchip.system.DefaultFPGAConfig.fir@193230.4]
      output [1:0]  io_axi4_0_r_bits_resp, // @[:freechips.rocketchip.system.DefaultFPGAConfig.fir@193230.4]
      output        io_axi4_0_r_bits_last 
  );
      assign io_axi4_0_aw_ready     =     0     ;
      assign io_axi4_0_w_ready      =     0     ;
      assign io_axi4_0_b_valid      =     0     ;
      assign io_axi4_0_b_bits_id    =     0     ;
      assign io_axi4_0_b_bits_resp  =     0     ;
      assign io_axi4_0_ar_ready     =     0     ;
      assign io_axi4_0_r_valid      =     0     ;
      assign io_axi4_0_r_bits_id    =     0     ;
      assign io_axi4_0_r_bits_data  =     0     ;
      assign io_axi4_0_r_bits_resp  =     0     ;
      assign io_axi4_0_r_bits_last  =     0     ;
      
endmodule