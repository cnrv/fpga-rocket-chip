`timescale 1ns / 1ps
`define RANDOMIZE_GARBAGE_ASSIGN
`define RANDOMIZE_INVALID_ASSIGN
`define RANDOMIZE_REG_INIT
`define RANDOMIZE_MEM_INIT
`define RANDOMIZE_DELAY 0.002
`define INIT_RANDOM
`define RANDOM 0 

module dut_top_tb ;

	reg clock;
	reg resetn;
    wire uartTX;
    wire uartRX;

//  wire [15:0] ddr_dq;
//  wire  [1:0] ddr_dqs_n;
//  wire  [1:0] ddr_dqs_p;
//  wire [12:0] ddr_addr;
//  wire  [2:0] ddr_ba;
//  wire        ddr_ras_n;
//  wire        ddr_cas_n;
//  wire        ddr_we_n;
//  wire        ddr_ck_n;
//  wire        ddr_ck_p;
//  wire        ddr_cke;
//  wire        ddr_cs_n;
//  wire  [1:0] ddr_dm;
//  wire        ddr_odt;

//  parameter SIM_BYPASS_INIT_CAL = "FAST";

  	chip_top chip_inst(

	 .clock100(clock), 
	 .buttonresetn(resetn),

     .uart_TX(uartTX),
     .uart_RX(uartRX)

//     .ddr_dq(ddr_dq),
//     .ddr_dqs_n(ddr_dqs_n),
//     .ddr_dqs_p(ddr_dqs_p),
//     .ddr_addr(ddr_addr),
//     .ddr_ba(ddr_ba),
//     .ddr_ras_n(ddr_ras_n),
//     .ddr_cas_n(ddr_cas_n),
//     .ddr_we_n(ddr_we_n),
//     .ddr_ck_n(ddr_ck_n),
//     .ddr_ck_p(ddr_ck_p),
//     .ddr_cke(ddr_cke),
//     .ddr_cs_n(ddr_cs_n),
//     .ddr_dm(ddr_dm),
//     .ddr_odt(ddr_odt)

  		);
//     ddr2_model ddr2_model(
//        .ck(ddr_ck_p),
//        .ck_n(ddr_ck_n),
//        .cke(ddr_cke),
//        .cs_n(ddr_cs_n),
//        .ras_n(ddr_ras_n),
//        .cas_n(ddr_cas_n),
//        .we_n(ddr_we_n),
//        .dm_rdqs(ddr_dm),
//        .ba(ddr_ba),
//        .addr(ddr_addr),
//        .dq(ddr_dq),
//        .dqs(ddr_dqs_p),
//        .dqs_n(ddr_dqs_n),
//        .odt(ddr_odt)
//);


  	initial
    	begin 
    	clock =		0 ;
    	#17 resetn = 	0 ;
        #56 resetn = 1 ;
    end

    always
      begin
        #5 clock=~clock;
      end
      
endmodule
