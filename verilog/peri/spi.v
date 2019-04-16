module spi(
	input         clock,
	input         resetn,
	//full axi4 port from crossbar
    output        spi_axi4_aw_ready, 
    input         spi_axi4_aw_valid, 
    input  [3:0]  spi_axi4_aw_id, 
    input  [30:0] spi_axi4_aw_addr, 
    input  [7:0]  spi_axi4_aw_len, 
    input  [2:0]  spi_axi4_aw_size, 
    input  [1:0]  spi_axi4_aw_burst, 
    output        spi_axi4_w_ready, 
    input         spi_axi4_w_valid, 
    input  [63:0] spi_axi4_w_data, 
    input  [7:0]  spi_axi4_w_strb, 
    input         spi_axi4_w_last, 
    input         spi_axi4_b_ready, 
    output        spi_axi4_b_valid, 
    output [3:0]  spi_axi4_b_id, 
    output [1:0]  spi_axi4_b_resp, 
    output        spi_axi4_ar_ready, 
    input         spi_axi4_ar_valid, 
    input  [3:0]  spi_axi4_ar_id, 
    input  [30:0] spi_axi4_ar_addr, 
    input  [7:0]  spi_axi4_ar_len, 
    input  [2:0]  spi_axi4_ar_size, 
    input  [1:0]  spi_axi4_ar_burst, 
    input         spi_axi4_r_ready, 
    output        spi_axi4_r_valid, 
    output [3:0]  spi_axi4_r_id, 
    output [63:0] spi_axi4_r_data, 
    output [1:0]  spi_axi4_r_resp, 
    output        spi_axi4_r_last,
    // get axi4 and send out spi to sd card
    inout 		  spi_miso,
    inout		  spi_mosi,
    inout 		  spi_sclock,
    inout		  spi_cs,
    output reg    sd_poweroff,
    
    output        interrupt
);

// always use a axi-lite to w/r the register configuree
    wire   [3:0]  spi_lite_ar_id;    
    wire   [6:0]  spi_lite_ar_addr;  
    wire          spi_lite_ar_valid; 
    wire          spi_lite_ar_ready; 
    wire   [3:0]  spi_lite_r_id;     
    wire   [31:0] spi_lite_r_data;   
    wire   [1:0]  spi_lite_r_resp;   
    wire          spi_lite_r_valid;  
    wire          spi_lite_r_ready;  
    wire   [3:0]  spi_lite_aw_id;    
    wire   [6:0]  spi_lite_aw_addr;  
    wire          spi_lite_aw_valid; 
    wire          spi_lite_aw_ready; 
    wire   [31:0] spi_lite_w_data;   
    wire   [3:0]  spi_lite_w_strb;   
    wire          spi_lite_w_valid;  
    wire          spi_lite_w_ready;  
    wire   [3:0]  spi_lite_b_id;     
    wire   [1:0]  spi_lite_b_resp;   
    wire          spi_lite_b_valid;  
    wire          spi_lite_b_ready;  
    
    wire [3:0]    spi_axi4_w_strb_half;
    wire [31:0]   spi_axi4_w_data_half;
    wire [31:0]   spi_axi4_r_data_half; 
    
    narrower spi_narrower(
        .r_data_64  (spi_axi4_r_data),
        .w_data_64  (spi_axi4_w_data),
        .w_strb_8   (spi_axi4_w_strb),
        .r_data_32  (spi_axi4_r_data_half),
        .w_data_32  (spi_axi4_w_data_half),
        .w_strb_4   (spi_axi4_w_strb_half)
    );
    
    
    nasti_lite_bridge #(    
        .MAX_TRANSACTION(1),        // maximal number of parallel write transactions
        .ID_WIDTH(4),               // id width
        .ADDR_WIDTH(7),             // address width
        .NASTI_DATA_WIDTH(32),      // width of data on the nasti side
        .LITE_DATA_WIDTH(32),       // width of data on the nasti-lite side
        .USER_WIDTH(1)    
    )
    bridge_inst_SPI 
    (
        .clk    (clock),
        .rstn   (resetn),
        .lite_slave_ar_id          (spi_lite_ar_id    ),
        .lite_slave_ar_addr        (spi_lite_ar_addr  ),
        .lite_slave_ar_valid       (spi_lite_ar_valid ),
        .lite_slave_ar_ready       (spi_lite_ar_ready ),
        .lite_slave_r_id           (spi_lite_r_id     ),
        .lite_slave_r_data         (spi_lite_r_data   ),
        .lite_slave_r_resp         (spi_lite_r_resp   ),
        .lite_slave_r_valid        (spi_lite_r_valid  ),
        .lite_slave_r_ready        (spi_lite_r_ready  ),
        .lite_slave_aw_id          (spi_lite_aw_id    ),
        .lite_slave_aw_addr        (spi_lite_aw_addr  ),
        .lite_slave_aw_valid       (spi_lite_aw_valid ),
        .lite_slave_aw_ready       (spi_lite_aw_ready ),
        .lite_slave_w_data         (spi_lite_w_data   ),
        .lite_slave_w_strb         (spi_lite_w_strb   ),
        .lite_slave_w_valid        (spi_lite_w_valid  ),
        .lite_slave_w_ready        (spi_lite_w_ready  ),
        .lite_slave_b_id           (spi_lite_b_id     ),
        .lite_slave_b_resp         (spi_lite_b_resp   ),
        .lite_slave_b_valid        (spi_lite_b_valid  ),
        .lite_slave_b_ready        (spi_lite_b_ready  ),
         //// ATTENTION this may cause problems
        .nasti_master_ar_id        (spi_axi4_ar_id    ),   
        .nasti_master_ar_addr      (spi_axi4_ar_addr[6:0]   ),   
        .nasti_master_ar_len       (spi_axi4_ar_len   ),   
        .nasti_master_ar_size      (spi_axi4_ar_size  ),   
        .nasti_master_ar_burst     (spi_axi4_ar_burst ),  
        .nasti_master_ar_valid     (spi_axi4_ar_valid ),   
        .nasti_master_ar_ready     (spi_axi4_ar_ready ),   
        .nasti_master_r_id         (spi_axi4_r_id     ),   
        .nasti_master_r_data       (spi_axi4_r_data_half   ),    
        .nasti_master_r_resp       (spi_axi4_r_resp   ),   
        .nasti_master_r_last       (spi_axi4_r_last   ),   
        .nasti_master_r_valid      (spi_axi4_r_valid  ),   
        .nasti_master_r_ready      (spi_axi4_r_ready  ),
        .nasti_master_aw_id        (spi_axi4_aw_id    ),
        .nasti_master_aw_addr      (spi_axi4_aw_addr[6:0]   ),  
        .nasti_master_aw_len       (spi_axi4_aw_len   ),
        .nasti_master_aw_size      (spi_axi4_aw_size  ),
        .nasti_master_aw_burst     (spi_axi4_aw_burst ),
        .nasti_master_aw_valid     (spi_axi4_aw_valid ),
        .nasti_master_aw_ready     (spi_axi4_aw_ready ),
        .nasti_master_w_data       (spi_axi4_w_data_half    ), //// ATTENTION, this may cause problems, but it seems that AXI will copy the lower 32 bit data to the higher 32 ones, when send a 32bit data to 64bit bus
        .nasti_master_w_strb       (spi_axi4_w_strb_half    ),  
        .nasti_master_w_last       (spi_axi4_w_last   ),
        .nasti_master_w_valid      (spi_axi4_w_valid  ),
        .nasti_master_w_ready      (spi_axi4_w_ready  ),
        .nasti_master_b_id         (spi_axi4_b_id     ),
        .nasti_master_b_resp       (spi_axi4_b_resp   ),
        .nasti_master_b_valid      (spi_axi4_b_valid  ),
        .nasti_master_b_ready      (spi_axi4_b_ready  )
    );

// SD  Power Control, the SPI IP cannot control the power on/off of the SD, so we add a logic tackling with it
    // NOTICE here we use 0x00 as the power controller register of SD card (not for SPI ip core
    parameter POWER_CTRL_REG = 7'b0000000;     
    
    // the following part is in the reference of ************************the lowrisc v0.2********************** 
    wire          write_power_ctrl_cmd; 
    wire          read_power_ctrl_cmd;
    assign write_power_ctrl_cmd = (spi_lite_aw_addr == POWER_CTRL_REG) && spi_lite_aw_valid;       
    assign read_power_ctrl_cmd = (spi_lite_ar_addr == POWER_CTRL_REG) && spi_lite_ar_valid;  

    reg           write_selected; // "hold-on" signal during the command period
    reg           read_selected;
    always @(posedge clock or negedge resetn) begin
        if (!resetn)
            read_selected <= 0;
        else if (read_power_ctrl_cmd)
            read_selected <= 1;
        else if (spi_lite_r_valid && spi_lite_r_ready)
            read_selected <= 0;
    end

    always @(posedge clock or negedge resetn) begin
        if (!resetn)
            write_selected <= 0;
        else if (write_power_ctrl_cmd)
            write_selected <= 1;
        else if (spi_lite_b_valid && spi_lite_b_ready)
            write_selected <= 0;
    end

    always @(posedge clock or negedge resetn) begin
        if (!resetn)
            sd_poweroff <= 1;
        else if (write_selected && spi_lite_w_ready && spi_lite_w_valid)
            sd_poweroff <= spi_lite_w_strb & 1'b1 ? spi_lite_w_data & 8'hff : sd_poweroff; // to poweron when we write 0x00 into POWER_CTRL_REG 
    end

    // the following are the exact axi-lite signal sent to the SPI IP
    wire   [6:0]  exact_spi_lite_ar_addr;    //input to ip
    wire          exact_spi_lite_ar_valid;   //input to ip
    wire          exact_spi_lite_ar_ready;   //output from ip
    wire   [31:0] exact_spi_lite_r_data;     //output from ip
    wire   [1:0]  exact_spi_lite_r_resp;     //output from ip
    wire          exact_spi_lite_r_valid;    //output from ip
    wire          exact_spi_lite_r_ready;    //input to ip
    wire   [6:0]  exact_spi_lite_aw_addr;    //input to ip
    wire          exact_spi_lite_aw_valid;   //input to ip
    wire          exact_spi_lite_aw_ready;   //output from ip
    wire   [31:0] exact_spi_lite_w_data;     //input to ip
    wire   [3:0]  exact_spi_lite_w_strb;     //input to ip
    wire          exact_spi_lite_w_valid;    //input to ip
    wire          exact_spi_lite_w_ready;    //output from ip
    wire   [1:0]  exact_spi_lite_b_resp;     //output from ip
    wire          exact_spi_lite_b_valid;    //output from ip
    wire          exact_spi_lite_b_ready;    //input to ip

    assign exact_spi_lite_ar_addr   = spi_lite_ar_addr;    //input to ip
    assign exact_spi_lite_ar_valid  = spi_lite_ar_valid && !read_power_ctrl_cmd;   //input to ip

    assign exact_spi_lite_r_ready   = read_selected ? 0 : spi_lite_r_ready;    //input to ip
    
    assign exact_spi_lite_aw_addr   = spi_lite_aw_addr;    //input to ip
    assign exact_spi_lite_aw_valid  = spi_lite_aw_valid && !write_power_ctrl_cmd;   //input to ip
    
    assign exact_spi_lite_w_data    = spi_lite_w_data;     //input to ip
    assign exact_spi_lite_w_strb    = spi_lite_w_strb;     //input to ip
    assign exact_spi_lite_w_valid   = spi_lite_w_valid && !write_selected;    //input to ip
    
    assign exact_spi_lite_b_ready   = write_selected ? 0 : spi_lite_b_ready;    //input to ip
    //
    assign spi_lite_ar_ready  = exact_spi_lite_ar_ready || read_power_ctrl_cmd;   //output from ip

    assign spi_lite_r_data    = read_selected ? sd_poweroff : exact_spi_lite_r_data;     //output from ip
    assign spi_lite_r_resp    = read_selected ? 0 : exact_spi_lite_r_resp;     //output from ip
    assign spi_lite_r_valid   = exact_spi_lite_r_valid || read_selected;    //output from ip

    assign spi_lite_aw_ready  = exact_spi_lite_aw_ready || write_power_ctrl_cmd;   //output from ip

    assign spi_lite_w_ready   = exact_spi_lite_w_ready || write_selected;    //output from ip

    assign spi_lite_b_resp    = write_selected ? 0 : exact_spi_lite_b_resp;     //output from ip
    assign spi_lite_b_valid   = exact_spi_lite_b_valid || write_selected;    //output from ip


//  Instance the spi controller IP
    //  connect tri-state gate to the pin IO
    wire          spi_mosi_i, spi_mosi_o, spi_mosi_t;
    wire          spi_miso_i, spi_miso_o, spi_miso_t;
    wire          spi_sclock_i, spi_sclock_o, spi_sclock_t;
    wire          spi_cs_i, spi_cs_o, spi_cs_t;

    axi_quad_spi_0 axi_spi_inst(
        .s_axi_aclk     (clock),
        .s_axi_aresetn  (resetn),

        .s_axi_awready  (exact_spi_lite_aw_ready),
        .s_axi_awvalid  (exact_spi_lite_aw_valid),
        .s_axi_awaddr   (exact_spi_lite_aw_addr[6:0]),
        .s_axi_wready   (exact_spi_lite_w_ready),
        .s_axi_wvalid   (exact_spi_lite_w_valid),
        .s_axi_wdata    (exact_spi_lite_w_data[31:0]),
        .s_axi_wstrb    (exact_spi_lite_w_strb[3:0]),  // need to be reconsidered
        .s_axi_bready   (exact_spi_lite_b_ready),
        .s_axi_bvalid   (exact_spi_lite_b_valid),
        .s_axi_bresp    (exact_spi_lite_b_resp),
        .s_axi_arready  (exact_spi_lite_ar_ready),
        .s_axi_arvalid  (exact_spi_lite_ar_valid),
        .s_axi_araddr   (exact_spi_lite_ar_addr[6:0]),
        .s_axi_rready   (exact_spi_lite_r_ready),
        .s_axi_rvalid   (exact_spi_lite_r_valid),
        .s_axi_rdata    (exact_spi_lite_r_data[31:0]),
        .s_axi_rresp    (exact_spi_lite_r_resp),

        .io0_i          (spi_mosi_i  ),
        .io0_o          (spi_mosi_o  ),
        .io0_t          (spi_mosi_t  ),
        .io1_i          (spi_miso_i  ),
        .io1_o          (spi_miso_o  ),
        .io1_t          (spi_miso_t  ),
        .sck_i          (spi_sclock_i  ),
        .sck_o          (spi_sclock_o  ),
        .sck_t          (spi_sclock_t  ),
        .ss_i           (spi_cs_i   ),
        .ss_o           (spi_cs_o   ),
        .ss_t           (spi_cs_t   ),
        .ext_spi_clk    (clock  ),
        .ip2intc_irpt   (interrupt)

    );

    assign spi_mosi = !spi_mosi_t ? spi_mosi_o : 1'bz;
    assign spi_mosi_i = 1'b1 ;  // this pin is only for output

    assign spi_miso = !spi_miso_t ? spi_miso_o : 1'bz;
    assign spi_miso_i = spi_miso; // for both input and output, a tri-state gate
    
    assign spi_sclock = !spi_sclock_t ? spi_sclock_o : 1'bz;
    assign spi_sclock_i = 1'b1 ;  // this pin is only for output
    
    assign spi_cs = !spi_cs_t ? spi_cs_o : 1'bz;
    assign spi_cs_i = 1'b1 ;  // this pin is only for output

    
endmodule 