set mem_data_width {64}
set io_data_width {32}
set axi_id_width {8}

set base_dir "."

set project_name nexys4ddr
set CONFIG DefaultNexys4DDRConfig

# Set the directory path for the original project from where this script was exported
set orig_proj_dir [file normalize $base_dir/$project_name]

# Create project
create_project $project_name $base_dir/$project_name

# Set the directory path for the new project
set proj_dir [get_property directory [current_project]]

# Set project properties
set obj [get_projects $project_name]
set_property "default_lib" "xil_defaultlib" $obj
set_property "part" "xc7a100tcsg324-1" $obj

# Create 'sources_1' fileset (if not found)
if {[string equal [get_filesets -quiet sources_1] ""]} {
  create_fileset -srcset sources_1
}

# Set 'sources_1' fileset object
set files [list \
               [file normalize $base_dir/verilog/utils/nasti_lite_bridge/nasti_request.vh ] \
               [file normalize $base_dir/verilog/utils/nasti_lite_bridge/nasti_lite_writer.sv ] \
               [file normalize $base_dir/verilog/utils/nasti_lite_bridge/nasti_lite_reader.sv ] \
               [file normalize $base_dir/verilog/utils/nasti_lite_bridge/nasti_lite_bridge.sv ] \
               [file normalize $base_dir/verilog/utils/plusarg_reader.v ] \
               [file normalize $base_dir/verilog/utils/EICG_wrapper.v ] \
               [file normalize $base_dir/verilog/utils/AsyncResetReg.v ] \
               [file normalize $base_dir/verilog/utils/sram_modified.v ] \
               [file normalize $base_dir/verilog/utils/narrower.v ] \
               [file normalize $base_dir/verilog/peri/bram_storage.v ] \
               [file normalize $base_dir/verilog/peri/uart.v ] \
               [file normalize $base_dir/verilog/peri/spi.v ] \
               [file normalize $base_dir/verilog/peri/bram.v ] \
               [file normalize $base_dir/verilog/peri/DTModule.v ] \
               [file normalize $base_dir/verilog/peri/JtagTunnel.v ] \
               [file normalize $base_dir/verilog/AXIMmio.v ] \
               [file normalize $base_dir/verilog/AXIMem.v ] \
               [file normalize $base_dir/firmware/firmware.hex ] \
               [file normalize $base_dir/verilog/chip_top.v ] \
               [file normalize $base_dir/rocket-chip/vsim/generated-src/freechips.rocketchip.system.$CONFIG.v ]
             ]
add_files -norecurse -fileset [get_filesets sources_1] $files
set_property file_type {Memory File} [get_files $base_dir/firmware/firmware.hex ]

# Set 'sources_1' fileset properties
set_property "top" "chip_top" [get_filesets sources_1]

# Clock generators
create_ip -name clk_wiz -vendor xilinx.com -library ip -module_name clk_wiz_0
set_property -dict [list \
                        CONFIG.PRIMITIVE {PLL} \
                        CONFIG.RESET_TYPE {ACTIVE_LOW} \
                        CONFIG.CLKOUT1_REQUESTED_OUT_FREQ {50.000} \
                        CONFIG.CLKOUT1_DRIVES {BUFG} \
                        CONFIG.CLKOUT2_REQUESTED_OUT_FREQ {200.000} \
                        CONFIG.CLKOUT2_DRIVES {BUFG} \
                        CONFIG.CLKOUT2_USED {1}] \
    [get_ips clk_wiz_0]
generate_target {instantiation_template} [get_files $proj_dir/$project_name.srcs/sources_1/ip/clk_wiz_0/clk_wiz_0.xci]

# AXI crossbar
create_ip -name axi_crossbar -vendor xilinx.com -library ip -module_name axi_crossbar_0
set_property -dict [list \
                        CONFIG.NUM_MI {3} \
                        CONFIG.DATA_WIDTH {64} \
                        CONFIG.ADDR_WIDTH {31} \
                        CONFIG.ID_WIDTH {4} \
                        CONFIG.M00_A00_BASE_ADDR {0x0000000060000000} \
                        CONFIG.M01_A00_BASE_ADDR {0x0000000060010000} \
                        CONFIG.M02_A00_BASE_ADDR {0x0000000060020000} \
                        CONFIG.M00_A00_ADDR_WIDTH {13} \
                        CONFIG.M01_A00_ADDR_WIDTH {16} \
                        CONFIG.M02_A00_ADDR_WIDTH {12} ] \
    [get_ips axi_crossbar_0]

#UART
create_ip -name axi_uart16550 -vendor xilinx.com -library ip -module_name axi_uart16550_0
set_property -dict [list \
                        CONFIG.UART_BOARD_INTERFACE {Custom} \
                        CONFIG.C_S_AXI_ACLK_FREQ_HZ_d {50} \
                       ] [get_ips axi_uart16550_0]
generate_target {instantiation_template} \
    [get_files $proj_dir/$project_name.srcs/sources_1/ip/axi_uart16550_0/axi_uart16550_0.xci]

#BRAM Controller
create_ip -name axi_bram_ctrl -vendor xilinx.com -library ip -module_name axi_bram_ctrl_0
set_property -dict [list \
                        CONFIG.DATA_WIDTH 64 \
                        CONFIG.ID_WIDTH 4 \
                        CONFIG.MEM_DEPTH {8192} \
                        CONFIG.PROTOCOL {AXI4} \
                        CONFIG.BMG_INSTANCE {EXTERNAL} \
                        CONFIG.SINGLE_PORT_BRAM {1} \
                        CONFIG.SUPPORTS_NARROW_BURST {1} \
                       ] [get_ips axi_bram_ctrl_0]
generate_target {instantiation_template} \
    [get_files $proj_dir/$project_name.srcs/sources_1/ip/axi_bram_ctrl_0/axi_bram_ctrl_0.xci]

# SPI interface for R/W SD card
create_ip -name axi_quad_spi -vendor xilinx.com -library ip -module_name axi_quad_spi_0
set_property -dict [list \
                        CONFIG.C_USE_STARTUP {0} \
                        CONFIG.C_SCK_RATIO {2} \
                        CONFIG.C_USE_STARTUP_INT {0}] \
    [get_ips axi_quad_spi_0]

# AXI clock converter due to the clock difference
create_ip -name axi_clock_converter -vendor xilinx.com -library ip -module_name axi_clock_converter_0
set_property -dict [list \
                        CONFIG.ADDR_WIDTH {32} \
                        CONFIG.DATA_WIDTH 64 \
                        CONFIG.ID_WIDTH 4 \
                        CONFIG.ACLK_ASYNC {1}] \
    [get_ips axi_clock_converter_0]
generate_target {instantiation_template} [get_files $proj_dir/$project_name.srcs/sources_1/ip/axi_clock_converter_0/axi_clock_converter_0.xci]

# Memory Controller
create_ip -name mig_7series -vendor xilinx.com -library ip -module_name mig_7series_0
set_property CONFIG.XML_INPUT_FILE [file normalize $base_dir/scripts/$project_name.mig.prj] [get_ips mig_7series_0]
generate_target {instantiation_template} \
    [get_files $proj_dir/$project_name.srcs/sources_1/ip/mig_7series_0/mig_7series_0.xci]

# Create 'constrs_1' fileset (if not found)
if {[string equal [get_filesets -quiet constrs_1] ""]} {
  create_fileset -constrset constrs_1
}

# Set 'constrs_1' fileset object
set obj [get_filesets constrs_1]

# Add/Import constrs file and set constrs file properties
set files [list [file normalize "$base_dir/constraints/$project_name.xdc"]]
set file_added [add_files -norecurse -fileset $obj $files]

# generate all IP source code
generate_target all [get_ips]

#some tweaking of optimizations

set_property STEPS.SYNTH_DESIGN.ARGS.FANOUT_LIMIT 128 [get_runs synth_1]
set_property STEPS.SYNTH_DESIGN.ARGS.RETIMING true [get_runs synth_1]
set_property STEPS.SYNTH_DESIGN.ARGS.KEEP_EQUIVALENT_REGISTERS true [get_runs synth_1]

set_property STEPS.OPT_DESIGN.TCL.PRE {} [get_runs impl_1]
set_property STEPS.OPT_DESIGN.ARGS.DIRECTIVE ExploreWithRemap [get_runs impl_1]
set_property STEPS.PLACE_DESIGN.ARGS.DIRECTIVE ExtraPostPlacementOpt [get_runs impl_1]
set_property STEPS.POST_ROUTE_PHYS_OPT_DESIGN.ARGS.DIRECTIVE AggressiveExplore [get_runs impl_1]

# force create the synth_1 path (need to make soft link in Makefile)
launch_runs -scripts_only synth_1
