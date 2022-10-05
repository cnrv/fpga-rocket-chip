`timescale 1ns/1ps
`define SIM_ENABLE_DDR
// Define JTAG_BSCAN by default, otherwise JTAG works through PMOD.
`define JTAG_BSCAN
module chip_top 
( 
  input         clock100, 
  input         buttonresetn,
  
  output [7:0]  LED,
  
  //----UART
  output        uart_TX,
  input         uart_RX,
  
  //----DDR
  inout [15:0]  ddr_dq,
  inout [1:0]   ddr_dqs_n,
  inout [1:0]   ddr_dqs_p,
`ifdef BOARD_NEXYS_VIDEO
  output [14:0] ddr_addr, // nexys-video 15-bit, nexys4-ddr 13-bit
`else
  output [12:0] ddr_addr, // nexys-video 15-bit, nexys4-ddr 13-bit
`endif
  output [2:0]  ddr_ba,
  output        ddr_ras_n,
  output        ddr_cas_n,
  output        ddr_we_n,
`ifdef BOARD_NEXYS_VIDEO
      output        ddr_reset_n, // nexys-video
`else
      output        ddr_cs_n, // nexys4-ddr
`endif
  output        ddr_ck_n,
  output        ddr_ck_p,
  output        ddr_cke,
  output [1:0]  ddr_dm,
  output        ddr_odt,

`ifndef JTAG_BSCAN
  // pmod JTAG interface
  input         jtag_pmod_tck,
  input         jtag_pmod_tms,
  input         jtag_pmod_tdi,
  output        jtag_pmod_tdo,
`endif

  //----SD on spi
  inout         spi_cs,
  inout         spi_sclock,
  inout         spi_mosi,
  inout         spi_miso,
  output        sd_poweroff

  // position for peris ... TBA
);

  wire  clock50; //50m
  wire  clock200;
  
  //dut wires
  wire  dut_clock; 
  wire  dut_reset; 
  wire [1:0] dut_interrupts; 

  wire  dut_debug_ndreset; 
  wire  dut_debug_dmactive; 
  //mem
  wire  dut_mem_axi4_0_aw_ready; 
  wire  dut_mem_axi4_0_aw_valid; 
  wire [3:0] dut_mem_axi4_0_aw_id; 
  wire [31:0] dut_mem_axi4_0_aw_addr; 
  wire [7:0] dut_mem_axi4_0_aw_len; 
  wire [2:0] dut_mem_axi4_0_aw_size; 
  wire [1:0] dut_mem_axi4_0_aw_burst; 
  wire  dut_mem_axi4_0_aw_lock; 
  wire [3:0] dut_mem_axi4_0_aw_cache; 
  wire [2:0] dut_mem_axi4_0_aw_prot; 
  wire [3:0] dut_mem_axi4_0_aw_qos; 
  wire  dut_mem_axi4_0_w_ready; 
  wire  dut_mem_axi4_0_w_valid; 
  wire [63:0] dut_mem_axi4_0_w_data; 
  wire [7:0] dut_mem_axi4_0_w_strb; 
  wire  dut_mem_axi4_0_w_last; 
  wire  dut_mem_axi4_0_b_ready; 
  wire  dut_mem_axi4_0_b_valid; 
  wire [3:0] dut_mem_axi4_0_b_id; 
  wire [1:0] dut_mem_axi4_0_b_resp; 
  wire  dut_mem_axi4_0_ar_ready; 
  wire  dut_mem_axi4_0_ar_valid; 
  wire [3:0] dut_mem_axi4_0_ar_id; 
  wire [31:0] dut_mem_axi4_0_ar_addr; 
  wire [7:0] dut_mem_axi4_0_ar_len; 
  wire [2:0] dut_mem_axi4_0_ar_size; 
  wire [1:0] dut_mem_axi4_0_ar_burst; 
  wire  dut_mem_axi4_0_ar_lock; 
  wire [3:0] dut_mem_axi4_0_ar_cache; 
  wire [2:0] dut_mem_axi4_0_ar_prot; 
  wire [3:0] dut_mem_axi4_0_ar_qos; 
  wire  dut_mem_axi4_0_r_ready; 
  wire  dut_mem_axi4_0_r_valid; 
  wire [3:0] dut_mem_axi4_0_r_id; 
  wire [63:0] dut_mem_axi4_0_r_data; 
  wire [1:0] dut_mem_axi4_0_r_resp; 
  wire  dut_mem_axi4_0_r_last; 
  //mmio
  wire  dut_mmio_axi4_0_aw_ready; 
  wire  dut_mmio_axi4_0_aw_valid; 
  wire [3:0] dut_mmio_axi4_0_aw_id; 
  wire [30:0] dut_mmio_axi4_0_aw_addr; 
  wire [7:0] dut_mmio_axi4_0_aw_len; 
  wire [2:0] dut_mmio_axi4_0_aw_size; 
  wire [1:0] dut_mmio_axi4_0_aw_burst; 
  wire  dut_mmio_axi4_0_aw_lock; 
  wire [3:0] dut_mmio_axi4_0_aw_cache; 
  wire [2:0] dut_mmio_axi4_0_aw_prot; 
  wire [3:0] dut_mmio_axi4_0_aw_qos; 
  wire  dut_mmio_axi4_0_w_ready; 
  wire  dut_mmio_axi4_0_w_valid; 
  wire [63:0] dut_mmio_axi4_0_w_data; 
  wire [7:0] dut_mmio_axi4_0_w_strb; 
  wire  dut_mmio_axi4_0_w_last; 
  wire  dut_mmio_axi4_0_b_ready; 
  wire  dut_mmio_axi4_0_b_valid; 
  wire [3:0] dut_mmio_axi4_0_b_id; 
  wire [1:0] dut_mmio_axi4_0_b_resp; 
  wire  dut_mmio_axi4_0_ar_ready; 
  wire  dut_mmio_axi4_0_ar_valid; 
  wire [3:0] dut_mmio_axi4_0_ar_id; 
  wire [30:0] dut_mmio_axi4_0_ar_addr; 
  wire [7:0] dut_mmio_axi4_0_ar_len; 
  wire [2:0] dut_mmio_axi4_0_ar_size; 
  wire [1:0] dut_mmio_axi4_0_ar_burst; 
  wire  dut_mmio_axi4_0_ar_lock; 
  wire [3:0] dut_mmio_axi4_0_ar_cache; 
  wire [2:0] dut_mmio_axi4_0_ar_prot; 
  wire [3:0] dut_mmio_axi4_0_ar_qos; 
  wire  dut_mmio_axi4_0_r_ready; 
  wire  dut_mmio_axi4_0_r_valid; 
  wire [3:0] dut_mmio_axi4_0_r_id; 
  wire [63:0] dut_mmio_axi4_0_r_data; 
  wire [1:0] dut_mmio_axi4_0_r_resp; 
  wire  dut_mmio_axi4_0_r_last; 
  //l2
  wire  dut_l2_frontend_bus_axi4_0_aw_ready; 
  wire  dut_l2_frontend_bus_axi4_0_aw_valid; 
  wire [7:0] dut_l2_frontend_bus_axi4_0_aw_id; 
  wire [31:0] dut_l2_frontend_bus_axi4_0_aw_addr; 
  wire [7:0] dut_l2_frontend_bus_axi4_0_aw_len; 
  wire [2:0] dut_l2_frontend_bus_axi4_0_aw_size; 
  wire [1:0] dut_l2_frontend_bus_axi4_0_aw_burst; 
  wire  dut_l2_frontend_bus_axi4_0_aw_lock; 
  wire [3:0] dut_l2_frontend_bus_axi4_0_aw_cache; 
  wire [2:0] dut_l2_frontend_bus_axi4_0_aw_prot; 
  wire [3:0] dut_l2_frontend_bus_axi4_0_aw_qos; 
  wire  dut_l2_frontend_bus_axi4_0_w_ready; 
  wire  dut_l2_frontend_bus_axi4_0_w_valid; 
  wire [63:0] dut_l2_frontend_bus_axi4_0_w_data; 
  wire [7:0] dut_l2_frontend_bus_axi4_0_w_strb; 
  wire  dut_l2_frontend_bus_axi4_0_w_last; 
  wire  dut_l2_frontend_bus_axi4_0_b_ready; 
  wire  dut_l2_frontend_bus_axi4_0_b_valid; 
  wire [7:0] dut_l2_frontend_bus_axi4_0_b_id; 
  wire [1:0] dut_l2_frontend_bus_axi4_0_b_resp; 
  wire  dut_l2_frontend_bus_axi4_0_ar_ready; 
  wire  dut_l2_frontend_bus_axi4_0_ar_valid; 
  wire [7:0] dut_l2_frontend_bus_axi4_0_ar_id; 
  wire [31:0] dut_l2_frontend_bus_axi4_0_ar_addr; 
  wire [7:0] dut_l2_frontend_bus_axi4_0_ar_len; 
  wire [2:0] dut_l2_frontend_bus_axi4_0_ar_size; 
  wire [1:0] dut_l2_frontend_bus_axi4_0_ar_burst; 
  wire  dut_l2_frontend_bus_axi4_0_ar_lock; 
  wire [3:0] dut_l2_frontend_bus_axi4_0_ar_cache; 
  wire [2:0] dut_l2_frontend_bus_axi4_0_ar_prot; 
  wire [3:0] dut_l2_frontend_bus_axi4_0_ar_qos; 
  wire  dut_l2_frontend_bus_axi4_0_r_ready; 
  wire  dut_l2_frontend_bus_axi4_0_r_valid; 
  wire [7:0] dut_l2_frontend_bus_axi4_0_r_id; 
  wire [63:0] dut_l2_frontend_bus_axi4_0_r_data; 
  wire [1:0] dut_l2_frontend_bus_axi4_0_r_resp; 
  wire  dut_l2_frontend_bus_axi4_0_r_last; 
  // above: those wires connected to the dut module

  // below: wires connected to the respective peripheral
  // mem
  wire  mem_clock; 
  wire  mem_reset; 
  wire  mem_io_axi4_0_aw_ready; 
  wire  mem_io_axi4_0_aw_valid; 
  wire [3:0] mem_io_axi4_0_aw_id; 
  wire [31:0] mem_io_axi4_0_aw_addr; 
  wire [7:0] mem_io_axi4_0_aw_len; 
  wire [2:0] mem_io_axi4_0_aw_size; 
  wire [1:0] mem_io_axi4_0_aw_burst; 
  // add 4 signal
  wire  mem_io_axi4_0_aw_lock; 
  wire [3:0] mem_io_axi4_0_aw_cache; 
  wire [2:0] mem_io_axi4_0_aw_prot; 
  wire [3:0] mem_io_axi4_0_aw_qos; 
  //
  wire  mem_io_axi4_0_w_ready; 
  wire  mem_io_axi4_0_w_valid; 
  wire [63:0] mem_io_axi4_0_w_data; 
  wire [7:0] mem_io_axi4_0_w_strb; 
  wire  mem_io_axi4_0_w_last; 
  wire  mem_io_axi4_0_b_ready; 
  wire  mem_io_axi4_0_b_valid; 
  wire [3:0] mem_io_axi4_0_b_id; 
  wire [1:0] mem_io_axi4_0_b_resp; 
  wire  mem_io_axi4_0_ar_ready; 
  wire  mem_io_axi4_0_ar_valid; 
  wire [3:0] mem_io_axi4_0_ar_id; 
  wire [31:0] mem_io_axi4_0_ar_addr; 
  wire [7:0] mem_io_axi4_0_ar_len; 
  wire [2:0] mem_io_axi4_0_ar_size; 
  wire [1:0] mem_io_axi4_0_ar_burst; 
  // add 4 signal
  wire  mem_io_axi4_0_ar_lock; 
  wire [3:0] mem_io_axi4_0_ar_cache; 
  wire [2:0] mem_io_axi4_0_ar_prot; 
  wire [3:0] mem_io_axi4_0_ar_qos; 
  //
  wire  mem_io_axi4_0_r_ready; 
  wire  mem_io_axi4_0_r_valid; 
  wire [3:0] mem_io_axi4_0_r_id; 
  wire [63:0] mem_io_axi4_0_r_data; 
  wire [1:0] mem_io_axi4_0_r_resp; 
  wire  mem_io_axi4_0_r_last; 

  // mmio
  wire  mmio_clock; 
  wire  mmio_reset; 
  wire  mmio_io_axi4_0_aw_ready; 
  wire  mmio_io_axi4_0_aw_valid; 
  wire [3:0] mmio_io_axi4_0_aw_id; 
  wire [30:0] mmio_io_axi4_0_aw_addr; 
  wire [7:0] mmio_io_axi4_0_aw_len; 
  wire [2:0] mmio_io_axi4_0_aw_size; 
  wire [1:0] mmio_io_axi4_0_aw_burst; 
  wire  mmio_io_axi4_0_w_ready; 
  wire  mmio_io_axi4_0_w_valid; 
  wire [63:0] mmio_io_axi4_0_w_data; 
  wire [7:0] mmio_io_axi4_0_w_strb; 
  wire  mmio_io_axi4_0_w_last; 
  wire  mmio_io_axi4_0_b_ready; 
  wire  mmio_io_axi4_0_b_valid; 
  wire [3:0] mmio_io_axi4_0_b_id; 
  wire [1:0] mmio_io_axi4_0_b_resp; 
  wire  mmio_io_axi4_0_ar_ready; 
  wire  mmio_io_axi4_0_ar_valid; 
  wire [3:0] mmio_io_axi4_0_ar_id; 
  wire [30:0] mmio_io_axi4_0_ar_addr; 
  wire [7:0] mmio_io_axi4_0_ar_len; 
  wire [2:0] mmio_io_axi4_0_ar_size; 
  wire [1:0] mmio_io_axi4_0_ar_burst; 
  wire  mmio_io_axi4_0_r_ready; 
  wire  mmio_io_axi4_0_r_valid; 
  wire [3:0] mmio_io_axi4_0_r_id; 
  wire [63:0] mmio_io_axi4_0_r_data; 
  wire [1:0] mmio_io_axi4_0_r_resp; 
  wire  mmio_io_axi4_0_r_last;
  
  wire interrupt_spi;
  wire interrupt_uart;
//  /////////////////////////////////////////////////for debug
//  wire ddr_init_fine;
//  wire awr;
//  wire arr;
//  wire wr;
//  wire bvalid;
//  wire rvalid;
//  //////////////////////////////////////////////////
  
  wire  pll_locked;
  assign reset = ~ pll_locked;
  clk_wiz_0 clk_gen(
    .clk_in1(clock100),//100m
    .clk_out1(clock50),   //50m
    .clk_out2(clock200),
    .resetn(buttonresetn),
    .locked(pll_locked) // we use pll locked signal as resetn for ddr ctrl.
  );

  // Set to any value as you like.
  reg [10:0] jtag_mfr_id = 11'h3aa;

`ifdef JTAG_BSCAN
  // debug transport module (debug2jtag)
  wire jtag_tunnel_TCK;
  wire jtag_tunnel_TMS;
  wire jtag_tunnel_TDI;
  wire jtag_tunnel_TDO;
  wire jtag_tunnel_TDO_EN;
`else
  wire jtag_TDO_data_o;
  wire jtag_TDO_driven_o;
  assign jtag_pmod_tdo = jtag_TDO_driven_o ? jtag_TDO_data_o : 1'b1;
`endif

  ExampleRocketSystem dut ( 
      .clock(dut_clock),
      .reset(dut_reset),

`ifdef JTAG_BSCAN
      .debug_systemjtag_jtag_TCK(jtag_tunnel_TCK),
      .debug_systemjtag_jtag_TMS(jtag_tunnel_TMS),
      .debug_systemjtag_jtag_TDI(jtag_tunnel_TDI),
      .debug_systemjtag_jtag_TDO_data(jtag_tunnel_TDO),
      .debug_systemjtag_jtag_TDO_driven(jtag_tunnel_TDO_EN),
      .debug_systemjtag_reset(dut_reset),
      .debug_systemjtag_mfr_id(jtag_mfr_id),
`else
      .debug_systemjtag_jtag_TCK(jtag_pmod_tck),
      .debug_systemjtag_jtag_TMS(jtag_pmod_tms),
      .debug_systemjtag_jtag_TDI(jtag_pmod_tdi),
      .debug_systemjtag_jtag_TDO_data(jtag_TDO_data_o),
      .debug_systemjtag_jtag_TDO_driven(jtag_TDO_driven_o),
      .debug_systemjtag_reset(dut_reset),
      .debug_systemjtag_mfr_id(jtag_mfr_id),
`endif

      .debug_ndreset(dut_debug_ndreset),
      .debug_dmactive(dut_debug_dmactive),
      .interrupts(dut_interrupts),
      .mem_axi4_0_aw_ready(dut_mem_axi4_0_aw_ready),
      .mem_axi4_0_aw_valid(dut_mem_axi4_0_aw_valid),
      .mem_axi4_0_aw_bits_id(dut_mem_axi4_0_aw_id),
      .mem_axi4_0_aw_bits_addr(dut_mem_axi4_0_aw_addr),
      .mem_axi4_0_aw_bits_len(dut_mem_axi4_0_aw_len),
      .mem_axi4_0_aw_bits_size(dut_mem_axi4_0_aw_size),
      .mem_axi4_0_aw_bits_burst(dut_mem_axi4_0_aw_burst),
      .mem_axi4_0_aw_bits_lock(dut_mem_axi4_0_aw_lock),
      .mem_axi4_0_aw_bits_cache(dut_mem_axi4_0_aw_cache),
      .mem_axi4_0_aw_bits_prot(dut_mem_axi4_0_aw_prot),
      .mem_axi4_0_aw_bits_qos(dut_mem_axi4_0_aw_qos),
      .mem_axi4_0_w_ready(dut_mem_axi4_0_w_ready),
      .mem_axi4_0_w_valid(dut_mem_axi4_0_w_valid),
      .mem_axi4_0_w_bits_data(dut_mem_axi4_0_w_data),
      .mem_axi4_0_w_bits_strb(dut_mem_axi4_0_w_strb),
      .mem_axi4_0_w_bits_last(dut_mem_axi4_0_w_last),
      .mem_axi4_0_b_ready(dut_mem_axi4_0_b_ready),
      .mem_axi4_0_b_valid(dut_mem_axi4_0_b_valid),
      .mem_axi4_0_b_bits_id(dut_mem_axi4_0_b_id),
      .mem_axi4_0_b_bits_resp(dut_mem_axi4_0_b_resp),
      .mem_axi4_0_ar_ready(dut_mem_axi4_0_ar_ready),
      .mem_axi4_0_ar_valid(dut_mem_axi4_0_ar_valid),
      .mem_axi4_0_ar_bits_id(dut_mem_axi4_0_ar_id),
      .mem_axi4_0_ar_bits_addr(dut_mem_axi4_0_ar_addr),
      .mem_axi4_0_ar_bits_len(dut_mem_axi4_0_ar_len),
      .mem_axi4_0_ar_bits_size(dut_mem_axi4_0_ar_size),
      .mem_axi4_0_ar_bits_burst(dut_mem_axi4_0_ar_burst),
      .mem_axi4_0_ar_bits_lock(dut_mem_axi4_0_ar_lock),
      .mem_axi4_0_ar_bits_cache(dut_mem_axi4_0_ar_cache),
      .mem_axi4_0_ar_bits_prot(dut_mem_axi4_0_ar_prot),
      .mem_axi4_0_ar_bits_qos(dut_mem_axi4_0_ar_qos),
      .mem_axi4_0_r_ready(dut_mem_axi4_0_r_ready),
      .mem_axi4_0_r_valid(dut_mem_axi4_0_r_valid),
      .mem_axi4_0_r_bits_id(dut_mem_axi4_0_r_id),
      .mem_axi4_0_r_bits_data(dut_mem_axi4_0_r_data),
      .mem_axi4_0_r_bits_resp(dut_mem_axi4_0_r_resp),
      .mem_axi4_0_r_bits_last(dut_mem_axi4_0_r_last),
      .mmio_axi4_0_aw_ready(dut_mmio_axi4_0_aw_ready),
      .mmio_axi4_0_aw_valid(dut_mmio_axi4_0_aw_valid),
      .mmio_axi4_0_aw_bits_id(dut_mmio_axi4_0_aw_id),
      .mmio_axi4_0_aw_bits_addr(dut_mmio_axi4_0_aw_addr),
      .mmio_axi4_0_aw_bits_len(dut_mmio_axi4_0_aw_len),
      .mmio_axi4_0_aw_bits_size(dut_mmio_axi4_0_aw_size),
      .mmio_axi4_0_aw_bits_burst(dut_mmio_axi4_0_aw_burst),
      .mmio_axi4_0_aw_bits_lock(dut_mmio_axi4_0_aw_lock),
      .mmio_axi4_0_aw_bits_cache(dut_mmio_axi4_0_aw_cache),
      .mmio_axi4_0_aw_bits_prot(dut_mmio_axi4_0_aw_prot),
      .mmio_axi4_0_aw_bits_qos(dut_mmio_axi4_0_aw_qos),
      .mmio_axi4_0_w_ready(dut_mmio_axi4_0_w_ready),
      .mmio_axi4_0_w_valid(dut_mmio_axi4_0_w_valid),
      .mmio_axi4_0_w_bits_data(dut_mmio_axi4_0_w_data),
      .mmio_axi4_0_w_bits_strb(dut_mmio_axi4_0_w_strb),
      .mmio_axi4_0_w_bits_last(dut_mmio_axi4_0_w_last),
      .mmio_axi4_0_b_ready(dut_mmio_axi4_0_b_ready),
      .mmio_axi4_0_b_valid(dut_mmio_axi4_0_b_valid),
      .mmio_axi4_0_b_bits_id(dut_mmio_axi4_0_b_id),
      .mmio_axi4_0_b_bits_resp(dut_mmio_axi4_0_b_resp),
      .mmio_axi4_0_ar_ready(dut_mmio_axi4_0_ar_ready),
      .mmio_axi4_0_ar_valid(dut_mmio_axi4_0_ar_valid),
      .mmio_axi4_0_ar_bits_id(dut_mmio_axi4_0_ar_id),
      .mmio_axi4_0_ar_bits_addr(dut_mmio_axi4_0_ar_addr),
      .mmio_axi4_0_ar_bits_len(dut_mmio_axi4_0_ar_len),
      .mmio_axi4_0_ar_bits_size(dut_mmio_axi4_0_ar_size),
      .mmio_axi4_0_ar_bits_burst(dut_mmio_axi4_0_ar_burst),
      .mmio_axi4_0_ar_bits_lock(dut_mmio_axi4_0_ar_lock),
      .mmio_axi4_0_ar_bits_cache(dut_mmio_axi4_0_ar_cache),
      .mmio_axi4_0_ar_bits_prot(dut_mmio_axi4_0_ar_prot),
      .mmio_axi4_0_ar_bits_qos(dut_mmio_axi4_0_ar_qos),
      .mmio_axi4_0_r_ready(dut_mmio_axi4_0_r_ready),
      .mmio_axi4_0_r_valid(dut_mmio_axi4_0_r_valid),
      .mmio_axi4_0_r_bits_id(dut_mmio_axi4_0_r_id),
      .mmio_axi4_0_r_bits_data(dut_mmio_axi4_0_r_data),
      .mmio_axi4_0_r_bits_resp(dut_mmio_axi4_0_r_resp),
      .mmio_axi4_0_r_bits_last(dut_mmio_axi4_0_r_last),
      .l2_frontend_bus_axi4_0_aw_ready(dut_l2_frontend_bus_axi4_0_aw_ready),
      .l2_frontend_bus_axi4_0_aw_valid(dut_l2_frontend_bus_axi4_0_aw_valid),
      .l2_frontend_bus_axi4_0_aw_bits_id(dut_l2_frontend_bus_axi4_0_aw_id),
      .l2_frontend_bus_axi4_0_aw_bits_addr(dut_l2_frontend_bus_axi4_0_aw_addr),
      .l2_frontend_bus_axi4_0_aw_bits_len(dut_l2_frontend_bus_axi4_0_aw_len),
      .l2_frontend_bus_axi4_0_aw_bits_size(dut_l2_frontend_bus_axi4_0_aw_size),
      .l2_frontend_bus_axi4_0_aw_bits_burst(dut_l2_frontend_bus_axi4_0_aw_burst),
      .l2_frontend_bus_axi4_0_aw_bits_lock(dut_l2_frontend_bus_axi4_0_aw_lock),
      .l2_frontend_bus_axi4_0_aw_bits_cache(dut_l2_frontend_bus_axi4_0_aw_cache),
      .l2_frontend_bus_axi4_0_aw_bits_prot(dut_l2_frontend_bus_axi4_0_aw_prot),
      .l2_frontend_bus_axi4_0_aw_bits_qos(dut_l2_frontend_bus_axi4_0_aw_qos),
      .l2_frontend_bus_axi4_0_w_ready(dut_l2_frontend_bus_axi4_0_w_ready),
      .l2_frontend_bus_axi4_0_w_valid(dut_l2_frontend_bus_axi4_0_w_valid),
      .l2_frontend_bus_axi4_0_w_bits_data(dut_l2_frontend_bus_axi4_0_w_data),
      .l2_frontend_bus_axi4_0_w_bits_strb(dut_l2_frontend_bus_axi4_0_w_strb),
      .l2_frontend_bus_axi4_0_w_bits_last(dut_l2_frontend_bus_axi4_0_w_last),
      .l2_frontend_bus_axi4_0_b_ready(dut_l2_frontend_bus_axi4_0_b_ready),
      .l2_frontend_bus_axi4_0_b_valid(dut_l2_frontend_bus_axi4_0_b_valid),
      .l2_frontend_bus_axi4_0_b_bits_id(dut_l2_frontend_bus_axi4_0_b_id),
      .l2_frontend_bus_axi4_0_b_bits_resp(dut_l2_frontend_bus_axi4_0_b_resp),
      .l2_frontend_bus_axi4_0_ar_ready(dut_l2_frontend_bus_axi4_0_ar_ready),
      .l2_frontend_bus_axi4_0_ar_valid(dut_l2_frontend_bus_axi4_0_ar_valid),
      .l2_frontend_bus_axi4_0_ar_bits_id(dut_l2_frontend_bus_axi4_0_ar_id),
      .l2_frontend_bus_axi4_0_ar_bits_addr(dut_l2_frontend_bus_axi4_0_ar_addr),
      .l2_frontend_bus_axi4_0_ar_bits_len(dut_l2_frontend_bus_axi4_0_ar_len),
      .l2_frontend_bus_axi4_0_ar_bits_size(dut_l2_frontend_bus_axi4_0_ar_size),
      .l2_frontend_bus_axi4_0_ar_bits_burst(dut_l2_frontend_bus_axi4_0_ar_burst),
      .l2_frontend_bus_axi4_0_ar_bits_lock(dut_l2_frontend_bus_axi4_0_ar_lock),
      .l2_frontend_bus_axi4_0_ar_bits_cache(dut_l2_frontend_bus_axi4_0_ar_cache),
      .l2_frontend_bus_axi4_0_ar_bits_prot(dut_l2_frontend_bus_axi4_0_ar_prot),
      .l2_frontend_bus_axi4_0_ar_bits_qos(dut_l2_frontend_bus_axi4_0_ar_qos),
      .l2_frontend_bus_axi4_0_r_ready(dut_l2_frontend_bus_axi4_0_r_ready),
      .l2_frontend_bus_axi4_0_r_valid(dut_l2_frontend_bus_axi4_0_r_valid),
      .l2_frontend_bus_axi4_0_r_bits_id(dut_l2_frontend_bus_axi4_0_r_id),
      .l2_frontend_bus_axi4_0_r_bits_data(dut_l2_frontend_bus_axi4_0_r_data),
      .l2_frontend_bus_axi4_0_r_bits_resp(dut_l2_frontend_bus_axi4_0_r_resp),
      .l2_frontend_bus_axi4_0_r_bits_last(dut_l2_frontend_bus_axi4_0_r_last)
    );

`ifdef SIM_ENABLE_DDR
  AXIMem mem ( 
    .clock(mem_clock),
    .clock200(clock200), // DDR driver 200MHz
    .reset(mem_reset),

    .io_axi4_0_aw_ready(mem_io_axi4_0_aw_ready),
    .io_axi4_0_aw_valid(mem_io_axi4_0_aw_valid),
    .io_axi4_0_aw_id(mem_io_axi4_0_aw_id),
    .io_axi4_0_aw_addr(mem_io_axi4_0_aw_addr),
    .io_axi4_0_aw_len(mem_io_axi4_0_aw_len),
    .io_axi4_0_aw_size(mem_io_axi4_0_aw_size),
    .io_axi4_0_aw_burst(mem_io_axi4_0_aw_burst),
    // add 4 signals
    .io_axi4_0_aw_lock(mem_io_axi4_0_aw_lock),
    .io_axi4_0_aw_qos(mem_io_axi4_0_aw_qos),
    .io_axi4_0_aw_prot(mem_io_axi4_0_aw_prot),
    .io_axi4_0_aw_cache(mem_io_axi4_0_aw_cache),
    //
    .io_axi4_0_w_ready(mem_io_axi4_0_w_ready),
    .io_axi4_0_w_valid(mem_io_axi4_0_w_valid),
    .io_axi4_0_w_data(mem_io_axi4_0_w_data),
    .io_axi4_0_w_strb(mem_io_axi4_0_w_strb),
    .io_axi4_0_w_last(mem_io_axi4_0_w_last),
    .io_axi4_0_b_ready(mem_io_axi4_0_b_ready),
    .io_axi4_0_b_valid(mem_io_axi4_0_b_valid),
    .io_axi4_0_b_id(mem_io_axi4_0_b_id),
    .io_axi4_0_b_resp(mem_io_axi4_0_b_resp),
    .io_axi4_0_ar_ready(mem_io_axi4_0_ar_ready),
    .io_axi4_0_ar_valid(mem_io_axi4_0_ar_valid),
    .io_axi4_0_ar_id(mem_io_axi4_0_ar_id),
    .io_axi4_0_ar_addr(mem_io_axi4_0_ar_addr),
    .io_axi4_0_ar_len(mem_io_axi4_0_ar_len),
    .io_axi4_0_ar_size(mem_io_axi4_0_ar_size),
    .io_axi4_0_ar_burst(mem_io_axi4_0_ar_burst),
    // add 4 signals
    .io_axi4_0_ar_lock(mem_io_axi4_0_ar_lock),
    .io_axi4_0_ar_qos(mem_io_axi4_0_ar_qos),
    .io_axi4_0_ar_prot(mem_io_axi4_0_ar_prot),
    .io_axi4_0_ar_cache(mem_io_axi4_0_ar_cache),
    //
    .io_axi4_0_r_ready(mem_io_axi4_0_r_ready),
    .io_axi4_0_r_valid(mem_io_axi4_0_r_valid),
    .io_axi4_0_r_id(mem_io_axi4_0_r_id),
    .io_axi4_0_r_data(mem_io_axi4_0_r_data),
    .io_axi4_0_r_resp(mem_io_axi4_0_r_resp),
    .io_axi4_0_r_last(mem_io_axi4_0_r_last),
    
    //HW devices' pins
    .ddr_dq (ddr_dq),
    .ddr_dqs_n (ddr_dqs_n),
    .ddr_dqs_p (ddr_dqs_p),
    .ddr_addr (ddr_addr),
    .ddr_ba (ddr_ba),
    .ddr_ras_n (ddr_ras_n),
    .ddr_cas_n (ddr_cas_n),
    .ddr_we_n (ddr_we_n),
    .ddr_ck_n (ddr_ck_n),
    .ddr_ck_p (ddr_ck_p),
    .ddr_cke (ddr_cke),
`ifdef BOARD_NEXYS_VIDEO
    .ddr_reset_n (ddr_reset_n), // nexys-video
`else
    .ddr_cs_n(ddr_cs_n), // nexys4-ddr
`endif
    .ddr_dm (ddr_dm),
    .ddr_odt (ddr_odt)
//    // for debug
//    .init_fin(ddr_init_fin),
//    .s_aw_ready(awr),
//    .s_ar_ready(arr),
//    .s_w_ready(wr),
//    .s_b_valid(bvalid),
//    .s_r_valid(rvalid)
  );
`else
    assign mem_io_axi4_0_aw_ready   = 0;
    assign mem_io_axi4_0_w_ready    = 0;
    assign mem_io_axi4_0_b_valid    = 0;
    assign mem_io_axi4_0_b_id       = 0;
    assign mem_io_axi4_0_b_resp     = 0;
    assign mem_io_axi4_0_ar_ready   = 0;
    assign mem_io_axi4_0_r_valid    = 0;
    assign mem_io_axi4_0_r_id       = 0;
    assign mem_io_axi4_0_r_data     = 0;
    assign mem_io_axi4_0_r_resp     = 0;
    assign mem_io_axi4_0_r_last     = 0;
`endif

  
  AXIMmio mmio ( 
    .clock(mmio_clock),
    .reset(mmio_reset),
    
    .io_axi4_0_aw_ready(mmio_io_axi4_0_aw_ready),
    .io_axi4_0_aw_valid(mmio_io_axi4_0_aw_valid),
    .io_axi4_0_aw_id(mmio_io_axi4_0_aw_id),
    .io_axi4_0_aw_addr(mmio_io_axi4_0_aw_addr),
    .io_axi4_0_aw_len(mmio_io_axi4_0_aw_len),
    .io_axi4_0_aw_size(mmio_io_axi4_0_aw_size),
    .io_axi4_0_aw_burst(mmio_io_axi4_0_aw_burst),
    .io_axi4_0_w_ready(mmio_io_axi4_0_w_ready),
    .io_axi4_0_w_valid(mmio_io_axi4_0_w_valid),
    .io_axi4_0_w_data(mmio_io_axi4_0_w_data),
    .io_axi4_0_w_strb(mmio_io_axi4_0_w_strb),
    .io_axi4_0_w_last(mmio_io_axi4_0_w_last),
    .io_axi4_0_b_ready(mmio_io_axi4_0_b_ready),
    .io_axi4_0_b_valid(mmio_io_axi4_0_b_valid),
    .io_axi4_0_b_id(mmio_io_axi4_0_b_id),
    .io_axi4_0_b_resp(mmio_io_axi4_0_b_resp),
    .io_axi4_0_ar_ready(mmio_io_axi4_0_ar_ready),
    .io_axi4_0_ar_valid(mmio_io_axi4_0_ar_valid),
    .io_axi4_0_ar_id(mmio_io_axi4_0_ar_id),
    .io_axi4_0_ar_addr(mmio_io_axi4_0_ar_addr),
    .io_axi4_0_ar_len(mmio_io_axi4_0_ar_len),
    .io_axi4_0_ar_size(mmio_io_axi4_0_ar_size),
    .io_axi4_0_ar_burst(mmio_io_axi4_0_ar_burst),
    .io_axi4_0_r_ready(mmio_io_axi4_0_r_ready),
    .io_axi4_0_r_valid(mmio_io_axi4_0_r_valid),
    .io_axi4_0_r_id(mmio_io_axi4_0_r_id),
    .io_axi4_0_r_data(mmio_io_axi4_0_r_data),
    .io_axi4_0_r_resp(mmio_io_axi4_0_r_resp),
    .io_axi4_0_r_last(mmio_io_axi4_0_r_last),
    
    //external interrupt connecting
    .interrupt_uart(interrupt_uart),
    .interrupt_spi(interrupt_spi),
    
    //HW devices' pins
    .uart_TX(uart_TX),
    .uart_RX(uart_RX),

    .spi_cs(spi_cs),
    .spi_sclock(spi_sclock),
    .spi_mosi(spi_mosi),
    .spi_miso(spi_miso),
    .sd_poweroff(sd_poweroff)
  );
  
  //////////////////////////////////debug
  
  assign LED[7] = uart_TX;
  assign LED[6] = uart_RX;
  
  assign LED[5] = dut_clock;
  
  assign LED[4] = spi_miso;
  assign LED[3] = spi_mosi;
  assign LED[2] = spi_sclock;
  assign LED[1] = spi_cs;
  assign LED[0] = sd_poweroff;    
  //////////////////////////////////debug

`ifdef JTAG_BSCAN
  JTAGTUNNEL JtagTunnel(
    .jtag_tck(jtag_tunnel_TCK),
    .jtag_tms(jtag_tunnel_TMS),
    .jtag_tdi(jtag_tunnel_TDI),
    .jtag_tdo(jtag_tunnel_TDO),
    .jtag_tdo_en(jtag_tunnel_TDO_EN)
  );
`else
`endif

  //-------------------------connect all the module together---- very verbose by Chisel generated, I will change it later

  assign dut_clock = clock50; 
  assign dut_reset = reset | dut_debug_ndreset; 
  
  assign dut_interrupts[0] = interrupt_uart;
  assign dut_interrupts[1] = interrupt_spi;  // need to be connected with interrupts

  //  ***** mem module *****
  // CR inheritance
  assign mem_clock = clock50; 
  assign mem_reset = reset; 
  //  drived by outside module
  assign dut_mem_axi4_0_aw_ready = mem_io_axi4_0_aw_ready; 
  assign dut_mem_axi4_0_w_ready = mem_io_axi4_0_w_ready; 
  assign dut_mem_axi4_0_b_valid = mem_io_axi4_0_b_valid; 
  assign dut_mem_axi4_0_b_id = mem_io_axi4_0_b_id; 
  assign dut_mem_axi4_0_b_resp = mem_io_axi4_0_b_resp; 
  assign dut_mem_axi4_0_ar_ready = mem_io_axi4_0_ar_ready; 
  assign dut_mem_axi4_0_r_valid = mem_io_axi4_0_r_valid; 
  assign dut_mem_axi4_0_r_id = mem_io_axi4_0_r_id; 
  assign dut_mem_axi4_0_r_data = mem_io_axi4_0_r_data; 
  assign dut_mem_axi4_0_r_resp = mem_io_axi4_0_r_resp; 
  assign dut_mem_axi4_0_r_last = mem_io_axi4_0_r_last; 
  //  output to outside module 
  assign mem_io_axi4_0_aw_valid = dut_mem_axi4_0_aw_valid; 
  assign mem_io_axi4_0_aw_id = dut_mem_axi4_0_aw_id; 
  assign mem_io_axi4_0_aw_addr = dut_mem_axi4_0_aw_addr; 
  assign mem_io_axi4_0_aw_len = dut_mem_axi4_0_aw_len; 
  assign mem_io_axi4_0_aw_size = dut_mem_axi4_0_aw_size; 
  assign mem_io_axi4_0_aw_burst = dut_mem_axi4_0_aw_burst; 
  // add 4 signals
  assign mem_io_axi4_0_aw_lock = dut_mem_axi4_0_aw_lock; 
  assign mem_io_axi4_0_aw_prot = dut_mem_axi4_0_aw_prot; 
  assign mem_io_axi4_0_aw_qos = dut_mem_axi4_0_aw_qos; 
  assign mem_io_axi4_0_aw_cache = dut_mem_axi4_0_aw_cache; 
  //
  assign mem_io_axi4_0_w_valid = dut_mem_axi4_0_w_valid; 
  assign mem_io_axi4_0_w_data = dut_mem_axi4_0_w_data; 
  assign mem_io_axi4_0_w_strb = dut_mem_axi4_0_w_strb; 
  assign mem_io_axi4_0_w_last = dut_mem_axi4_0_w_last; 
  assign mem_io_axi4_0_b_ready = dut_mem_axi4_0_b_ready; 
  assign mem_io_axi4_0_ar_valid = dut_mem_axi4_0_ar_valid; 
  assign mem_io_axi4_0_ar_id = dut_mem_axi4_0_ar_id; 
  assign mem_io_axi4_0_ar_addr = dut_mem_axi4_0_ar_addr; 
  assign mem_io_axi4_0_ar_len = dut_mem_axi4_0_ar_len; 
  assign mem_io_axi4_0_ar_size = dut_mem_axi4_0_ar_size; 
  assign mem_io_axi4_0_ar_burst = dut_mem_axi4_0_ar_burst; 
  // add 4 signals
  assign mem_io_axi4_0_ar_lock = dut_mem_axi4_0_ar_lock; 
  assign mem_io_axi4_0_ar_prot = dut_mem_axi4_0_ar_prot; 
  assign mem_io_axi4_0_ar_qos = dut_mem_axi4_0_ar_qos; 
  assign mem_io_axi4_0_ar_cache = dut_mem_axi4_0_ar_cache; 
  //
  assign mem_io_axi4_0_r_ready = dut_mem_axi4_0_r_ready; 
  

  //  ***** mmio module *****
  // CR inheritance 
  assign mmio_clock = clock50; 
  assign mmio_reset = reset; 
  //  drived by outside module
  assign dut_mmio_axi4_0_aw_ready = mmio_io_axi4_0_aw_ready; 
  assign dut_mmio_axi4_0_w_ready = mmio_io_axi4_0_w_ready; 
  assign dut_mmio_axi4_0_b_valid = mmio_io_axi4_0_b_valid; 
  assign dut_mmio_axi4_0_b_id = mmio_io_axi4_0_b_id; 
  assign dut_mmio_axi4_0_b_resp = mmio_io_axi4_0_b_resp; 
  assign dut_mmio_axi4_0_ar_ready = mmio_io_axi4_0_ar_ready; 
  assign dut_mmio_axi4_0_r_valid = mmio_io_axi4_0_r_valid; 
  assign dut_mmio_axi4_0_r_id = mmio_io_axi4_0_r_id; 
  assign dut_mmio_axi4_0_r_data = mmio_io_axi4_0_r_data; 
  assign dut_mmio_axi4_0_r_resp = mmio_io_axi4_0_r_resp; 
  assign dut_mmio_axi4_0_r_last = mmio_io_axi4_0_r_last; 
  //  output to outside module 
  assign mmio_io_axi4_0_aw_valid = dut_mmio_axi4_0_aw_valid; 
  assign mmio_io_axi4_0_aw_id = dut_mmio_axi4_0_aw_id; 
  assign mmio_io_axi4_0_aw_addr = dut_mmio_axi4_0_aw_addr; 
  assign mmio_io_axi4_0_aw_len = dut_mmio_axi4_0_aw_len; 
  assign mmio_io_axi4_0_aw_size = dut_mmio_axi4_0_aw_size; 
  assign mmio_io_axi4_0_aw_burst = dut_mmio_axi4_0_aw_burst; 
  assign mmio_io_axi4_0_w_valid = dut_mmio_axi4_0_w_valid; 
  assign mmio_io_axi4_0_w_data = dut_mmio_axi4_0_w_data; 
  assign mmio_io_axi4_0_w_strb = dut_mmio_axi4_0_w_strb; 
  assign mmio_io_axi4_0_w_last = dut_mmio_axi4_0_w_last; 
  assign mmio_io_axi4_0_b_ready = dut_mmio_axi4_0_b_ready; 
  assign mmio_io_axi4_0_ar_valid = dut_mmio_axi4_0_ar_valid; 
  assign mmio_io_axi4_0_ar_id = dut_mmio_axi4_0_ar_id; 
  assign mmio_io_axi4_0_ar_addr = dut_mmio_axi4_0_ar_addr; 
  assign mmio_io_axi4_0_ar_len = dut_mmio_axi4_0_ar_len; 
  assign mmio_io_axi4_0_ar_size = dut_mmio_axi4_0_ar_size; 
  assign mmio_io_axi4_0_ar_burst = dut_mmio_axi4_0_ar_burst; 
  assign mmio_io_axi4_0_r_ready = dut_mmio_axi4_0_r_ready; 


  //  ***** l2 frontend define - grounded *****
  assign dut_l2_frontend_bus_axi4_0_aw_valid = 1'h0; 
  assign dut_l2_frontend_bus_axi4_0_aw_id = 8'h0;
  assign dut_l2_frontend_bus_axi4_0_aw_addr = 32'h0;
  assign dut_l2_frontend_bus_axi4_0_aw_len = 8'h0;
  assign dut_l2_frontend_bus_axi4_0_aw_size = 3'h0;
  assign dut_l2_frontend_bus_axi4_0_aw_burst = 2'h0;
  assign dut_l2_frontend_bus_axi4_0_aw_lock = 1'h0;
  assign dut_l2_frontend_bus_axi4_0_aw_cache = 4'h0;
  assign dut_l2_frontend_bus_axi4_0_aw_prot = 3'h0;
  assign dut_l2_frontend_bus_axi4_0_aw_qos = 4'h0;
  assign dut_l2_frontend_bus_axi4_0_w_valid = 1'h0;
  assign dut_l2_frontend_bus_axi4_0_w_data = 64'h0;
  assign dut_l2_frontend_bus_axi4_0_w_strb = 8'h0;
  assign dut_l2_frontend_bus_axi4_0_w_last = 1'h0;
  assign dut_l2_frontend_bus_axi4_0_b_ready = 1'h0; 
  assign dut_l2_frontend_bus_axi4_0_ar_valid = 1'h0;
  assign dut_l2_frontend_bus_axi4_0_ar_id = 8'h0;
  assign dut_l2_frontend_bus_axi4_0_ar_addr = 32'h0;
  assign dut_l2_frontend_bus_axi4_0_ar_len = 8'h0;
  assign dut_l2_frontend_bus_axi4_0_ar_size = 3'h0;
  assign dut_l2_frontend_bus_axi4_0_ar_burst = 2'h0;
  assign dut_l2_frontend_bus_axi4_0_ar_lock = 1'h0;
  assign dut_l2_frontend_bus_axi4_0_ar_cache = 4'h0;
  assign dut_l2_frontend_bus_axi4_0_ar_prot = 3'h0;
  assign dut_l2_frontend_bus_axi4_0_ar_qos = 4'h0;
  assign dut_l2_frontend_bus_axi4_0_r_ready = 1'h0; 


endmodule //end of top
