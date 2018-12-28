-makelib ies/xil_defaultlib -sv \
  "/opt/Xilinx/Vivado/2017.1/data/ip/xpm/xpm_cdc/hdl/xpm_cdc.sv" \
-endlib
-makelib ies/xpm \
  "/opt/Xilinx/Vivado/2017.1/data/ip/xpm/xpm_VCOMP.vhd" \
-endlib
-makelib ies/axi_lite_ipif_v3_0_4 \
  "../../../ipstatic/hdl/axi_lite_ipif_v3_0_vh_rfs.vhd" \
-endlib
-makelib ies/lib_pkg_v1_0_2 \
  "../../../ipstatic/hdl/lib_pkg_v1_0_rfs.vhd" \
-endlib
-makelib ies/lib_srl_fifo_v1_0_2 \
  "../../../ipstatic/hdl/lib_srl_fifo_v1_0_rfs.vhd" \
-endlib
-makelib ies/lib_cdc_v1_0_2 \
  "../../../ipstatic/hdl/lib_cdc_v1_0_rfs.vhd" \
-endlib
-makelib ies/axi_uartlite_v2_0_16 \
  "../../../ipstatic/hdl/axi_uartlite_v2_0_vh_rfs.vhd" \
-endlib
-makelib ies/xil_defaultlib \
  "../../../../rocket_v0.1.srcs/sources_1/ip/axi_uartlite_0/sim/axi_uartlite_0.vhd" \
-endlib
-makelib ies/xil_defaultlib \
  glbl.v
-endlib

