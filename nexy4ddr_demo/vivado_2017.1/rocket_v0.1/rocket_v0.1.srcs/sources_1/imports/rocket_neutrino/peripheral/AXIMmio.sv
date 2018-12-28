 module AXIMmio ( // @[Portsscala 120:13:freechipsrocketchipsystemDefaultFPGAConfigfir@1946884]
    input clock,    //(mmio_clock),
    input reset,    //(mmio_reset),

    input uart_RX,
    output uart_TX,

    output        io_axi4_0_aw_ready, // @[:freechips.rocketchip.system.DefaultFPGAConfig.fir@193230.4]
    input         io_axi4_0_aw_valid, // @[:freechips.rocketchip.system.DefaultFPGAConfig.fir@193230.4]
    input  [3:0]  io_axi4_0_aw_bits_id, // @[:freechips.rocketchip.system.DefaultFPGAConfig.fir@193230.4]
    input  [11:0] io_axi4_0_aw_bits_addr, // @[:freechips.rocketchip.system.DefaultFPGAConfig.fir@193230.4]
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
    input  [11:0] io_axi4_0_ar_bits_addr, // @[:freechips.rocketchip.system.DefaultFPGAConfig.fir@193230.4]
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

    wire interrupt; // interrupt from uart, currently 
    
    // extra axi wires for a complete axi4
    wire            io_axi4_0_aw_bits_lock;
    wire   [3:0]    io_axi4_0_aw_bits_cache;
    wire   [2:0]    io_axi4_0_aw_bits_prot;
    wire   [3:0]    io_axi4_0_aw_bits_qos;
    wire   [3:0]    io_axi4_0_aw_bits_region;
    wire            io_axi4_0_aw_bits_user;
    wire            io_axi4_0_w_bits_user;
    wire            io_axi4_0_ar_bits_lock;
    wire   [3:0]    io_axi4_0_ar_bits_cache;
    wire   [2:0]    io_axi4_0_ar_bits_prot;
    wire   [3:0]    io_axi4_0_ar_bits_qos;
    wire   [3:0]    io_axi4_0_ar_bits_region;
    wire            io_axi4_0_ar_bits_user;
    wire            io_axi4_0_r_bits_user;
    wire            io_axi4_0_b_bits_user; // be driven

    // init extra wires
    assign io_axi4_0_aw_bits_lock   =   0   ;
    assign io_axi4_0_aw_bits_cache  =   0   ;
    assign io_axi4_0_aw_bits_prot   =   0   ;
    assign io_axi4_0_aw_bits_qos    =   0   ;
    assign io_axi4_0_aw_bits_region =   0   ;
    assign io_axi4_0_aw_bits_user   =   0   ;
    assign io_axi4_0_w_bits_user    =   0   ;
    assign io_axi4_0_ar_bits_lock   =   0   ;
    assign io_axi4_0_ar_bits_cache  =   0   ;
    assign io_axi4_0_ar_bits_prot   =   0   ;
    assign io_axi4_0_ar_bits_qos    =   0   ;
    assign io_axi4_0_ar_bits_region =   0   ;
    assign io_axi4_0_ar_bits_user   =   0   ;

    // define converted full lite wires, "//" for redundant wires
    wire            lite_ar_id;          // be driven
    wire    [11:0]  lite_ar_addr;        
    wire    [2:0]   lite_ar_prot;        // be driven
    wire    [3:0]   lite_ar_qos;         // be driven
    wire    [3:0]   lite_ar_region;      // be driven
    wire            lite_ar_user;        // be driven
    wire            lite_ar_valid;       
    wire            lite_ar_ready;  
    wire            lite_r_id;           // =0
    wire    [31:0]  lite_r_data;         
    wire    [1:0]   lite_r_resp;         
    wire            lite_r_user;         // =0
    wire            lite_r_valid;        
    wire            lite_r_ready;             
    wire            lite_aw_id;          //be driven
    wire    [11:0]  lite_aw_addr;        
    wire    [2:0]   lite_aw_prot;        //be driven
    wire    [3:0]   lite_aw_qos;         //be driven
    wire    [3:0]   lite_aw_region;      //be driven
    wire            lite_aw_user;        //be driven
    wire            lite_aw_valid;       
    wire            lite_aw_ready;    
    wire    [31:0]  lite_w_data;         
    wire    [3:0]   lite_w_strb;         
    wire            lite_w_user;         //be driven
    wire            lite_w_valid;        
    wire            lite_w_ready;    
    wire            lite_b_id;           // =0
    wire    [1:0]   lite_b_resp;         
    wire            lite_b_user;         // =0
    wire            lite_b_valid;        
    wire            lite_b_ready;        

    // init extra wires
    assign lite_r_id    =   0   ;
    assign lite_r_user  =   0   ;
    assign lite_b_id    =   0   ;
    assign lite_b_user  =   0   ;

    // bridge, conver axi4_full to lite_full
    nasti_lite_bridge bridge_inst(
    
    .clk    (clock),
    .rstn   (reset),
    .lite_slave_ar_id          (lite_ar_id    ),
    .lite_slave_ar_addr        (lite_ar_addr  ),
    .lite_slave_ar_prot        (lite_ar_prot  ),
    .lite_slave_ar_qos         (lite_ar_qos   ),
    .lite_slave_ar_region      (lite_ar_region),
    .lite_slave_ar_user        (lite_ar_user  ),
    .lite_slave_ar_valid       (lite_ar_valid ),
    .lite_slave_ar_ready       (lite_ar_ready ),
    .lite_slave_r_id           (lite_r_id     ),
    .lite_slave_r_data         (lite_r_data   ),
    .lite_slave_r_resp         (lite_r_resp   ),
    .lite_slave_r_user         (lite_r_user   ),
    .lite_slave_r_valid        (lite_r_valid  ),
    .lite_slave_r_ready        (lite_r_ready  ),
    .lite_slave_aw_id          (lite_aw_id    ),
    .lite_slave_aw_addr        (lite_aw_addr  ),
    .lite_slave_aw_prot        (lite_aw_prot  ),
    .lite_slave_aw_qos         (lite_aw_qos   ),
    .lite_slave_aw_region      (lite_aw_region),
    .lite_slave_aw_user        (lite_aw_user  ),
    .lite_slave_aw_valid       (lite_aw_valid ),
    .lite_slave_aw_ready       (lite_aw_ready ),
    .lite_slave_w_data         (lite_w_data   ),
    .lite_slave_w_strb         (lite_w_strb   ),
    .lite_slave_w_user         (lite_w_user   ),
    .lite_slave_w_valid        (lite_w_valid  ),
    .lite_slave_w_ready        (lite_w_ready  ),
    .lite_slave_b_id           (lite_b_id     ),
    .lite_slave_b_resp         (lite_b_resp   ),
    .lite_slave_b_user         (lite_b_user   ),
    .lite_slave_b_valid        (lite_b_valid  ),
    .lite_slave_b_ready        (lite_b_ready  ),
    
    .nasti_master_ar_id          (io_axi4_0_ar_bits_id    ),   
    .nasti_master_ar_addr        (io_axi4_0_ar_bits_addr  ),   
    .nasti_master_ar_len         (io_axi4_0_ar_bits_len   ),   
    .nasti_master_ar_size        (io_axi4_0_ar_bits_size  ),   
    .nasti_master_ar_burst       (io_axi4_0_ar_bits_burst ),   
    .nasti_master_ar_lock        (io_axi4_0_ar_bits_lock  ),   
    .nasti_master_ar_cache       (io_axi4_0_ar_bits_cache ),   
    .nasti_master_ar_prot        (io_axi4_0_ar_bits_prot  ),   
    .nasti_master_ar_qos         (io_axi4_0_ar_bits_qos   ),   
    .nasti_master_ar_region      (io_axi4_0_ar_bits_region),
    .nasti_master_ar_user        (io_axi4_0_ar_bits_user  ),   
    .nasti_master_ar_valid       (io_axi4_0_ar_valid ),   
    .nasti_master_ar_ready       (io_axi4_0_ar_ready ),   
    .nasti_master_r_id           (io_axi4_0_r_bits_id     ),   
    .nasti_master_r_data         (io_axi4_0_r_bits_data   ),   
    .nasti_master_r_resp         (io_axi4_0_r_bits_resp   ),   
    .nasti_master_r_last         (io_axi4_0_r_bits_last   ),   
    .nasti_master_r_user         (io_axi4_0_r_bits_user   ),   
    .nasti_master_r_valid        (io_axi4_0_r_valid  ),   
    .nasti_master_r_ready        (io_axi4_0_r_ready  ),
    .nasti_master_aw_id          (io_axi4_0_aw_bits_id    ),
    .nasti_master_aw_addr        (io_axi4_0_aw_bits_addr  ),
    .nasti_master_aw_len         (io_axi4_0_aw_bits_len   ),
    .nasti_master_aw_size        (io_axi4_0_aw_bits_size  ),
    .nasti_master_aw_burst       (io_axi4_0_aw_bits_burst ),
    .nasti_master_aw_lock        (io_axi4_0_aw_bits_lock  ),
    .nasti_master_aw_cache       (io_axi4_0_aw_bits_cache ),
    .nasti_master_aw_prot        (io_axi4_0_aw_bits_prot  ),
    .nasti_master_aw_qos         (io_axi4_0_aw_bits_qos   ),
    .nasti_master_aw_region      (io_axi4_0_aw_bits_region),
    .nasti_master_aw_user        (io_axi4_0_aw_bits_user  ),
    .nasti_master_aw_valid       (io_axi4_0_aw_valid ),
    .nasti_master_aw_ready       (io_axi4_0_aw_ready ),
    .nasti_master_w_data         (io_axi4_0_w_bits_data   ),
    .nasti_master_w_strb         (io_axi4_0_w_bits_strb   ),
    .nasti_master_w_last         (io_axi4_0_w_bits_last   ),
    .nasti_master_w_user         (io_axi4_0_w_bits_user   ),
    .nasti_master_w_valid        (io_axi4_0_w_valid  ),
    .nasti_master_w_ready        (io_axi4_0_w_ready  ),
    .nasti_master_b_id           (io_axi4_0_b_bits_id     ),
    .nasti_master_b_resp         (io_axi4_0_b_bits_resp   ),
    .nasti_master_b_user         (io_axi4_0_b_bits_user   ),
    .nasti_master_b_valid        (io_axi4_0_b_valid  ),
    .nasti_master_b_ready        (io_axi4_0_b_ready  )

    );

    wire [3:0] lite_aw_addr_dummy;
    wire [3:0] lite_ar_addr_dummy;
    
    //enfore the address according to the uartlite IP
    /*
        0h Rx FIFO
        04h Tx FIFO
        08h STAT_REG 
        0Ch CTRL_REG
    */
    assign lite_ar_addr_dummy   =   4'b0000;
    assign lite_aw_addr_dummy   =   4'b0100;
    
    axi_uartlite_0 uart_inst(

    .s_axi_aclk     (clock),
    .s_axi_aresetn  (reset),
    .interrupt      (interrupt),

    .s_axi_awaddr   (lite_aw_addr_dummy),
    .s_axi_awvalid  (lite_aw_valid),
    .s_axi_awready  (lite_aw_ready),

    .s_axi_wdata    (lite_w_data),
    .s_axi_wstrb    (lite_w_strb),
    .s_axi_wvalid   (lite_w_valid),
    .s_axi_wready   (lite_w_ready),

    .s_axi_bresp    (lite_b_resp),
    .s_axi_bvalid   (lite_b_valid),
    .s_axi_bready   (lite_b_ready),

    .s_axi_araddr   (lite_ar_addr_dummy),
    .s_axi_arvalid  (lite_ar_valid),
    .s_axi_arready  (lite_ar_ready),

    .s_axi_rdata    (lite_r_data),
    .s_axi_rresp    (lite_r_resp),
    .s_axi_rvalid   (lite_r_valid),
    .s_axi_rready   (lite_r_ready),

    .rx (uart_RX),
    .tx (uart_TX)

    );
endmodule
