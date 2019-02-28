`timescale 1ns / 1ps
`define DDR_MASK 32'h07ffffff

module AXIMem (
      input clock,		
      input clock200, // 200m Hz to drive DDR ctrl
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
      output        io_axi4_0_r_last,
      
      //----DDR pins
      inout  [15:0] ddr_dq,
      inout   [1:0] ddr_dqs_n,
      inout   [1:0] ddr_dqs_p,
      output [12:0] ddr_addr,
      output  [2:0] ddr_ba,
      output        ddr_ras_n,
      output        ddr_cas_n,
      output        ddr_we_n,
      output        ddr_ck_n,
      output        ddr_ck_p,
      output        ddr_cke,
      output        ddr_cs_n,
      output  [1:0] ddr_dm,
      output        ddr_odt
  );

      wire resetn; 
      assign resetn = ! reset;
      wire mig_ui_clk;
      wire mig_ui_rst;
      wire mig_ui_rstn;
      assign mig_ui_rstn = ! mig_ui_rst;

      wire [3:0]    mig_axi4_aw_id;
      wire [31:0]   mig_axi4_aw_addr;
      wire [7:0]    mig_axi4_aw_len;
      wire [2:0]    mig_axi4_aw_size;
      wire [1:0]    mig_axi4_aw_burst;
      // wire [0:0]    mig_axi4_aw_lock;
      // wire [3:0]    mig_axi4_aw_cache;
      // wire [2:0]    mig_axi4_aw_prot;
      // wire [3:0]    mig_axi4_aw_qos;
      wire          mig_axi4_aw_valid;
      wire          mig_axi4_aw_ready;
      wire [63:0]   mig_axi4_w_data;
      wire [7:0]    mig_axi4_w_strb;
      wire          mig_axi4_w_last;
      wire          mig_axi4_w_valid;
      wire          mig_axi4_w_ready;
      wire          mig_axi4_b_ready;
      wire [3:0]    mig_axi4_b_id;
      wire [1:0]    mig_axi4_b_resp;
      wire          mig_axi4_b_valid;
      wire [3:0]    mig_axi4_ar_id;
      wire [31:0]   mig_axi4_ar_addr;
      wire [7:0]    mig_axi4_ar_len;
      wire [2:0]    mig_axi4_ar_size;
      wire [1:0]    mig_axi4_ar_burst;
      // wire [0:0]    mig_axi4_ar_lock;
      // wire [3:0]    mig_axi4_ar_cache;
      // wire [2:0]    mig_axi4_ar_prot;
      // wire [3:0]    mig_axi4_ar_qos;
      wire          mig_axi4_ar_valid;
      wire          mig_axi4_ar_ready;
      wire          mig_axi4_r_ready;
      wire [3:0]    mig_axi4_r_id;
      wire [63:0]   mig_axi4_r_data;
      wire [1:0]    mig_axi4_r_resp;
      wire          mig_axi4_r_last;
      wire          mig_axi4_r_valid;

      wire [31:0]   io_axi4_0_aw_addr_shrink;
      wire [31:0]   io_axi4_0_ar_addr_shrink;
      assign io_axi4_0_aw_addr_shrink = io_axi4_0_aw_addr & `DDR_MASK;
      assign io_axi4_0_aw_addr_shrink = io_axi4_0_aw_addr & `DDR_MASK;

    axi_clock_converter_0 clk_conv(

      .s_axi_aclk     ( clock                 ), // rocket ->  Freq converter -> DDR
      .s_axi_aresetn  ( resetn                ), 

      .m_axi_aclk     ( mig_ui_clk            ), // the reference freq from DDR controller
      .m_axi_aresetn  ( mig_ui_rstn           ),

      .s_axi_awid     ( io_axi4_0_aw_id       ),
      .s_axi_awaddr   ( io_axi4_0_aw_addr_shrink ),
      .s_axi_awlen    ( io_axi4_0_aw_len      ),
      .s_axi_awsize   ( io_axi4_0_aw_size     ),
      .s_axi_awburst  ( io_axi4_0_aw_burst    ),
      // .s_axi_awlock   ( io_axi4_0_aw_lock     ),
      // .s_axi_awcache  ( io_axi4_0_aw_cache    ),
      // .s_axi_awprot   ( io_axi4_0_aw_prot     ),
      // .s_axi_awqos    ( io_axi4_0_aw_qos      ),
      // .s_axi_awregion ( io_axi4_0_aw_region   ),
      .s_axi_awvalid  ( io_axi4_0_aw_valid    ),
      .s_axi_awready  ( io_axi4_0_aw_ready    ),
      .s_axi_wdata    ( io_axi4_0_w_data      ),
      .s_axi_wstrb    ( io_axi4_0_w_strb      ),
      .s_axi_wlast    ( io_axi4_0_w_last      ),
      .s_axi_wvalid   ( io_axi4_0_w_valid     ),
      .s_axi_wready   ( io_axi4_0_w_ready     ),
      .s_axi_bid      ( io_axi4_0_b_id        ),
      .s_axi_bresp    ( io_axi4_0_b_resp      ),
      .s_axi_bvalid   ( io_axi4_0_b_valid     ),
      .s_axi_bready   ( io_axi4_0_b_ready     ),
      .s_axi_arid     ( io_axi4_0_ar_id       ),
      .s_axi_araddr   ( io_axi4_0_ar_addr_shrink     ),
      .s_axi_arlen    ( io_axi4_0_ar_len      ),
      .s_axi_arsize   ( io_axi4_0_ar_size     ),
      .s_axi_arburst  ( io_axi4_0_ar_burst    ),
      // .s_axi_arlock   ( io_axi4_0_ar_lock     ),
      // .s_axi_arcache  ( io_axi4_0_ar_cache    ),
      // .s_axi_arprot   ( io_axi4_0_ar_prot     ),
      // .s_axi_arqos    ( io_axi4_0_ar_qos      ),
      // .s_axi_arregion ( io_axi4_0_ar_region   ),
      .s_axi_arvalid  ( io_axi4_0_ar_valid    ),
      .s_axi_arready  ( io_axi4_0_ar_ready    ),
      .s_axi_rid      ( io_axi4_0_r_id        ),
      .s_axi_rdata    ( io_axi4_0_r_data      ),
      .s_axi_rresp    ( io_axi4_0_r_resp      ),
      .s_axi_rlast    ( io_axi4_0_r_last      ),
      .s_axi_rvalid   ( io_axi4_0_r_valid     ),
      .s_axi_rready   ( io_axi4_0_r_ready     ),

      .m_axi_awid     ( mig_axi4_aw_id      ),
      .m_axi_awaddr   ( mig_axi4_aw_addr    ),
      .m_axi_awlen    ( mig_axi4_aw_len     ),
      .m_axi_awsize   ( mig_axi4_aw_size    ),
      .m_axi_awburst  ( mig_axi4_aw_burst   ),
      // .m_axi_awlock   ( mig_axi4_aw_lock    ),
      // .m_axi_awcache  ( mig_axi4_aw_cache   ),
      // .m_axi_awprot   ( mig_axi4_aw_prot    ),
      // .m_axi_awqos    ( mig_axi4_aw_qos     ),
      // .m_axi_awregion ( mig_axi4_aw_region  ),
      .m_axi_awvalid  ( mig_axi4_aw_valid   ),
      .m_axi_awready  ( mig_axi4_aw_ready   ),
      .m_axi_wdata    ( mig_axi4_w_data     ),
      .m_axi_wstrb    ( mig_axi4_w_strb     ),
      .m_axi_wlast    ( mig_axi4_w_last     ),
      .m_axi_wvalid   ( mig_axi4_w_valid    ),
      .m_axi_wready   ( mig_axi4_w_ready    ),
      .m_axi_bid      ( mig_axi4_b_id       ),
      .m_axi_bresp    ( mig_axi4_b_resp     ),
      .m_axi_bvalid   ( mig_axi4_b_valid    ),
      .m_axi_bready   ( mig_axi4_b_ready    ),
      .m_axi_arid     ( mig_axi4_ar_id      ),
      .m_axi_araddr   ( mig_axi4_ar_addr    ),
      .m_axi_arlen    ( mig_axi4_ar_len     ),
      .m_axi_arsize   ( mig_axi4_ar_size    ),
      .m_axi_arburst  ( mig_axi4_ar_burst   ),
      // .m_axi_arlock   ( mig_axi4_ar_lock    ),
      // .m_axi_arcache  ( mig_axi4_ar_cache   ),
      // .m_axi_arprot   ( mig_axi4_ar_prot    ),
      // .m_axi_arqos    ( mig_axi4_ar_qos     ),
      // .m_axi_arregion ( mig_axi4_ar_region  ),
      .m_axi_arvalid  ( mig_axi4_ar_valid   ),
      .m_axi_arready  ( mig_axi4_ar_ready   ),
      .m_axi_rid      ( mig_axi4_r_id       ),
      .m_axi_rdata    ( mig_axi4_r_data     ),
      .m_axi_rresp    ( mig_axi4_r_resp     ),
      .m_axi_rlast    ( mig_axi4_r_last     ),
      .m_axi_rvalid   ( mig_axi4_r_valid    ),
      .m_axi_rready   ( mig_axi4_r_ready    )
      );

    // DDR controller
    mig_7series_0 DDR_ctrl(
      
      // device pins
      .ddr2_dq        ( ddr_dq      ),
      .ddr2_dqs_n     ( ddr_dqs_n   ),
      .ddr2_dqs_p     ( ddr_dqs_p   ),
      .ddr2_addr      ( ddr_addr    ),
      .ddr2_ba        ( ddr_ba      ),
      .ddr2_ras_n     ( ddr_ras_n   ),
      .ddr2_cas_n     ( ddr_cas_n   ),
      .ddr2_we_n      ( ddr_we_n    ),
      .ddr2_ck_p      ( ddr_ck_p    ),
      .ddr2_ck_n      ( ddr_ck_n    ),
      .ddr2_cke       ( ddr_cke     ),
      .ddr2_cs_n      ( ddr_cs_n    ),
      .ddr2_dm        ( ddr_dm      ),
      .ddr2_odt       ( ddr_odt     ),

      .sys_clk_i      ( clock200	),
      .sys_rst        ( reset       ),

      .device_temp_i  ( 0           ),  // we do not need XADC just ground it       
      .app_sr_req     ( 1'b0        ),  // ddr control bits, all should be zero
      .app_ref_req    ( 1'b0        ), // 
      .app_zq_req     ( 1'b0        ),

      .ui_clk         ( mig_ui_clk  ),  // output  clk - for clk converter  
      .ui_clk_sync_rst( mig_ui_rst  ),  // output  reset
      // .mmcm_locked    ( resetn      ), // there is an inplaced MMCM inside but we do not use it

      // axi interface with much higher freq
      .aresetn        ( resetn	          ), // AXI reset send from top                                                     
      .s_axi_awid     ( mig_axi4_aw_id    ),
      .s_axi_awaddr   ( mig_axi4_aw_addr  ),
      .s_axi_awlen    ( mig_axi4_aw_len   ),
      .s_axi_awsize   ( mig_axi4_aw_size  ),
      .s_axi_awburst  ( mig_axi4_aw_burst ),
      // .s_axi_awlock   ( mig_axi4_aw_lock  ),//should be grounded
      // .s_axi_awcache  ( mig_axi4_aw_cache ),
      // .s_axi_awprot   ( mig_axi4_aw_prot  ),
      // .s_axi_awqos    ( mig_axi4_aw_qos   ),
      .s_axi_awvalid  ( mig_axi4_aw_valid ),
      .s_axi_awready  ( mig_axi4_aw_ready ),
      .s_axi_wdata    ( mig_axi4_w_data   ),
      .s_axi_wstrb    ( mig_axi4_w_strb   ),
      .s_axi_wlast    ( mig_axi4_w_last   ),
      .s_axi_wvalid   ( mig_axi4_w_valid  ),
      .s_axi_wready   ( mig_axi4_w_ready  ),
      .s_axi_bid      ( mig_axi4_b_id     ),
      .s_axi_bresp    ( mig_axi4_b_resp   ),
      .s_axi_bvalid   ( mig_axi4_b_valid  ),
      .s_axi_bready   ( mig_axi4_b_ready  ),
      .s_axi_arid     ( mig_axi4_ar_id    ),
      .s_axi_araddr   ( mig_axi4_ar_addr  ),
      .s_axi_arlen    ( mig_axi4_ar_len   ),
      .s_axi_arsize   ( mig_axi4_ar_size  ),
      .s_axi_arburst  ( mig_axi4_ar_burst ),
      // .s_axi_arlock   ( mig_axi4_ar_lock  ),//should be grounded
      // .s_axi_arcache  ( mig_axi4_ar_cache ),
      // .s_axi_arprot   ( mig_axi4_ar_prot  ),
      // .s_axi_arqos    ( mig_axi4_ar_qos   ),
      .s_axi_arvalid  ( mig_axi4_ar_valid ),
      .s_axi_arready  ( mig_axi4_ar_ready ),
      .s_axi_rid      ( mig_axi4_r_id     ),
      .s_axi_rdata    ( mig_axi4_r_data   ),
      .s_axi_rresp    ( mig_axi4_r_resp   ),
      .s_axi_rlast    ( mig_axi4_r_last   ),
      .s_axi_rvalid   ( mig_axi4_r_valid  ),
      .s_axi_rready   ( mig_axi4_r_ready  )
              
    );
      
endmodule