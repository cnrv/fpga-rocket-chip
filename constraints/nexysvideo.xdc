set_property -dict { PACKAGE_PIN R4    IOSTANDARD LVCMOS33 } [get_ports { clock100 }]; 
create_clock -add -name sys_clk_pin -period 10.00 -waveform {0 5} [get_ports {clock100}];

set_property -dict { PACKAGE_PIN G4   IOSTANDARD LVCMOS15 } [get_ports { buttonresetn }];

set_property -dict { PACKAGE_PIN AA19  IOSTANDARD LVCMOS33 } [get_ports { uart_TX }]; 
set_property -dict { PACKAGE_PIN V18   IOSTANDARD LVCMOS33 } [get_ports { uart_RX }]; 


set_property -dict { PACKAGE_PIN T14   IOSTANDARD LVCMOS33 } [get_ports { LED[0] }]; 
set_property -dict { PACKAGE_PIN T15   IOSTANDARD LVCMOS33 } [get_ports { LED[1] }]; 
set_property -dict { PACKAGE_PIN T16   IOSTANDARD LVCMOS33 } [get_ports { LED[2] }]; 
set_property -dict { PACKAGE_PIN U16   IOSTANDARD LVCMOS33 } [get_ports { LED[3] }]; 
set_property -dict { PACKAGE_PIN V15   IOSTANDARD LVCMOS33 } [get_ports { LED[4] }]; 
set_property -dict { PACKAGE_PIN W16   IOSTANDARD LVCMOS33 } [get_ports { LED[5] }]; 
set_property -dict { PACKAGE_PIN W15   IOSTANDARD LVCMOS33 } [get_ports { LED[6] }]; 
set_property -dict { PACKAGE_PIN Y13   IOSTANDARD LVCMOS33 } [get_ports { LED[7] }]; 

set_property -dict { PACKAGE_PIN V20    IOSTANDARD LVCMOS33 } [get_ports { sd_poweroff }]; 
set_property -dict { PACKAGE_PIN W19    IOSTANDARD LVCMOS33 } [get_ports { spi_sclock }]; 
set_property -dict { PACKAGE_PIN W20    IOSTANDARD LVCMOS33 } [get_ports { spi_mosi }]; 
set_property -dict { PACKAGE_PIN V19    IOSTANDARD LVCMOS33 } [get_ports { spi_miso }]; 
set_property -dict { PACKAGE_PIN U18    IOSTANDARD LVCMOS33 } [get_ports { spi_cs }]; 

create_clock -period 200.000 -name pmod_jtag_tck [get_ports jtag_pmod_tck]
set_property CLOCK_DEDICATED_ROUTE FALSE [get_nets jtag_pmod_tck_IBUF]

set_property -dict { PACKAGE_PIN Y6    IOSTANDARD LVCMOS33 } [get_ports { jtag_pmod_tck }]; # JC1
set_property -dict { PACKAGE_PIN AA6   IOSTANDARD LVCMOS33 } [get_ports { jtag_pmod_tdi }]; # JC2
set_property -dict { PACKAGE_PIN AA8   IOSTANDARD LVCMOS33 } [get_ports { jtag_pmod_tdo }]; # JC3
set_property -dict { PACKAGE_PIN AB8   IOSTANDARD LVCMOS33 } [get_ports { jtag_pmod_tms }]; # JC4

