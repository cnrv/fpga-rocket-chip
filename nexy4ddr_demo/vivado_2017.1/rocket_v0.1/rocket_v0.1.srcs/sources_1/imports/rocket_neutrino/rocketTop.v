module rocketTop( // @[:freechips.rocketchip.system.DefaultFPGAConfig.fir@194657.2]
  input   clock100, // @[:freechips.rocketchip.system.DefaultFPGAConfig.fir@194658.4]
  input   reset, // @[:freechips.rocketchip.system.DefaultFPGAConfig.fir@194659.4]
  
  output  uart_TX,
  input   uart_RX
  // position for outside pins ... TBA

  //we do not need io_success
  //output  io_success // @[:freechips.rocketchip.system.DefaultFPGAConfig.fir@194660.4]
);
  wire  dut_clock; // @[TestHarness.scala 15:19:freechips.rocketchip.system.DefaultFPGAConfig.fir@194665.4]
  wire  dut_reset; // @[TestHarness.scala 15:19:freechips.rocketchip.system.DefaultFPGAConfig.fir@194665.4]
  wire  dut_debug_clockeddmi_dmi_req_ready; // @[TestHarness.scala 15:19:freechips.rocketchip.system.DefaultFPGAConfig.fir@194665.4]
  wire  dut_debug_clockeddmi_dmi_req_valid; // @[TestHarness.scala 15:19:freechips.rocketchip.system.DefaultFPGAConfig.fir@194665.4]
  wire [6:0] dut_debug_clockeddmi_dmi_req_bits_addr; // @[TestHarness.scala 15:19:freechips.rocketchip.system.DefaultFPGAConfig.fir@194665.4]
  wire [31:0] dut_debug_clockeddmi_dmi_req_bits_data; // @[TestHarness.scala 15:19:freechips.rocketchip.system.DefaultFPGAConfig.fir@194665.4]
  wire [1:0] dut_debug_clockeddmi_dmi_req_bits_op; // @[TestHarness.scala 15:19:freechips.rocketchip.system.DefaultFPGAConfig.fir@194665.4]
  wire  dut_debug_clockeddmi_dmi_resp_ready; // @[TestHarness.scala 15:19:freechips.rocketchip.system.DefaultFPGAConfig.fir@194665.4]
  wire  dut_debug_clockeddmi_dmi_resp_valid; // @[TestHarness.scala 15:19:freechips.rocketchip.system.DefaultFPGAConfig.fir@194665.4]
  wire [31:0] dut_debug_clockeddmi_dmi_resp_bits_data; // @[TestHarness.scala 15:19:freechips.rocketchip.system.DefaultFPGAConfig.fir@194665.4]
  wire [1:0] dut_debug_clockeddmi_dmi_resp_bits_resp; // @[TestHarness.scala 15:19:freechips.rocketchip.system.DefaultFPGAConfig.fir@194665.4]
  wire  dut_debug_clockeddmi_dmiClock; // @[TestHarness.scala 15:19:freechips.rocketchip.system.DefaultFPGAConfig.fir@194665.4]
  wire  dut_debug_clockeddmi_dmiReset; // @[TestHarness.scala 15:19:freechips.rocketchip.system.DefaultFPGAConfig.fir@194665.4]
  wire  dut_debug_ndreset; // @[TestHarness.scala 15:19:freechips.rocketchip.system.DefaultFPGAConfig.fir@194665.4]
  wire  dut_debug_dmactive; // @[TestHarness.scala 15:19:freechips.rocketchip.system.DefaultFPGAConfig.fir@194665.4]
  wire [1:0] dut_interrupts; // @[TestHarness.scala 15:19:freechips.rocketchip.system.DefaultFPGAConfig.fir@194665.4]
  wire  dut_mem_axi4_0_aw_ready; // @[TestHarness.scala 15:19:freechips.rocketchip.system.DefaultFPGAConfig.fir@194665.4]
  wire  dut_mem_axi4_0_aw_valid; // @[TestHarness.scala 15:19:freechips.rocketchip.system.DefaultFPGAConfig.fir@194665.4]
  wire [3:0] dut_mem_axi4_0_aw_bits_id; // @[TestHarness.scala 15:19:freechips.rocketchip.system.DefaultFPGAConfig.fir@194665.4]
  wire [31:0] dut_mem_axi4_0_aw_bits_addr; // @[TestHarness.scala 15:19:freechips.rocketchip.system.DefaultFPGAConfig.fir@194665.4]
  wire [7:0] dut_mem_axi4_0_aw_bits_len; // @[TestHarness.scala 15:19:freechips.rocketchip.system.DefaultFPGAConfig.fir@194665.4]
  wire [2:0] dut_mem_axi4_0_aw_bits_size; // @[TestHarness.scala 15:19:freechips.rocketchip.system.DefaultFPGAConfig.fir@194665.4]
  wire [1:0] dut_mem_axi4_0_aw_bits_burst; // @[TestHarness.scala 15:19:freechips.rocketchip.system.DefaultFPGAConfig.fir@194665.4]
  wire  dut_mem_axi4_0_aw_bits_lock; // @[TestHarness.scala 15:19:freechips.rocketchip.system.DefaultFPGAConfig.fir@194665.4]
  wire [3:0] dut_mem_axi4_0_aw_bits_cache; // @[TestHarness.scala 15:19:freechips.rocketchip.system.DefaultFPGAConfig.fir@194665.4]
  wire [2:0] dut_mem_axi4_0_aw_bits_prot; // @[TestHarness.scala 15:19:freechips.rocketchip.system.DefaultFPGAConfig.fir@194665.4]
  wire [3:0] dut_mem_axi4_0_aw_bits_qos; // @[TestHarness.scala 15:19:freechips.rocketchip.system.DefaultFPGAConfig.fir@194665.4]
  wire  dut_mem_axi4_0_w_ready; // @[TestHarness.scala 15:19:freechips.rocketchip.system.DefaultFPGAConfig.fir@194665.4]
  wire  dut_mem_axi4_0_w_valid; // @[TestHarness.scala 15:19:freechips.rocketchip.system.DefaultFPGAConfig.fir@194665.4]
  wire [63:0] dut_mem_axi4_0_w_bits_data; // @[TestHarness.scala 15:19:freechips.rocketchip.system.DefaultFPGAConfig.fir@194665.4]
  wire [7:0] dut_mem_axi4_0_w_bits_strb; // @[TestHarness.scala 15:19:freechips.rocketchip.system.DefaultFPGAConfig.fir@194665.4]
  wire  dut_mem_axi4_0_w_bits_last; // @[TestHarness.scala 15:19:freechips.rocketchip.system.DefaultFPGAConfig.fir@194665.4]
  wire  dut_mem_axi4_0_b_ready; // @[TestHarness.scala 15:19:freechips.rocketchip.system.DefaultFPGAConfig.fir@194665.4]
  wire  dut_mem_axi4_0_b_valid; // @[TestHarness.scala 15:19:freechips.rocketchip.system.DefaultFPGAConfig.fir@194665.4]
  wire [3:0] dut_mem_axi4_0_b_bits_id; // @[TestHarness.scala 15:19:freechips.rocketchip.system.DefaultFPGAConfig.fir@194665.4]
  wire [1:0] dut_mem_axi4_0_b_bits_resp; // @[TestHarness.scala 15:19:freechips.rocketchip.system.DefaultFPGAConfig.fir@194665.4]
  wire  dut_mem_axi4_0_ar_ready; // @[TestHarness.scala 15:19:freechips.rocketchip.system.DefaultFPGAConfig.fir@194665.4]
  wire  dut_mem_axi4_0_ar_valid; // @[TestHarness.scala 15:19:freechips.rocketchip.system.DefaultFPGAConfig.fir@194665.4]
  wire [3:0] dut_mem_axi4_0_ar_bits_id; // @[TestHarness.scala 15:19:freechips.rocketchip.system.DefaultFPGAConfig.fir@194665.4]
  wire [31:0] dut_mem_axi4_0_ar_bits_addr; // @[TestHarness.scala 15:19:freechips.rocketchip.system.DefaultFPGAConfig.fir@194665.4]
  wire [7:0] dut_mem_axi4_0_ar_bits_len; // @[TestHarness.scala 15:19:freechips.rocketchip.system.DefaultFPGAConfig.fir@194665.4]
  wire [2:0] dut_mem_axi4_0_ar_bits_size; // @[TestHarness.scala 15:19:freechips.rocketchip.system.DefaultFPGAConfig.fir@194665.4]
  wire [1:0] dut_mem_axi4_0_ar_bits_burst; // @[TestHarness.scala 15:19:freechips.rocketchip.system.DefaultFPGAConfig.fir@194665.4]
  wire  dut_mem_axi4_0_ar_bits_lock; // @[TestHarness.scala 15:19:freechips.rocketchip.system.DefaultFPGAConfig.fir@194665.4]
  wire [3:0] dut_mem_axi4_0_ar_bits_cache; // @[TestHarness.scala 15:19:freechips.rocketchip.system.DefaultFPGAConfig.fir@194665.4]
  wire [2:0] dut_mem_axi4_0_ar_bits_prot; // @[TestHarness.scala 15:19:freechips.rocketchip.system.DefaultFPGAConfig.fir@194665.4]
  wire [3:0] dut_mem_axi4_0_ar_bits_qos; // @[TestHarness.scala 15:19:freechips.rocketchip.system.DefaultFPGAConfig.fir@194665.4]
  wire  dut_mem_axi4_0_r_ready; // @[TestHarness.scala 15:19:freechips.rocketchip.system.DefaultFPGAConfig.fir@194665.4]
  wire  dut_mem_axi4_0_r_valid; // @[TestHarness.scala 15:19:freechips.rocketchip.system.DefaultFPGAConfig.fir@194665.4]
  wire [3:0] dut_mem_axi4_0_r_bits_id; // @[TestHarness.scala 15:19:freechips.rocketchip.system.DefaultFPGAConfig.fir@194665.4]
  wire [63:0] dut_mem_axi4_0_r_bits_data; // @[TestHarness.scala 15:19:freechips.rocketchip.system.DefaultFPGAConfig.fir@194665.4]
  wire [1:0] dut_mem_axi4_0_r_bits_resp; // @[TestHarness.scala 15:19:freechips.rocketchip.system.DefaultFPGAConfig.fir@194665.4]
  wire  dut_mem_axi4_0_r_bits_last; // @[TestHarness.scala 15:19:freechips.rocketchip.system.DefaultFPGAConfig.fir@194665.4]
  wire  dut_mmio_axi4_0_aw_ready; // @[TestHarness.scala 15:19:freechips.rocketchip.system.DefaultFPGAConfig.fir@194665.4]
  wire  dut_mmio_axi4_0_aw_valid; // @[TestHarness.scala 15:19:freechips.rocketchip.system.DefaultFPGAConfig.fir@194665.4]
  wire [3:0] dut_mmio_axi4_0_aw_bits_id; // @[TestHarness.scala 15:19:freechips.rocketchip.system.DefaultFPGAConfig.fir@194665.4]
  wire [30:0] dut_mmio_axi4_0_aw_bits_addr; // @[TestHarness.scala 15:19:freechips.rocketchip.system.DefaultFPGAConfig.fir@194665.4]
  wire [7:0] dut_mmio_axi4_0_aw_bits_len; // @[TestHarness.scala 15:19:freechips.rocketchip.system.DefaultFPGAConfig.fir@194665.4]
  wire [2:0] dut_mmio_axi4_0_aw_bits_size; // @[TestHarness.scala 15:19:freechips.rocketchip.system.DefaultFPGAConfig.fir@194665.4]
  wire [1:0] dut_mmio_axi4_0_aw_bits_burst; // @[TestHarness.scala 15:19:freechips.rocketchip.system.DefaultFPGAConfig.fir@194665.4]
  wire  dut_mmio_axi4_0_aw_bits_lock; // @[TestHarness.scala 15:19:freechips.rocketchip.system.DefaultFPGAConfig.fir@194665.4]
  wire [3:0] dut_mmio_axi4_0_aw_bits_cache; // @[TestHarness.scala 15:19:freechips.rocketchip.system.DefaultFPGAConfig.fir@194665.4]
  wire [2:0] dut_mmio_axi4_0_aw_bits_prot; // @[TestHarness.scala 15:19:freechips.rocketchip.system.DefaultFPGAConfig.fir@194665.4]
  wire [3:0] dut_mmio_axi4_0_aw_bits_qos; // @[TestHarness.scala 15:19:freechips.rocketchip.system.DefaultFPGAConfig.fir@194665.4]
  wire  dut_mmio_axi4_0_w_ready; // @[TestHarness.scala 15:19:freechips.rocketchip.system.DefaultFPGAConfig.fir@194665.4]
  wire  dut_mmio_axi4_0_w_valid; // @[TestHarness.scala 15:19:freechips.rocketchip.system.DefaultFPGAConfig.fir@194665.4]
  wire [63:0] dut_mmio_axi4_0_w_bits_data; // @[TestHarness.scala 15:19:freechips.rocketchip.system.DefaultFPGAConfig.fir@194665.4]
  wire [7:0] dut_mmio_axi4_0_w_bits_strb; // @[TestHarness.scala 15:19:freechips.rocketchip.system.DefaultFPGAConfig.fir@194665.4]
  wire  dut_mmio_axi4_0_w_bits_last; // @[TestHarness.scala 15:19:freechips.rocketchip.system.DefaultFPGAConfig.fir@194665.4]
  wire  dut_mmio_axi4_0_b_ready; // @[TestHarness.scala 15:19:freechips.rocketchip.system.DefaultFPGAConfig.fir@194665.4]
  wire  dut_mmio_axi4_0_b_valid; // @[TestHarness.scala 15:19:freechips.rocketchip.system.DefaultFPGAConfig.fir@194665.4]
  wire [3:0] dut_mmio_axi4_0_b_bits_id; // @[TestHarness.scala 15:19:freechips.rocketchip.system.DefaultFPGAConfig.fir@194665.4]
  wire [1:0] dut_mmio_axi4_0_b_bits_resp; // @[TestHarness.scala 15:19:freechips.rocketchip.system.DefaultFPGAConfig.fir@194665.4]
  wire  dut_mmio_axi4_0_ar_ready; // @[TestHarness.scala 15:19:freechips.rocketchip.system.DefaultFPGAConfig.fir@194665.4]
  wire  dut_mmio_axi4_0_ar_valid; // @[TestHarness.scala 15:19:freechips.rocketchip.system.DefaultFPGAConfig.fir@194665.4]
  wire [3:0] dut_mmio_axi4_0_ar_bits_id; // @[TestHarness.scala 15:19:freechips.rocketchip.system.DefaultFPGAConfig.fir@194665.4]
  wire [30:0] dut_mmio_axi4_0_ar_bits_addr; // @[TestHarness.scala 15:19:freechips.rocketchip.system.DefaultFPGAConfig.fir@194665.4]
  wire [7:0] dut_mmio_axi4_0_ar_bits_len; // @[TestHarness.scala 15:19:freechips.rocketchip.system.DefaultFPGAConfig.fir@194665.4]
  wire [2:0] dut_mmio_axi4_0_ar_bits_size; // @[TestHarness.scala 15:19:freechips.rocketchip.system.DefaultFPGAConfig.fir@194665.4]
  wire [1:0] dut_mmio_axi4_0_ar_bits_burst; // @[TestHarness.scala 15:19:freechips.rocketchip.system.DefaultFPGAConfig.fir@194665.4]
  wire  dut_mmio_axi4_0_ar_bits_lock; // @[TestHarness.scala 15:19:freechips.rocketchip.system.DefaultFPGAConfig.fir@194665.4]
  wire [3:0] dut_mmio_axi4_0_ar_bits_cache; // @[TestHarness.scala 15:19:freechips.rocketchip.system.DefaultFPGAConfig.fir@194665.4]
  wire [2:0] dut_mmio_axi4_0_ar_bits_prot; // @[TestHarness.scala 15:19:freechips.rocketchip.system.DefaultFPGAConfig.fir@194665.4]
  wire [3:0] dut_mmio_axi4_0_ar_bits_qos; // @[TestHarness.scala 15:19:freechips.rocketchip.system.DefaultFPGAConfig.fir@194665.4]
  wire  dut_mmio_axi4_0_r_ready; // @[TestHarness.scala 15:19:freechips.rocketchip.system.DefaultFPGAConfig.fir@194665.4]
  wire  dut_mmio_axi4_0_r_valid; // @[TestHarness.scala 15:19:freechips.rocketchip.system.DefaultFPGAConfig.fir@194665.4]
  wire [3:0] dut_mmio_axi4_0_r_bits_id; // @[TestHarness.scala 15:19:freechips.rocketchip.system.DefaultFPGAConfig.fir@194665.4]
  wire [63:0] dut_mmio_axi4_0_r_bits_data; // @[TestHarness.scala 15:19:freechips.rocketchip.system.DefaultFPGAConfig.fir@194665.4]
  wire [1:0] dut_mmio_axi4_0_r_bits_resp; // @[TestHarness.scala 15:19:freechips.rocketchip.system.DefaultFPGAConfig.fir@194665.4]
  wire  dut_mmio_axi4_0_r_bits_last; // @[TestHarness.scala 15:19:freechips.rocketchip.system.DefaultFPGAConfig.fir@194665.4]
  wire  dut_l2_frontend_bus_axi4_0_aw_ready; // @[TestHarness.scala 15:19:freechips.rocketchip.system.DefaultFPGAConfig.fir@194665.4]
  wire  dut_l2_frontend_bus_axi4_0_aw_valid; // @[TestHarness.scala 15:19:freechips.rocketchip.system.DefaultFPGAConfig.fir@194665.4]
  wire [7:0] dut_l2_frontend_bus_axi4_0_aw_bits_id; // @[TestHarness.scala 15:19:freechips.rocketchip.system.DefaultFPGAConfig.fir@194665.4]
  wire [31:0] dut_l2_frontend_bus_axi4_0_aw_bits_addr; // @[TestHarness.scala 15:19:freechips.rocketchip.system.DefaultFPGAConfig.fir@194665.4]
  wire [7:0] dut_l2_frontend_bus_axi4_0_aw_bits_len; // @[TestHarness.scala 15:19:freechips.rocketchip.system.DefaultFPGAConfig.fir@194665.4]
  wire [2:0] dut_l2_frontend_bus_axi4_0_aw_bits_size; // @[TestHarness.scala 15:19:freechips.rocketchip.system.DefaultFPGAConfig.fir@194665.4]
  wire [1:0] dut_l2_frontend_bus_axi4_0_aw_bits_burst; // @[TestHarness.scala 15:19:freechips.rocketchip.system.DefaultFPGAConfig.fir@194665.4]
  wire  dut_l2_frontend_bus_axi4_0_aw_bits_lock; // @[TestHarness.scala 15:19:freechips.rocketchip.system.DefaultFPGAConfig.fir@194665.4]
  wire [3:0] dut_l2_frontend_bus_axi4_0_aw_bits_cache; // @[TestHarness.scala 15:19:freechips.rocketchip.system.DefaultFPGAConfig.fir@194665.4]
  wire [2:0] dut_l2_frontend_bus_axi4_0_aw_bits_prot; // @[TestHarness.scala 15:19:freechips.rocketchip.system.DefaultFPGAConfig.fir@194665.4]
  wire [3:0] dut_l2_frontend_bus_axi4_0_aw_bits_qos; // @[TestHarness.scala 15:19:freechips.rocketchip.system.DefaultFPGAConfig.fir@194665.4]
  wire  dut_l2_frontend_bus_axi4_0_w_ready; // @[TestHarness.scala 15:19:freechips.rocketchip.system.DefaultFPGAConfig.fir@194665.4]
  wire  dut_l2_frontend_bus_axi4_0_w_valid; // @[TestHarness.scala 15:19:freechips.rocketchip.system.DefaultFPGAConfig.fir@194665.4]
  wire [63:0] dut_l2_frontend_bus_axi4_0_w_bits_data; // @[TestHarness.scala 15:19:freechips.rocketchip.system.DefaultFPGAConfig.fir@194665.4]
  wire [7:0] dut_l2_frontend_bus_axi4_0_w_bits_strb; // @[TestHarness.scala 15:19:freechips.rocketchip.system.DefaultFPGAConfig.fir@194665.4]
  wire  dut_l2_frontend_bus_axi4_0_w_bits_last; // @[TestHarness.scala 15:19:freechips.rocketchip.system.DefaultFPGAConfig.fir@194665.4]
  wire  dut_l2_frontend_bus_axi4_0_b_ready; // @[TestHarness.scala 15:19:freechips.rocketchip.system.DefaultFPGAConfig.fir@194665.4]
  wire  dut_l2_frontend_bus_axi4_0_b_valid; // @[TestHarness.scala 15:19:freechips.rocketchip.system.DefaultFPGAConfig.fir@194665.4]
  wire [7:0] dut_l2_frontend_bus_axi4_0_b_bits_id; // @[TestHarness.scala 15:19:freechips.rocketchip.system.DefaultFPGAConfig.fir@194665.4]
  wire [1:0] dut_l2_frontend_bus_axi4_0_b_bits_resp; // @[TestHarness.scala 15:19:freechips.rocketchip.system.DefaultFPGAConfig.fir@194665.4]
  wire  dut_l2_frontend_bus_axi4_0_ar_ready; // @[TestHarness.scala 15:19:freechips.rocketchip.system.DefaultFPGAConfig.fir@194665.4]
  wire  dut_l2_frontend_bus_axi4_0_ar_valid; // @[TestHarness.scala 15:19:freechips.rocketchip.system.DefaultFPGAConfig.fir@194665.4]
  wire [7:0] dut_l2_frontend_bus_axi4_0_ar_bits_id; // @[TestHarness.scala 15:19:freechips.rocketchip.system.DefaultFPGAConfig.fir@194665.4]
  wire [31:0] dut_l2_frontend_bus_axi4_0_ar_bits_addr; // @[TestHarness.scala 15:19:freechips.rocketchip.system.DefaultFPGAConfig.fir@194665.4]
  wire [7:0] dut_l2_frontend_bus_axi4_0_ar_bits_len; // @[TestHarness.scala 15:19:freechips.rocketchip.system.DefaultFPGAConfig.fir@194665.4]
  wire [2:0] dut_l2_frontend_bus_axi4_0_ar_bits_size; // @[TestHarness.scala 15:19:freechips.rocketchip.system.DefaultFPGAConfig.fir@194665.4]
  wire [1:0] dut_l2_frontend_bus_axi4_0_ar_bits_burst; // @[TestHarness.scala 15:19:freechips.rocketchip.system.DefaultFPGAConfig.fir@194665.4]
  wire  dut_l2_frontend_bus_axi4_0_ar_bits_lock; // @[TestHarness.scala 15:19:freechips.rocketchip.system.DefaultFPGAConfig.fir@194665.4]
  wire [3:0] dut_l2_frontend_bus_axi4_0_ar_bits_cache; // @[TestHarness.scala 15:19:freechips.rocketchip.system.DefaultFPGAConfig.fir@194665.4]
  wire [2:0] dut_l2_frontend_bus_axi4_0_ar_bits_prot; // @[TestHarness.scala 15:19:freechips.rocketchip.system.DefaultFPGAConfig.fir@194665.4]
  wire [3:0] dut_l2_frontend_bus_axi4_0_ar_bits_qos; // @[TestHarness.scala 15:19:freechips.rocketchip.system.DefaultFPGAConfig.fir@194665.4]
  wire  dut_l2_frontend_bus_axi4_0_r_ready; // @[TestHarness.scala 15:19:freechips.rocketchip.system.DefaultFPGAConfig.fir@194665.4]
  wire  dut_l2_frontend_bus_axi4_0_r_valid; // @[TestHarness.scala 15:19:freechips.rocketchip.system.DefaultFPGAConfig.fir@194665.4]
  wire [7:0] dut_l2_frontend_bus_axi4_0_r_bits_id; // @[TestHarness.scala 15:19:freechips.rocketchip.system.DefaultFPGAConfig.fir@194665.4]
  wire [63:0] dut_l2_frontend_bus_axi4_0_r_bits_data; // @[TestHarness.scala 15:19:freechips.rocketchip.system.DefaultFPGAConfig.fir@194665.4]
  wire [1:0] dut_l2_frontend_bus_axi4_0_r_bits_resp; // @[TestHarness.scala 15:19:freechips.rocketchip.system.DefaultFPGAConfig.fir@194665.4]
  wire  dut_l2_frontend_bus_axi4_0_r_bits_last; // @[TestHarness.scala 15:19:freechips.rocketchip.system.DefaultFPGAConfig.fir@194665.4]
  wire  mem_clock; // @[Ports.scala 76:15:freechips.rocketchip.system.DefaultFPGAConfig.fir@194680.4]
  wire  mem_reset; // @[Ports.scala 76:15:freechips.rocketchip.system.DefaultFPGAConfig.fir@194680.4]
  wire  mem_io_axi4_0_aw_ready; // @[Ports.scala 76:15:freechips.rocketchip.system.DefaultFPGAConfig.fir@194680.4]
  wire  mem_io_axi4_0_aw_valid; // @[Ports.scala 76:15:freechips.rocketchip.system.DefaultFPGAConfig.fir@194680.4]
  wire [3:0] mem_io_axi4_0_aw_bits_id; // @[Ports.scala 76:15:freechips.rocketchip.system.DefaultFPGAConfig.fir@194680.4]
  wire [27:0] mem_io_axi4_0_aw_bits_addr; // @[Ports.scala 76:15:freechips.rocketchip.system.DefaultFPGAConfig.fir@194680.4]
  wire [7:0] mem_io_axi4_0_aw_bits_len; // @[Ports.scala 76:15:freechips.rocketchip.system.DefaultFPGAConfig.fir@194680.4]
  wire [2:0] mem_io_axi4_0_aw_bits_size; // @[Ports.scala 76:15:freechips.rocketchip.system.DefaultFPGAConfig.fir@194680.4]
  wire [1:0] mem_io_axi4_0_aw_bits_burst; // @[Ports.scala 76:15:freechips.rocketchip.system.DefaultFPGAConfig.fir@194680.4]
  wire  mem_io_axi4_0_w_ready; // @[Ports.scala 76:15:freechips.rocketchip.system.DefaultFPGAConfig.fir@194680.4]
  wire  mem_io_axi4_0_w_valid; // @[Ports.scala 76:15:freechips.rocketchip.system.DefaultFPGAConfig.fir@194680.4]
  wire [63:0] mem_io_axi4_0_w_bits_data; // @[Ports.scala 76:15:freechips.rocketchip.system.DefaultFPGAConfig.fir@194680.4]
  wire [7:0] mem_io_axi4_0_w_bits_strb; // @[Ports.scala 76:15:freechips.rocketchip.system.DefaultFPGAConfig.fir@194680.4]
  wire  mem_io_axi4_0_w_bits_last; // @[Ports.scala 76:15:freechips.rocketchip.system.DefaultFPGAConfig.fir@194680.4]
  wire  mem_io_axi4_0_b_ready; // @[Ports.scala 76:15:freechips.rocketchip.system.DefaultFPGAConfig.fir@194680.4]
  wire  mem_io_axi4_0_b_valid; // @[Ports.scala 76:15:freechips.rocketchip.system.DefaultFPGAConfig.fir@194680.4]
  wire [3:0] mem_io_axi4_0_b_bits_id; // @[Ports.scala 76:15:freechips.rocketchip.system.DefaultFPGAConfig.fir@194680.4]
  wire [1:0] mem_io_axi4_0_b_bits_resp; // @[Ports.scala 76:15:freechips.rocketchip.system.DefaultFPGAConfig.fir@194680.4]
  wire  mem_io_axi4_0_ar_ready; // @[Ports.scala 76:15:freechips.rocketchip.system.DefaultFPGAConfig.fir@194680.4]
  wire  mem_io_axi4_0_ar_valid; // @[Ports.scala 76:15:freechips.rocketchip.system.DefaultFPGAConfig.fir@194680.4]
  wire [3:0] mem_io_axi4_0_ar_bits_id; // @[Ports.scala 76:15:freechips.rocketchip.system.DefaultFPGAConfig.fir@194680.4]
  wire [27:0] mem_io_axi4_0_ar_bits_addr; // @[Ports.scala 76:15:freechips.rocketchip.system.DefaultFPGAConfig.fir@194680.4]
  wire [7:0] mem_io_axi4_0_ar_bits_len; // @[Ports.scala 76:15:freechips.rocketchip.system.DefaultFPGAConfig.fir@194680.4]
  wire [2:0] mem_io_axi4_0_ar_bits_size; // @[Ports.scala 76:15:freechips.rocketchip.system.DefaultFPGAConfig.fir@194680.4]
  wire [1:0] mem_io_axi4_0_ar_bits_burst; // @[Ports.scala 76:15:freechips.rocketchip.system.DefaultFPGAConfig.fir@194680.4]
  wire  mem_io_axi4_0_r_ready; // @[Ports.scala 76:15:freechips.rocketchip.system.DefaultFPGAConfig.fir@194680.4]
  wire  mem_io_axi4_0_r_valid; // @[Ports.scala 76:15:freechips.rocketchip.system.DefaultFPGAConfig.fir@194680.4]
  wire [3:0] mem_io_axi4_0_r_bits_id; // @[Ports.scala 76:15:freechips.rocketchip.system.DefaultFPGAConfig.fir@194680.4]
  wire [63:0] mem_io_axi4_0_r_bits_data; // @[Ports.scala 76:15:freechips.rocketchip.system.DefaultFPGAConfig.fir@194680.4]
  wire [1:0] mem_io_axi4_0_r_bits_resp; // @[Ports.scala 76:15:freechips.rocketchip.system.DefaultFPGAConfig.fir@194680.4]
  wire  mem_io_axi4_0_r_bits_last; // @[Ports.scala 76:15:freechips.rocketchip.system.DefaultFPGAConfig.fir@194680.4]
  wire  mmio_mem_clock; // @[Ports.scala 120:13:freechips.rocketchip.system.DefaultFPGAConfig.fir@194688.4]
  wire  mmio_mem_reset; // @[Ports.scala 120:13:freechips.rocketchip.system.DefaultFPGAConfig.fir@194688.4]
  wire  mmio_mem_io_axi4_0_aw_ready; // @[Ports.scala 120:13:freechips.rocketchip.system.DefaultFPGAConfig.fir@194688.4]
  wire  mmio_mem_io_axi4_0_aw_valid; // @[Ports.scala 120:13:freechips.rocketchip.system.DefaultFPGAConfig.fir@194688.4]
  wire [3:0] mmio_mem_io_axi4_0_aw_bits_id; // @[Ports.scala 120:13:freechips.rocketchip.system.DefaultFPGAConfig.fir@194688.4]
  wire [11:0] mmio_mem_io_axi4_0_aw_bits_addr; // @[Ports.scala 120:13:freechips.rocketchip.system.DefaultFPGAConfig.fir@194688.4]
  wire [7:0] mmio_mem_io_axi4_0_aw_bits_len; // @[Ports.scala 120:13:freechips.rocketchip.system.DefaultFPGAConfig.fir@194688.4]
  wire [2:0] mmio_mem_io_axi4_0_aw_bits_size; // @[Ports.scala 120:13:freechips.rocketchip.system.DefaultFPGAConfig.fir@194688.4]
  wire [1:0] mmio_mem_io_axi4_0_aw_bits_burst; // @[Ports.scala 120:13:freechips.rocketchip.system.DefaultFPGAConfig.fir@194688.4]
  wire  mmio_mem_io_axi4_0_w_ready; // @[Ports.scala 120:13:freechips.rocketchip.system.DefaultFPGAConfig.fir@194688.4]
  wire  mmio_mem_io_axi4_0_w_valid; // @[Ports.scala 120:13:freechips.rocketchip.system.DefaultFPGAConfig.fir@194688.4]
  wire [63:0] mmio_mem_io_axi4_0_w_bits_data; // @[Ports.scala 120:13:freechips.rocketchip.system.DefaultFPGAConfig.fir@194688.4]
  wire [7:0] mmio_mem_io_axi4_0_w_bits_strb; // @[Ports.scala 120:13:freechips.rocketchip.system.DefaultFPGAConfig.fir@194688.4]
  wire  mmio_mem_io_axi4_0_w_bits_last; // @[Ports.scala 120:13:freechips.rocketchip.system.DefaultFPGAConfig.fir@194688.4]
  wire  mmio_mem_io_axi4_0_b_ready; // @[Ports.scala 120:13:freechips.rocketchip.system.DefaultFPGAConfig.fir@194688.4]
  wire  mmio_mem_io_axi4_0_b_valid; // @[Ports.scala 120:13:freechips.rocketchip.system.DefaultFPGAConfig.fir@194688.4]
  wire [3:0] mmio_mem_io_axi4_0_b_bits_id; // @[Ports.scala 120:13:freechips.rocketchip.system.DefaultFPGAConfig.fir@194688.4]
  wire [1:0] mmio_mem_io_axi4_0_b_bits_resp; // @[Ports.scala 120:13:freechips.rocketchip.system.DefaultFPGAConfig.fir@194688.4]
  wire  mmio_mem_io_axi4_0_ar_ready; // @[Ports.scala 120:13:freechips.rocketchip.system.DefaultFPGAConfig.fir@194688.4]
  wire  mmio_mem_io_axi4_0_ar_valid; // @[Ports.scala 120:13:freechips.rocketchip.system.DefaultFPGAConfig.fir@194688.4]
  wire [3:0] mmio_mem_io_axi4_0_ar_bits_id; // @[Ports.scala 120:13:freechips.rocketchip.system.DefaultFPGAConfig.fir@194688.4]
  wire [11:0] mmio_mem_io_axi4_0_ar_bits_addr; // @[Ports.scala 120:13:freechips.rocketchip.system.DefaultFPGAConfig.fir@194688.4]
  wire [7:0] mmio_mem_io_axi4_0_ar_bits_len; // @[Ports.scala 120:13:freechips.rocketchip.system.DefaultFPGAConfig.fir@194688.4]
  wire [2:0] mmio_mem_io_axi4_0_ar_bits_size; // @[Ports.scala 120:13:freechips.rocketchip.system.DefaultFPGAConfig.fir@194688.4]
  wire [1:0] mmio_mem_io_axi4_0_ar_bits_burst; // @[Ports.scala 120:13:freechips.rocketchip.system.DefaultFPGAConfig.fir@194688.4]
  wire  mmio_mem_io_axi4_0_r_ready; // @[Ports.scala 120:13:freechips.rocketchip.system.DefaultFPGAConfig.fir@194688.4]
  wire  mmio_mem_io_axi4_0_r_valid; // @[Ports.scala 120:13:freechips.rocketchip.system.DefaultFPGAConfig.fir@194688.4]
  wire [3:0] mmio_mem_io_axi4_0_r_bits_id; // @[Ports.scala 120:13:freechips.rocketchip.system.DefaultFPGAConfig.fir@194688.4]
  wire [63:0] mmio_mem_io_axi4_0_r_bits_data; // @[Ports.scala 120:13:freechips.rocketchip.system.DefaultFPGAConfig.fir@194688.4]
  wire [1:0] mmio_mem_io_axi4_0_r_bits_resp; // @[Ports.scala 120:13:freechips.rocketchip.system.DefaultFPGAConfig.fir@194688.4]
  wire  mmio_mem_io_axi4_0_r_bits_last; // @[Ports.scala 120:13:freechips.rocketchip.system.DefaultFPGAConfig.fir@194688.4]
  wire [31:0] SimDTM_exit; // @[Periphery.scala 157:23:freechips.rocketchip.system.DefaultFPGAConfig.fir@194711.4]
  wire  SimDTM_debug_req_ready; // @[Periphery.scala 157:23:freechips.rocketchip.system.DefaultFPGAConfig.fir@194711.4]
  wire  SimDTM_debug_req_valid; // @[Periphery.scala 157:23:freechips.rocketchip.system.DefaultFPGAConfig.fir@194711.4]
  wire [6:0] SimDTM_debug_req_bits_addr; // @[Periphery.scala 157:23:freechips.rocketchip.system.DefaultFPGAConfig.fir@194711.4]
  wire [31:0] SimDTM_debug_req_bits_data; // @[Periphery.scala 157:23:freechips.rocketchip.system.DefaultFPGAConfig.fir@194711.4]
  wire [1:0] SimDTM_debug_req_bits_op; // @[Periphery.scala 157:23:freechips.rocketchip.system.DefaultFPGAConfig.fir@194711.4]
  wire  SimDTM_debug_resp_ready; // @[Periphery.scala 157:23:freechips.rocketchip.system.DefaultFPGAConfig.fir@194711.4]
  wire  SimDTM_debug_resp_valid; // @[Periphery.scala 157:23:freechips.rocketchip.system.DefaultFPGAConfig.fir@194711.4]
  wire [31:0] SimDTM_debug_resp_bits_data; // @[Periphery.scala 157:23:freechips.rocketchip.system.DefaultFPGAConfig.fir@194711.4]
  wire [1:0] SimDTM_debug_resp_bits_resp; // @[Periphery.scala 157:23:freechips.rocketchip.system.DefaultFPGAConfig.fir@194711.4]
  wire  SimDTM_reset; // @[Periphery.scala 157:23:freechips.rocketchip.system.DefaultFPGAConfig.fir@194711.4]
  wire  SimDTM_clk; // @[Periphery.scala 157:23:freechips.rocketchip.system.DefaultFPGAConfig.fir@194711.4]
  //wire  _T_16; // @[Periphery.scala 101:19:freechips.rocketchip.system.DefaultFPGAConfig.fir@194723.4]
  //wire [31:0] _T_17; // @[Periphery.scala 102:59:freechips.rocketchip.system.DefaultFPGAConfig.fir@194725.6]
  //wire  _T_19; // @[Periphery.scala 102:13:freechips.rocketchip.system.DefaultFPGAConfig.fir@194727.6]
  wire clock;
  freq_split freq50m(
    clock100,
    reset,
    clock);
  ExampleRocketSystem dut ( // @[TestHarness.scala 15:19:freechips.rocketchip.system.DefaultFPGAConfig.fir@194665.4]
    .clock(dut_clock),
    .reset(dut_reset),
    .debug_clockeddmi_dmi_req_ready(dut_debug_clockeddmi_dmi_req_ready),
    .debug_clockeddmi_dmi_req_valid(dut_debug_clockeddmi_dmi_req_valid),
    .debug_clockeddmi_dmi_req_bits_addr(dut_debug_clockeddmi_dmi_req_bits_addr),
    .debug_clockeddmi_dmi_req_bits_data(dut_debug_clockeddmi_dmi_req_bits_data),
    .debug_clockeddmi_dmi_req_bits_op(dut_debug_clockeddmi_dmi_req_bits_op),
    .debug_clockeddmi_dmi_resp_ready(dut_debug_clockeddmi_dmi_resp_ready),
    .debug_clockeddmi_dmi_resp_valid(dut_debug_clockeddmi_dmi_resp_valid),
    .debug_clockeddmi_dmi_resp_bits_data(dut_debug_clockeddmi_dmi_resp_bits_data),
    .debug_clockeddmi_dmi_resp_bits_resp(dut_debug_clockeddmi_dmi_resp_bits_resp),
    .debug_clockeddmi_dmiClock(dut_debug_clockeddmi_dmiClock),
    .debug_clockeddmi_dmiReset(dut_debug_clockeddmi_dmiReset),
    .debug_ndreset(dut_debug_ndreset),
    .debug_dmactive(dut_debug_dmactive),
    .interrupts(dut_interrupts),
    .mem_axi4_0_aw_ready(dut_mem_axi4_0_aw_ready),
    .mem_axi4_0_aw_valid(dut_mem_axi4_0_aw_valid),
    .mem_axi4_0_aw_bits_id(dut_mem_axi4_0_aw_bits_id),
    .mem_axi4_0_aw_bits_addr(dut_mem_axi4_0_aw_bits_addr),
    .mem_axi4_0_aw_bits_len(dut_mem_axi4_0_aw_bits_len),
    .mem_axi4_0_aw_bits_size(dut_mem_axi4_0_aw_bits_size),
    .mem_axi4_0_aw_bits_burst(dut_mem_axi4_0_aw_bits_burst),
    .mem_axi4_0_aw_bits_lock(dut_mem_axi4_0_aw_bits_lock),
    .mem_axi4_0_aw_bits_cache(dut_mem_axi4_0_aw_bits_cache),
    .mem_axi4_0_aw_bits_prot(dut_mem_axi4_0_aw_bits_prot),
    .mem_axi4_0_aw_bits_qos(dut_mem_axi4_0_aw_bits_qos),
    .mem_axi4_0_w_ready(dut_mem_axi4_0_w_ready),
    .mem_axi4_0_w_valid(dut_mem_axi4_0_w_valid),
    .mem_axi4_0_w_bits_data(dut_mem_axi4_0_w_bits_data),
    .mem_axi4_0_w_bits_strb(dut_mem_axi4_0_w_bits_strb),
    .mem_axi4_0_w_bits_last(dut_mem_axi4_0_w_bits_last),
    .mem_axi4_0_b_ready(dut_mem_axi4_0_b_ready),
    .mem_axi4_0_b_valid(dut_mem_axi4_0_b_valid),
    .mem_axi4_0_b_bits_id(dut_mem_axi4_0_b_bits_id),
    .mem_axi4_0_b_bits_resp(dut_mem_axi4_0_b_bits_resp),
    .mem_axi4_0_ar_ready(dut_mem_axi4_0_ar_ready),
    .mem_axi4_0_ar_valid(dut_mem_axi4_0_ar_valid),
    .mem_axi4_0_ar_bits_id(dut_mem_axi4_0_ar_bits_id),
    .mem_axi4_0_ar_bits_addr(dut_mem_axi4_0_ar_bits_addr),
    .mem_axi4_0_ar_bits_len(dut_mem_axi4_0_ar_bits_len),
    .mem_axi4_0_ar_bits_size(dut_mem_axi4_0_ar_bits_size),
    .mem_axi4_0_ar_bits_burst(dut_mem_axi4_0_ar_bits_burst),
    .mem_axi4_0_ar_bits_lock(dut_mem_axi4_0_ar_bits_lock),
    .mem_axi4_0_ar_bits_cache(dut_mem_axi4_0_ar_bits_cache),
    .mem_axi4_0_ar_bits_prot(dut_mem_axi4_0_ar_bits_prot),
    .mem_axi4_0_ar_bits_qos(dut_mem_axi4_0_ar_bits_qos),
    .mem_axi4_0_r_ready(dut_mem_axi4_0_r_ready),
    .mem_axi4_0_r_valid(dut_mem_axi4_0_r_valid),
    .mem_axi4_0_r_bits_id(dut_mem_axi4_0_r_bits_id),
    .mem_axi4_0_r_bits_data(dut_mem_axi4_0_r_bits_data),
    .mem_axi4_0_r_bits_resp(dut_mem_axi4_0_r_bits_resp),
    .mem_axi4_0_r_bits_last(dut_mem_axi4_0_r_bits_last),
    .mmio_axi4_0_aw_ready(dut_mmio_axi4_0_aw_ready),
    .mmio_axi4_0_aw_valid(dut_mmio_axi4_0_aw_valid),
    .mmio_axi4_0_aw_bits_id(dut_mmio_axi4_0_aw_bits_id),
    .mmio_axi4_0_aw_bits_addr(dut_mmio_axi4_0_aw_bits_addr),
    .mmio_axi4_0_aw_bits_len(dut_mmio_axi4_0_aw_bits_len),
    .mmio_axi4_0_aw_bits_size(dut_mmio_axi4_0_aw_bits_size),
    .mmio_axi4_0_aw_bits_burst(dut_mmio_axi4_0_aw_bits_burst),
    .mmio_axi4_0_aw_bits_lock(dut_mmio_axi4_0_aw_bits_lock),
    .mmio_axi4_0_aw_bits_cache(dut_mmio_axi4_0_aw_bits_cache),
    .mmio_axi4_0_aw_bits_prot(dut_mmio_axi4_0_aw_bits_prot),
    .mmio_axi4_0_aw_bits_qos(dut_mmio_axi4_0_aw_bits_qos),
    .mmio_axi4_0_w_ready(dut_mmio_axi4_0_w_ready),
    .mmio_axi4_0_w_valid(dut_mmio_axi4_0_w_valid),
    .mmio_axi4_0_w_bits_data(dut_mmio_axi4_0_w_bits_data),
    .mmio_axi4_0_w_bits_strb(dut_mmio_axi4_0_w_bits_strb),
    .mmio_axi4_0_w_bits_last(dut_mmio_axi4_0_w_bits_last),
    .mmio_axi4_0_b_ready(dut_mmio_axi4_0_b_ready),
    .mmio_axi4_0_b_valid(dut_mmio_axi4_0_b_valid),
    .mmio_axi4_0_b_bits_id(dut_mmio_axi4_0_b_bits_id),
    .mmio_axi4_0_b_bits_resp(dut_mmio_axi4_0_b_bits_resp),
    .mmio_axi4_0_ar_ready(dut_mmio_axi4_0_ar_ready),
    .mmio_axi4_0_ar_valid(dut_mmio_axi4_0_ar_valid),
    .mmio_axi4_0_ar_bits_id(dut_mmio_axi4_0_ar_bits_id),
    .mmio_axi4_0_ar_bits_addr(dut_mmio_axi4_0_ar_bits_addr),
    .mmio_axi4_0_ar_bits_len(dut_mmio_axi4_0_ar_bits_len),
    .mmio_axi4_0_ar_bits_size(dut_mmio_axi4_0_ar_bits_size),
    .mmio_axi4_0_ar_bits_burst(dut_mmio_axi4_0_ar_bits_burst),
    .mmio_axi4_0_ar_bits_lock(dut_mmio_axi4_0_ar_bits_lock),
    .mmio_axi4_0_ar_bits_cache(dut_mmio_axi4_0_ar_bits_cache),
    .mmio_axi4_0_ar_bits_prot(dut_mmio_axi4_0_ar_bits_prot),
    .mmio_axi4_0_ar_bits_qos(dut_mmio_axi4_0_ar_bits_qos),
    .mmio_axi4_0_r_ready(dut_mmio_axi4_0_r_ready),
    .mmio_axi4_0_r_valid(dut_mmio_axi4_0_r_valid),
    .mmio_axi4_0_r_bits_id(dut_mmio_axi4_0_r_bits_id),
    .mmio_axi4_0_r_bits_data(dut_mmio_axi4_0_r_bits_data),
    .mmio_axi4_0_r_bits_resp(dut_mmio_axi4_0_r_bits_resp),
    .mmio_axi4_0_r_bits_last(dut_mmio_axi4_0_r_bits_last),
    .l2_frontend_bus_axi4_0_aw_ready(dut_l2_frontend_bus_axi4_0_aw_ready),
    .l2_frontend_bus_axi4_0_aw_valid(dut_l2_frontend_bus_axi4_0_aw_valid),
    .l2_frontend_bus_axi4_0_aw_bits_id(dut_l2_frontend_bus_axi4_0_aw_bits_id),
    .l2_frontend_bus_axi4_0_aw_bits_addr(dut_l2_frontend_bus_axi4_0_aw_bits_addr),
    .l2_frontend_bus_axi4_0_aw_bits_len(dut_l2_frontend_bus_axi4_0_aw_bits_len),
    .l2_frontend_bus_axi4_0_aw_bits_size(dut_l2_frontend_bus_axi4_0_aw_bits_size),
    .l2_frontend_bus_axi4_0_aw_bits_burst(dut_l2_frontend_bus_axi4_0_aw_bits_burst),
    .l2_frontend_bus_axi4_0_aw_bits_lock(dut_l2_frontend_bus_axi4_0_aw_bits_lock),
    .l2_frontend_bus_axi4_0_aw_bits_cache(dut_l2_frontend_bus_axi4_0_aw_bits_cache),
    .l2_frontend_bus_axi4_0_aw_bits_prot(dut_l2_frontend_bus_axi4_0_aw_bits_prot),
    .l2_frontend_bus_axi4_0_aw_bits_qos(dut_l2_frontend_bus_axi4_0_aw_bits_qos),
    .l2_frontend_bus_axi4_0_w_ready(dut_l2_frontend_bus_axi4_0_w_ready),
    .l2_frontend_bus_axi4_0_w_valid(dut_l2_frontend_bus_axi4_0_w_valid),
    .l2_frontend_bus_axi4_0_w_bits_data(dut_l2_frontend_bus_axi4_0_w_bits_data),
    .l2_frontend_bus_axi4_0_w_bits_strb(dut_l2_frontend_bus_axi4_0_w_bits_strb),
    .l2_frontend_bus_axi4_0_w_bits_last(dut_l2_frontend_bus_axi4_0_w_bits_last),
    .l2_frontend_bus_axi4_0_b_ready(dut_l2_frontend_bus_axi4_0_b_ready),
    .l2_frontend_bus_axi4_0_b_valid(dut_l2_frontend_bus_axi4_0_b_valid),
    .l2_frontend_bus_axi4_0_b_bits_id(dut_l2_frontend_bus_axi4_0_b_bits_id),
    .l2_frontend_bus_axi4_0_b_bits_resp(dut_l2_frontend_bus_axi4_0_b_bits_resp),
    .l2_frontend_bus_axi4_0_ar_ready(dut_l2_frontend_bus_axi4_0_ar_ready),
    .l2_frontend_bus_axi4_0_ar_valid(dut_l2_frontend_bus_axi4_0_ar_valid),
    .l2_frontend_bus_axi4_0_ar_bits_id(dut_l2_frontend_bus_axi4_0_ar_bits_id),
    .l2_frontend_bus_axi4_0_ar_bits_addr(dut_l2_frontend_bus_axi4_0_ar_bits_addr),
    .l2_frontend_bus_axi4_0_ar_bits_len(dut_l2_frontend_bus_axi4_0_ar_bits_len),
    .l2_frontend_bus_axi4_0_ar_bits_size(dut_l2_frontend_bus_axi4_0_ar_bits_size),
    .l2_frontend_bus_axi4_0_ar_bits_burst(dut_l2_frontend_bus_axi4_0_ar_bits_burst),
    .l2_frontend_bus_axi4_0_ar_bits_lock(dut_l2_frontend_bus_axi4_0_ar_bits_lock),
    .l2_frontend_bus_axi4_0_ar_bits_cache(dut_l2_frontend_bus_axi4_0_ar_bits_cache),
    .l2_frontend_bus_axi4_0_ar_bits_prot(dut_l2_frontend_bus_axi4_0_ar_bits_prot),
    .l2_frontend_bus_axi4_0_ar_bits_qos(dut_l2_frontend_bus_axi4_0_ar_bits_qos),
    .l2_frontend_bus_axi4_0_r_ready(dut_l2_frontend_bus_axi4_0_r_ready),
    .l2_frontend_bus_axi4_0_r_valid(dut_l2_frontend_bus_axi4_0_r_valid),
    .l2_frontend_bus_axi4_0_r_bits_id(dut_l2_frontend_bus_axi4_0_r_bits_id),
    .l2_frontend_bus_axi4_0_r_bits_data(dut_l2_frontend_bus_axi4_0_r_bits_data),
    .l2_frontend_bus_axi4_0_r_bits_resp(dut_l2_frontend_bus_axi4_0_r_bits_resp),
    .l2_frontend_bus_axi4_0_r_bits_last(dut_l2_frontend_bus_axi4_0_r_bits_last)
  );

  AXIMem mem ( // @[Ports.scala 76:15:freechips.rocketchip.system.DefaultFPGAConfig.fir@194680.4]
    .clock(mem_clock),
    .reset(mem_reset),
    .io_axi4_0_aw_ready(mem_io_axi4_0_aw_ready),
    .io_axi4_0_aw_valid(mem_io_axi4_0_aw_valid),
    .io_axi4_0_aw_bits_id(mem_io_axi4_0_aw_bits_id),
    .io_axi4_0_aw_bits_addr(mem_io_axi4_0_aw_bits_addr),
    .io_axi4_0_aw_bits_len(mem_io_axi4_0_aw_bits_len),
    .io_axi4_0_aw_bits_size(mem_io_axi4_0_aw_bits_size),
    .io_axi4_0_aw_bits_burst(mem_io_axi4_0_aw_bits_burst),
    .io_axi4_0_w_ready(mem_io_axi4_0_w_ready),
    .io_axi4_0_w_valid(mem_io_axi4_0_w_valid),
    .io_axi4_0_w_bits_data(mem_io_axi4_0_w_bits_data),
    .io_axi4_0_w_bits_strb(mem_io_axi4_0_w_bits_strb),
    .io_axi4_0_w_bits_last(mem_io_axi4_0_w_bits_last),
    .io_axi4_0_b_ready(mem_io_axi4_0_b_ready),
    .io_axi4_0_b_valid(mem_io_axi4_0_b_valid),
    .io_axi4_0_b_bits_id(mem_io_axi4_0_b_bits_id),
    .io_axi4_0_b_bits_resp(mem_io_axi4_0_b_bits_resp),
    .io_axi4_0_ar_ready(mem_io_axi4_0_ar_ready),
    .io_axi4_0_ar_valid(mem_io_axi4_0_ar_valid),
    .io_axi4_0_ar_bits_id(mem_io_axi4_0_ar_bits_id),
    .io_axi4_0_ar_bits_addr(mem_io_axi4_0_ar_bits_addr),
    .io_axi4_0_ar_bits_len(mem_io_axi4_0_ar_bits_len),
    .io_axi4_0_ar_bits_size(mem_io_axi4_0_ar_bits_size),
    .io_axi4_0_ar_bits_burst(mem_io_axi4_0_ar_bits_burst),
    .io_axi4_0_r_ready(mem_io_axi4_0_r_ready),
    .io_axi4_0_r_valid(mem_io_axi4_0_r_valid),
    .io_axi4_0_r_bits_id(mem_io_axi4_0_r_bits_id),
    .io_axi4_0_r_bits_data(mem_io_axi4_0_r_bits_data),
    .io_axi4_0_r_bits_resp(mem_io_axi4_0_r_bits_resp),
    .io_axi4_0_r_bits_last(mem_io_axi4_0_r_bits_last)
  );
  
  AXIMmio mmio_mem ( // @[Ports.scala 120:13:freechips.rocketchip.system.DefaultFPGAConfig.fir@194688.4]
    .clock(mmio_mem_clock),
    .reset(mmio_mem_reset),
    .io_axi4_0_aw_ready(mmio_mem_io_axi4_0_aw_ready),
    .io_axi4_0_aw_valid(mmio_mem_io_axi4_0_aw_valid),
    .io_axi4_0_aw_bits_id(mmio_mem_io_axi4_0_aw_bits_id),
    .io_axi4_0_aw_bits_addr(mmio_mem_io_axi4_0_aw_bits_addr),
    .io_axi4_0_aw_bits_len(mmio_mem_io_axi4_0_aw_bits_len),
    .io_axi4_0_aw_bits_size(mmio_mem_io_axi4_0_aw_bits_size),
    .io_axi4_0_aw_bits_burst(mmio_mem_io_axi4_0_aw_bits_burst),
    .io_axi4_0_w_ready(mmio_mem_io_axi4_0_w_ready),
    .io_axi4_0_w_valid(mmio_mem_io_axi4_0_w_valid),
    .io_axi4_0_w_bits_data(mmio_mem_io_axi4_0_w_bits_data),
    .io_axi4_0_w_bits_strb(mmio_mem_io_axi4_0_w_bits_strb),
    .io_axi4_0_w_bits_last(mmio_mem_io_axi4_0_w_bits_last),
    .io_axi4_0_b_ready(mmio_mem_io_axi4_0_b_ready),
    .io_axi4_0_b_valid(mmio_mem_io_axi4_0_b_valid),
    .io_axi4_0_b_bits_id(mmio_mem_io_axi4_0_b_bits_id),
    .io_axi4_0_b_bits_resp(mmio_mem_io_axi4_0_b_bits_resp),
    .io_axi4_0_ar_ready(mmio_mem_io_axi4_0_ar_ready),
    .io_axi4_0_ar_valid(mmio_mem_io_axi4_0_ar_valid),
    .io_axi4_0_ar_bits_id(mmio_mem_io_axi4_0_ar_bits_id),
    .io_axi4_0_ar_bits_addr(mmio_mem_io_axi4_0_ar_bits_addr),
    .io_axi4_0_ar_bits_len(mmio_mem_io_axi4_0_ar_bits_len),
    .io_axi4_0_ar_bits_size(mmio_mem_io_axi4_0_ar_bits_size),
    .io_axi4_0_ar_bits_burst(mmio_mem_io_axi4_0_ar_bits_burst),
    .io_axi4_0_r_ready(mmio_mem_io_axi4_0_r_ready),
    .io_axi4_0_r_valid(mmio_mem_io_axi4_0_r_valid),
    .io_axi4_0_r_bits_id(mmio_mem_io_axi4_0_r_bits_id),
    .io_axi4_0_r_bits_data(mmio_mem_io_axi4_0_r_bits_data),
    .io_axi4_0_r_bits_resp(mmio_mem_io_axi4_0_r_bits_resp),
    .io_axi4_0_r_bits_last(mmio_mem_io_axi4_0_r_bits_last),
    .uart_TX(uart_TX),
    .uart_RX(uart_RX)
  );
  
  DTModule DTM ( // @[Periphery.scala 157:23:freechips.rocketchip.system.DefaultFPGAConfig.fir@194711.4]
    .exit(SimDTM_exit),
    .debug_req_ready(SimDTM_debug_req_ready),
    .debug_req_valid(SimDTM_debug_req_valid),
    .debug_req_bits_addr(SimDTM_debug_req_bits_addr),
    .debug_req_bits_data(SimDTM_debug_req_bits_data),
    .debug_req_bits_op(SimDTM_debug_req_bits_op),
    .debug_resp_ready(SimDTM_debug_resp_ready),
    .debug_resp_valid(SimDTM_debug_resp_valid),
    .debug_resp_bits_data(SimDTM_debug_resp_bits_data),
    .debug_resp_bits_resp(SimDTM_debug_resp_bits_resp),
    .reset(SimDTM_reset),
    .clk(SimDTM_clk)
  );
  
  /*
  assign _T_16 = SimDTM_exit >= 32'h2; // @[Periphery.scala 101:19:freechips.rocketchip.system.DefaultFPGAConfig.fir@194723.4]
  assign _T_17 = SimDTM_exit >> 1'h1; // @[Periphery.scala 102:59:freechips.rocketchip.system.DefaultFPGAConfig.fir@194725.6]
  assign _T_19 = reset == 1'h0; // @[Periphery.scala 102:13:freechips.rocketchip.system.DefaultFPGAConfig.fir@194727.6]
  assign io_success = SimDTM_exit == 32'h1; // @[Periphery.scala 100:15:freechips.rocketchip.system.DefaultFPGAConfig.fir@194722.4]
  */

  assign dut_clock = clock; // @[:freechips.rocketchip.system.DefaultFPGAConfig.fir@194674.4]
  assign dut_reset = reset | dut_debug_ndreset; // @[:freechips.rocketchip.system.DefaultFPGAConfig.fir@194675.4 TestHarness.scala 16:13:freechips.rocketchip.system.DefaultFPGAConfig.fir@194678.4]
  assign dut_interrupts = 2'h0; // @[InterruptBus.scala 68:16:freechips.rocketchip.system.DefaultFPGAConfig.fir@194679.4]
  assign dut_debug_clockeddmi_dmiClock = clock; // @[Periphery.scala 97:20:freechips.rocketchip.system.DefaultFPGAConfig.fir@194719.4]
  assign dut_debug_clockeddmi_dmiReset = reset; // @[Periphery.scala 98:20:freechips.rocketchip.system.DefaultFPGAConfig.fir@194720.4]

  //  ***** debug module *****
  // CR inheritance
  assign SimDTM_reset = reset; // @[Periphery.scala 95:14:freechips.rocketchip.system.DefaultFPGAConfig.fir@194717.4]
  assign SimDTM_clk = clock; // @[Periphery.scala 94:12:freechips.rocketchip.system.DefaultFPGAConfig.fir@194716.4]
  //  drived by outside module
  assign dut_debug_clockeddmi_dmi_req_valid = SimDTM_debug_req_valid; // @[Periphery.scala 96:15:freechips.rocketchip.system.DefaultFPGAConfig.fir@194718.4]
  assign dut_debug_clockeddmi_dmi_req_bits_addr = SimDTM_debug_req_bits_addr; // @[Periphery.scala 96:15:freechips.rocketchip.system.DefaultFPGAConfig.fir@194718.4]
  assign dut_debug_clockeddmi_dmi_req_bits_data = SimDTM_debug_req_bits_data; // @[Periphery.scala 96:15:freechips.rocketchip.system.DefaultFPGAConfig.fir@194718.4]
  assign dut_debug_clockeddmi_dmi_req_bits_op = SimDTM_debug_req_bits_op; // @[Periphery.scala 96:15:freechips.rocketchip.system.DefaultFPGAConfig.fir@194718.4]
  assign dut_debug_clockeddmi_dmi_resp_ready = SimDTM_debug_resp_ready; // @[Periphery.scala 96:15:freechips.rocketchip.system.DefaultFPGAConfig.fir@194718.4]
  //  output to outside module 
  assign SimDTM_debug_req_ready = dut_debug_clockeddmi_dmi_req_ready; // @[Periphery.scala 96:15:freechips.rocketchip.system.DefaultFPGAConfig.fir@194718.4]
  assign SimDTM_debug_resp_valid = dut_debug_clockeddmi_dmi_resp_valid; // @[Periphery.scala 96:15:freechips.rocketchip.system.DefaultFPGAConfig.fir@194718.4]
  assign SimDTM_debug_resp_bits_data = dut_debug_clockeddmi_dmi_resp_bits_data; // @[Periphery.scala 96:15:freechips.rocketchip.system.DefaultFPGAConfig.fir@194718.4]
  assign SimDTM_debug_resp_bits_resp = dut_debug_clockeddmi_dmi_resp_bits_resp; // @[Periphery.scala 96:15:freechips.rocketchip.system.DefaultFPGAConfig.fir@194718.4]

  //  ***** mem module *****
  // CR inheritance
  assign mem_clock = clock; // @[:freechips.rocketchip.system.DefaultFPGAConfig.fir@194685.4]
  assign mem_reset = reset; // @[:freechips.rocketchip.system.DefaultFPGAConfig.fir@194686.4]
  //  drived by outside module
  assign dut_mem_axi4_0_aw_ready = mem_io_axi4_0_aw_ready; // @[Ports.scala 76:41:freechips.rocketchip.system.DefaultFPGAConfig.fir@194687.4]
  assign dut_mem_axi4_0_w_ready = mem_io_axi4_0_w_ready; // @[Ports.scala 76:41:freechips.rocketchip.system.DefaultFPGAConfig.fir@194687.4]
  assign dut_mem_axi4_0_b_valid = mem_io_axi4_0_b_valid; // @[Ports.scala 76:41:freechips.rocketchip.system.DefaultFPGAConfig.fir@194687.4]
  assign dut_mem_axi4_0_b_bits_id = mem_io_axi4_0_b_bits_id; // @[Ports.scala 76:41:freechips.rocketchip.system.DefaultFPGAConfig.fir@194687.4]
  assign dut_mem_axi4_0_b_bits_resp = mem_io_axi4_0_b_bits_resp; // @[Ports.scala 76:41:freechips.rocketchip.system.DefaultFPGAConfig.fir@194687.4]
  assign dut_mem_axi4_0_ar_ready = mem_io_axi4_0_ar_ready; // @[Ports.scala 76:41:freechips.rocketchip.system.DefaultFPGAConfig.fir@194687.4]
  assign dut_mem_axi4_0_r_valid = mem_io_axi4_0_r_valid; // @[Ports.scala 76:41:freechips.rocketchip.system.DefaultFPGAConfig.fir@194687.4]
  assign dut_mem_axi4_0_r_bits_id = mem_io_axi4_0_r_bits_id; // @[Ports.scala 76:41:freechips.rocketchip.system.DefaultFPGAConfig.fir@194687.4]
  assign dut_mem_axi4_0_r_bits_data = mem_io_axi4_0_r_bits_data; // @[Ports.scala 76:41:freechips.rocketchip.system.DefaultFPGAConfig.fir@194687.4]
  assign dut_mem_axi4_0_r_bits_resp = mem_io_axi4_0_r_bits_resp; // @[Ports.scala 76:41:freechips.rocketchip.system.DefaultFPGAConfig.fir@194687.4]
  assign dut_mem_axi4_0_r_bits_last = mem_io_axi4_0_r_bits_last; // @[Ports.scala 76:41:freechips.rocketchip.system.DefaultFPGAConfig.fir@194687.4]
  //  output to outside module 
  assign mem_io_axi4_0_aw_valid = dut_mem_axi4_0_aw_valid; // @[Ports.scala 76:41:freechips.rocketchip.system.DefaultFPGAConfig.fir@194687.4]
  assign mem_io_axi4_0_aw_bits_id = dut_mem_axi4_0_aw_bits_id; // @[Ports.scala 76:41:freechips.rocketchip.system.DefaultFPGAConfig.fir@194687.4]
  assign mem_io_axi4_0_aw_bits_addr = dut_mem_axi4_0_aw_bits_addr[27:0]; // @[Ports.scala 76:41:freechips.rocketchip.system.DefaultFPGAConfig.fir@194687.4]
  assign mem_io_axi4_0_aw_bits_len = dut_mem_axi4_0_aw_bits_len; // @[Ports.scala 76:41:freechips.rocketchip.system.DefaultFPGAConfig.fir@194687.4]
  assign mem_io_axi4_0_aw_bits_size = dut_mem_axi4_0_aw_bits_size; // @[Ports.scala 76:41:freechips.rocketchip.system.DefaultFPGAConfig.fir@194687.4]
  assign mem_io_axi4_0_aw_bits_burst = dut_mem_axi4_0_aw_bits_burst; // @[Ports.scala 76:41:freechips.rocketchip.system.DefaultFPGAConfig.fir@194687.4]
  assign mem_io_axi4_0_w_valid = dut_mem_axi4_0_w_valid; // @[Ports.scala 76:41:freechips.rocketchip.system.DefaultFPGAConfig.fir@194687.4]
  assign mem_io_axi4_0_w_bits_data = dut_mem_axi4_0_w_bits_data; // @[Ports.scala 76:41:freechips.rocketchip.system.DefaultFPGAConfig.fir@194687.4]
  assign mem_io_axi4_0_w_bits_strb = dut_mem_axi4_0_w_bits_strb; // @[Ports.scala 76:41:freechips.rocketchip.system.DefaultFPGAConfig.fir@194687.4]
  assign mem_io_axi4_0_w_bits_last = dut_mem_axi4_0_w_bits_last; // @[Ports.scala 76:41:freechips.rocketchip.system.DefaultFPGAConfig.fir@194687.4]
  assign mem_io_axi4_0_b_ready = dut_mem_axi4_0_b_ready; // @[Ports.scala 76:41:freechips.rocketchip.system.DefaultFPGAConfig.fir@194687.4]
  assign mem_io_axi4_0_ar_valid = dut_mem_axi4_0_ar_valid; // @[Ports.scala 76:41:freechips.rocketchip.system.DefaultFPGAConfig.fir@194687.4]
  assign mem_io_axi4_0_ar_bits_id = dut_mem_axi4_0_ar_bits_id; // @[Ports.scala 76:41:freechips.rocketchip.system.DefaultFPGAConfig.fir@194687.4]
  assign mem_io_axi4_0_ar_bits_addr = dut_mem_axi4_0_ar_bits_addr[27:0]; // @[Ports.scala 76:41:freechips.rocketchip.system.DefaultFPGAConfig.fir@194687.4]
  assign mem_io_axi4_0_ar_bits_len = dut_mem_axi4_0_ar_bits_len; // @[Ports.scala 76:41:freechips.rocketchip.system.DefaultFPGAConfig.fir@194687.4]
  assign mem_io_axi4_0_ar_bits_size = dut_mem_axi4_0_ar_bits_size; // @[Ports.scala 76:41:freechips.rocketchip.system.DefaultFPGAConfig.fir@194687.4]
  assign mem_io_axi4_0_ar_bits_burst = dut_mem_axi4_0_ar_bits_burst; // @[Ports.scala 76:41:freechips.rocketchip.system.DefaultFPGAConfig.fir@194687.4]
  assign mem_io_axi4_0_r_ready = dut_mem_axi4_0_r_ready; // @[Ports.scala 76:41:freechips.rocketchip.system.DefaultFPGAConfig.fir@194687.4]

  //  ***** mmio module *****
  // CR inheritance 
  assign mmio_mem_clock = clock; // @[:freechips.rocketchip.system.DefaultFPGAConfig.fir@194693.4]
  assign mmio_mem_reset = reset; // @[:freechips.rocketchip.system.DefaultFPGAConfig.fir@194694.4]
  //  drived by outside module
  assign dut_mmio_axi4_0_aw_ready = mmio_mem_io_axi4_0_aw_ready; // @[Ports.scala 120:44:freechips.rocketchip.system.DefaultFPGAConfig.fir@194695.4]
  assign dut_mmio_axi4_0_w_ready = mmio_mem_io_axi4_0_w_ready; // @[Ports.scala 120:44:freechips.rocketchip.system.DefaultFPGAConfig.fir@194695.4]
  assign dut_mmio_axi4_0_b_valid = mmio_mem_io_axi4_0_b_valid; // @[Ports.scala 120:44:freechips.rocketchip.system.DefaultFPGAConfig.fir@194695.4]
  assign dut_mmio_axi4_0_b_bits_id = mmio_mem_io_axi4_0_b_bits_id; // @[Ports.scala 120:44:freechips.rocketchip.system.DefaultFPGAConfig.fir@194695.4]
  assign dut_mmio_axi4_0_b_bits_resp = mmio_mem_io_axi4_0_b_bits_resp; // @[Ports.scala 120:44:freechips.rocketchip.system.DefaultFPGAConfig.fir@194695.4]
  assign dut_mmio_axi4_0_ar_ready = mmio_mem_io_axi4_0_ar_ready; // @[Ports.scala 120:44:freechips.rocketchip.system.DefaultFPGAConfig.fir@194695.4]
  assign dut_mmio_axi4_0_r_valid = mmio_mem_io_axi4_0_r_valid; // @[Ports.scala 120:44:freechips.rocketchip.system.DefaultFPGAConfig.fir@194695.4]
  assign dut_mmio_axi4_0_r_bits_id = mmio_mem_io_axi4_0_r_bits_id; // @[Ports.scala 120:44:freechips.rocketchip.system.DefaultFPGAConfig.fir@194695.4]
  assign dut_mmio_axi4_0_r_bits_data = mmio_mem_io_axi4_0_r_bits_data; // @[Ports.scala 120:44:freechips.rocketchip.system.DefaultFPGAConfig.fir@194695.4]
  assign dut_mmio_axi4_0_r_bits_resp = mmio_mem_io_axi4_0_r_bits_resp; // @[Ports.scala 120:44:freechips.rocketchip.system.DefaultFPGAConfig.fir@194695.4]
  assign dut_mmio_axi4_0_r_bits_last = mmio_mem_io_axi4_0_r_bits_last; // @[Ports.scala 120:44:freechips.rocketchip.system.DefaultFPGAConfig.fir@194695.4]
  //  output to outside module 
  assign mmio_mem_io_axi4_0_aw_valid = dut_mmio_axi4_0_aw_valid; // @[Ports.scala 120:44:freechips.rocketchip.system.DefaultFPGAConfig.fir@194695.4]
  assign mmio_mem_io_axi4_0_aw_bits_id = dut_mmio_axi4_0_aw_bits_id; // @[Ports.scala 120:44:freechips.rocketchip.system.DefaultFPGAConfig.fir@194695.4]
  assign mmio_mem_io_axi4_0_aw_bits_addr = dut_mmio_axi4_0_aw_bits_addr[11:0]; // @[Ports.scala 120:44:freechips.rocketchip.system.DefaultFPGAConfig.fir@194695.4]
  assign mmio_mem_io_axi4_0_aw_bits_len = dut_mmio_axi4_0_aw_bits_len; // @[Ports.scala 120:44:freechips.rocketchip.system.DefaultFPGAConfig.fir@194695.4]
  assign mmio_mem_io_axi4_0_aw_bits_size = dut_mmio_axi4_0_aw_bits_size; // @[Ports.scala 120:44:freechips.rocketchip.system.DefaultFPGAConfig.fir@194695.4]
  assign mmio_mem_io_axi4_0_aw_bits_burst = dut_mmio_axi4_0_aw_bits_burst; // @[Ports.scala 120:44:freechips.rocketchip.system.DefaultFPGAConfig.fir@194695.4]
  assign mmio_mem_io_axi4_0_w_valid = dut_mmio_axi4_0_w_valid; // @[Ports.scala 120:44:freechips.rocketchip.system.DefaultFPGAConfig.fir@194695.4]
  assign mmio_mem_io_axi4_0_w_bits_data = dut_mmio_axi4_0_w_bits_data; // @[Ports.scala 120:44:freechips.rocketchip.system.DefaultFPGAConfig.fir@194695.4]
  assign mmio_mem_io_axi4_0_w_bits_strb = dut_mmio_axi4_0_w_bits_strb; // @[Ports.scala 120:44:freechips.rocketchip.system.DefaultFPGAConfig.fir@194695.4]
  assign mmio_mem_io_axi4_0_w_bits_last = dut_mmio_axi4_0_w_bits_last; // @[Ports.scala 120:44:freechips.rocketchip.system.DefaultFPGAConfig.fir@194695.4]
  assign mmio_mem_io_axi4_0_b_ready = dut_mmio_axi4_0_b_ready; // @[Ports.scala 120:44:freechips.rocketchip.system.DefaultFPGAConfig.fir@194695.4]
  assign mmio_mem_io_axi4_0_ar_valid = dut_mmio_axi4_0_ar_valid; // @[Ports.scala 120:44:freechips.rocketchip.system.DefaultFPGAConfig.fir@194695.4]
  assign mmio_mem_io_axi4_0_ar_bits_id = dut_mmio_axi4_0_ar_bits_id; // @[Ports.scala 120:44:freechips.rocketchip.system.DefaultFPGAConfig.fir@194695.4]
  assign mmio_mem_io_axi4_0_ar_bits_addr = dut_mmio_axi4_0_ar_bits_addr[11:0]; // @[Ports.scala 120:44:freechips.rocketchip.system.DefaultFPGAConfig.fir@194695.4]
  assign mmio_mem_io_axi4_0_ar_bits_len = dut_mmio_axi4_0_ar_bits_len; // @[Ports.scala 120:44:freechips.rocketchip.system.DefaultFPGAConfig.fir@194695.4]
  assign mmio_mem_io_axi4_0_ar_bits_size = dut_mmio_axi4_0_ar_bits_size; // @[Ports.scala 120:44:freechips.rocketchip.system.DefaultFPGAConfig.fir@194695.4]
  assign mmio_mem_io_axi4_0_ar_bits_burst = dut_mmio_axi4_0_ar_bits_burst; // @[Ports.scala 120:44:freechips.rocketchip.system.DefaultFPGAConfig.fir@194695.4]
  assign mmio_mem_io_axi4_0_r_ready = dut_mmio_axi4_0_r_ready; // @[Ports.scala 120:44:freechips.rocketchip.system.DefaultFPGAConfig.fir@194695.4]

  //  ***** l2 frontend define - constant *****
  assign dut_l2_frontend_bus_axi4_0_aw_valid = 1'h0; // @[Bundles.scala 85:18:freechips.rocketchip.system.DefaultFPGAConfig.fir@194697.4]
  assign dut_l2_frontend_bus_axi4_0_aw_bits_id = 8'h0;
  assign dut_l2_frontend_bus_axi4_0_aw_bits_addr = 32'h0;
  assign dut_l2_frontend_bus_axi4_0_aw_bits_len = 8'h0;
  assign dut_l2_frontend_bus_axi4_0_aw_bits_size = 3'h0;
  assign dut_l2_frontend_bus_axi4_0_aw_bits_burst = 2'h0;
  assign dut_l2_frontend_bus_axi4_0_aw_bits_lock = 1'h0;
  assign dut_l2_frontend_bus_axi4_0_aw_bits_cache = 4'h0;
  assign dut_l2_frontend_bus_axi4_0_aw_bits_prot = 3'h0;
  assign dut_l2_frontend_bus_axi4_0_aw_bits_qos = 4'h0;
  assign dut_l2_frontend_bus_axi4_0_w_valid = 1'h0; // @[Bundles.scala 86:18:freechips.rocketchip.system.DefaultFPGAConfig.fir@194698.4]
  assign dut_l2_frontend_bus_axi4_0_w_bits_data = 64'h0;
  assign dut_l2_frontend_bus_axi4_0_w_bits_strb = 8'h0;
  assign dut_l2_frontend_bus_axi4_0_w_bits_last = 1'h0;
  assign dut_l2_frontend_bus_axi4_0_b_ready = 1'h0; // @[Bundles.scala 88:18:freechips.rocketchip.system.DefaultFPGAConfig.fir@194700.4]
  assign dut_l2_frontend_bus_axi4_0_ar_valid = 1'h0; // @[Bundles.scala 84:18:freechips.rocketchip.system.DefaultFPGAConfig.fir@194696.4]
  assign dut_l2_frontend_bus_axi4_0_ar_bits_id = 8'h0;
  assign dut_l2_frontend_bus_axi4_0_ar_bits_addr = 32'h0;
  assign dut_l2_frontend_bus_axi4_0_ar_bits_len = 8'h0;
  assign dut_l2_frontend_bus_axi4_0_ar_bits_size = 3'h0;
  assign dut_l2_frontend_bus_axi4_0_ar_bits_burst = 2'h0;
  assign dut_l2_frontend_bus_axi4_0_ar_bits_lock = 1'h0;
  assign dut_l2_frontend_bus_axi4_0_ar_bits_cache = 4'h0;
  assign dut_l2_frontend_bus_axi4_0_ar_bits_prot = 3'h0;
  assign dut_l2_frontend_bus_axi4_0_ar_bits_qos = 4'h0;
  assign dut_l2_frontend_bus_axi4_0_r_ready = 1'h0; // @[Bundles.scala 87:18:freechips.rocketchip.system.DefaultFPGAConfig.fir@194699.4]

  /*
  always @(posedge clock) begin
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_T_16 & _T_19) begin
          $fwrite(32'h80000002,"*** FAILED *** (exit code = %d)\n",_T_17); // @[Periphery.scala 102:13:freechips.rocketchip.system.DefaultFPGAConfig.fir@194729.8]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (_T_16 & _T_19) begin
          $fatal; // @[Periphery.scala 103:11:freechips.rocketchip.system.DefaultFPGAConfig.fir@194734.8]
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
  end
  */
endmodule //end of top

module freq_split(
    clock_in,
    reset,
    clock_out
);
    input clock_in;
    input reset;
    output clock_out;
    reg clock_out;
    
    always @(posedge clock_in) 
        begin
            if(reset)
                clock_out <= 1'b0;
            else 
                clock_out <= ~clock_out;
        end
endmodule