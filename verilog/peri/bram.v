module bram(
	input clock,
	input resetn,
	//full axi4 port from crossbar
    output        bram_axi4_aw_ready, 
    input         bram_axi4_aw_valid, 
    input  [3:0]  bram_axi4_aw_id, 
    input  [30:0] bram_axi4_aw_addr, 
    input  [7:0]  bram_axi4_aw_len, 
    input  [2:0]  bram_axi4_aw_size, 
    input  [1:0]  bram_axi4_aw_burst, 
    output        bram_axi4_w_ready, 
    input         bram_axi4_w_valid, 
    input  [63:0] bram_axi4_w_data, 
    input  [7:0]  bram_axi4_w_strb, 
    input         bram_axi4_w_last, 
    input         bram_axi4_b_ready, 
    output        bram_axi4_b_valid, 
    output [3:0]  bram_axi4_b_id, 
    output [1:0]  bram_axi4_b_resp, 
    output        bram_axi4_ar_ready, 
    input         bram_axi4_ar_valid, 
    input  [3:0]  bram_axi4_ar_id, 
    input  [30:0] bram_axi4_ar_addr, 
    input  [7:0]  bram_axi4_ar_len, 
    input  [2:0]  bram_axi4_ar_size, 
    input  [1:0]  bram_axi4_ar_burst, 
    input         bram_axi4_r_ready, 
    output        bram_axi4_r_valid, 
    output [3:0]  bram_axi4_r_id, 
    output [63:0] bram_axi4_r_data, 
    output [1:0]  bram_axi4_r_resp, 
    output        bram_axi4_r_last
	);
//  BRAM & controller seperate design,
	wire	[15:0] bram_addr;
	wire	[63:0] bram_rdata;
	wire    [63:0] bram_wdata;
	wire    [7:0] bram_we_perbyte;
	wire	bram_clk;
	wire    bram_en;

	bram_storage bram_storage_inst(
		.clock(bram_clk),
	    // address-width should be transformed form Byte/addr to 64bits/index, jsut omit the lower 3 bits.
		.addr(bram_addr[15:3]),
		.rdata(bram_rdata),
        .wdata(bram_wdata),
        .we_perbyte(bram_we_perbyte),
        .en(bram_en)
		);

	//init bram with boot program

	axi_bram_ctrl_0 bram_ctrl_inst(
		.s_axi_aclk(clock),
		.s_axi_aresetn(resetn),

		.s_axi_awready(bram_axi4_aw_ready),
		.s_axi_awvalid(bram_axi4_aw_valid),
		.s_axi_awid(bram_axi4_aw_id),
		.s_axi_awaddr(bram_axi4_aw_addr[15:0]),
		.s_axi_awlen(bram_axi4_aw_len),
		.s_axi_awsize(bram_axi4_aw_size),
		.s_axi_awburst(bram_axi4_aw_burst),
		.s_axi_wready(bram_axi4_w_ready),
		.s_axi_wvalid(bram_axi4_w_valid),
		.s_axi_wdata(bram_axi4_w_data),
		.s_axi_wstrb(bram_axi4_w_strb),
		.s_axi_wlast(bram_axi4_w_last),
		.s_axi_bready(bram_axi4_b_ready),
		.s_axi_bvalid(bram_axi4_b_valid),
		.s_axi_bid(bram_axi4_b_id),
		.s_axi_bresp(bram_axi4_b_resp),
		.s_axi_arready(bram_axi4_ar_ready),
		.s_axi_arvalid(bram_axi4_ar_valid),
		.s_axi_arid(bram_axi4_ar_id),
		.s_axi_araddr(bram_axi4_ar_addr[15:0]),
		.s_axi_arlen(bram_axi4_ar_len),
		.s_axi_arsize(bram_axi4_ar_size),
		.s_axi_arburst(bram_axi4_ar_burst),
		.s_axi_rready(bram_axi4_r_ready),
		.s_axi_rvalid(bram_axi4_r_valid),
		.s_axi_rid(bram_axi4_r_id),
		.s_axi_rdata(bram_axi4_r_data),
		.s_axi_rresp(bram_axi4_r_resp),
		.s_axi_rlast(bram_axi4_r_last),

	// bram interface, use as ROM no need of ctrl signal
		.bram_addr_a(bram_addr),
		.bram_clk_a(bram_clk),
		.bram_rddata_a(bram_rdata),
		.bram_wrdata_a(bram_wdata),
		.bram_we_a(bram_we_perbyte),
		.bram_en_a(bram_en)

		);

endmodule