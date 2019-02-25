// See LICENSE for license details.
// Feb21-2019 a change of xact_data_wp_offset's value is made

module nasti_lite_reader
  #(
    MAX_TRANSACTION = 1,        // the number of parallel transactions
    ID_WIDTH = 4,               // id width
    ADDR_WIDTH = 13,             // address width
    NASTI_DATA_WIDTH = 32,       // width of data on the nasti side
    LITE_DATA_WIDTH = 32,       // width of data on the nasti-lite side
    USER_WIDTH = 1              // width of user field, must > 0, let synthesizer trim it if not in use
    )
   (
    input  clk, rstn,
    input  [ID_WIDTH-1:0]           nasti_ar_id,
    input  [ADDR_WIDTH-1:0]         nasti_ar_addr,
    input  [7:0]                    nasti_ar_len,
    input  [2:0]                    nasti_ar_size,
    input  [1:0]                    nasti_ar_burst,
    input                           nasti_ar_lock,
    input  [3:0]                    nasti_ar_cache,
    input  [2:0]                    nasti_ar_prot,
    input  [3:0]                    nasti_ar_qos,
    input  [3:0]                    nasti_ar_region,
    input  [USER_WIDTH-1:0]         nasti_ar_user,
    input                           nasti_ar_valid,
    output                          nasti_ar_ready,

    output [ID_WIDTH-1:0]           nasti_r_id,
    output [NASTI_DATA_WIDTH-1:0]   nasti_r_data,
    output [1:0]                    nasti_r_resp,
    output                          nasti_r_last,
    output [USER_WIDTH-1:0]         nasti_r_user,
    output                          nasti_r_valid,
    input                           nasti_r_ready,

    output [ID_WIDTH-1:0]           lite_ar_id,
    output [ADDR_WIDTH-1:0]         lite_ar_addr,
    output [2:0]                    lite_ar_prot,
    output [3:0]                    lite_ar_qos,
    output [3:0]                    lite_ar_region,
    output [USER_WIDTH-1:0]         lite_ar_user,
    output                          lite_ar_valid,
    input                           lite_ar_ready,

    input  [ID_WIDTH-1:0]           lite_r_id,
    input  [LITE_DATA_WIDTH-1:0]    lite_r_data,
    input  [1:0]                    lite_r_resp,
    input  [USER_WIDTH-1:0]         lite_r_user,
    input                           lite_r_valid,
    output                          lite_r_ready
    );


   localparam BUF_LEN = NASTI_DATA_WIDTH > LITE_DATA_WIDTH ? NASTI_DATA_WIDTH/LITE_DATA_WIDTH : 1;
   localparam MAX_TRAN_BITS = $clog2(MAX_TRANSACTION);
   localparam BUF_LEN_BITS = $clog2(BUF_LEN);
   localparam NASTI_W_BITS = $clog2(NASTI_DATA_WIDTH/8);
   localparam LITE_W_BITS = $clog2(LITE_DATA_WIDTH/8);

   genvar i;

   initial begin
      assert(LITE_DATA_WIDTH == 32 || LITE_DATA_WIDTH == 64)
        else $fatal(1, "nasti-lite supports only 32/64-bit channels!");
      assert(NASTI_DATA_WIDTH >= LITE_DATA_WIDTH)
        else $fatal(1, "nasti bus cannot be narrower than lite bus!");
   end

   `include "nasti_request.vh"

   // nasti request buffer
   NastiReq [MAX_TRANSACTION-1:0]    ar_buf;
   logic [MAX_TRAN_BITS-1:0]         ar_buf_rp, ar_buf_wp;
   logic                             ar_buf_valid;
   logic                             ar_buf_full, ar_buf_empty;

   // transaction information
   NastiReq                                 xact_req;
   logic                                    xact_req_valid;
   logic [BUF_LEN_BITS+7:0]                 xact_ar_cnt;
   logic [BUF_LEN_BITS+7:0]                 xact_r_cnt;
   logic [BUF_LEN-1:0][LITE_DATA_WIDTH-1:0] xact_data_vec;
   logic [1:0]                              xact_resp;
   logic [BUF_LEN_BITS:0]                   xact_data_wp;
   logic                                    xact_finish;

   logic [ADDR_WIDTH-1:0]                   lite_ar_addr_accum;
   logic [7:0]                              nasti_r_cnt;
   logic [ADDR_WIDTH-1:0]                   nasti_r_addr;
   logic [ADDR_WIDTH-1:0]                   nasti_r_addr_accum;

   function int unsigned nasti_step_size(input NastiReq req);
      return 8'd1 << req.size;
   endfunction // nasti_step_size

   function bit unsigned nasti_shrink(input NastiReq req);
      return nasti_step_size(req) > LITE_DATA_WIDTH/8;
   endfunction // nasti_shrink

   function int unsigned lite_step_size(input NastiReq req);
      return nasti_shrink(req) ? LITE_DATA_WIDTH/8 : nasti_step_size(req);
   endfunction // lite_step_size

   function int unsigned lite_packet_ratio(input NastiReq req);
      return nasti_shrink(req) ? 8'd1 << (req.size - LITE_W_BITS) : 1;
   endfunction // lite_packet_ratio

   function int unsigned lite_packet_size(input NastiReq req);
      return lite_packet_ratio(req) * (req.len + 1);
   endfunction // lite_packet_size

   function int unsigned incr(input int unsigned cnt, step, ub);
      return cnt >= ub - step ? 0 : cnt + step;
   endfunction // incr

   // buffer requests

   assign ar_buf_full = ar_buf_valid && ar_buf_wp == ar_buf_rp;
   assign ar_buf_empty = !ar_buf_valid && ar_buf_wp == ar_buf_rp;

   always_ff @(posedge clk or negedge rstn)
     if(!rstn)
        ar_buf_wp <= 0;
     else if(nasti_ar_valid && nasti_ar_ready) begin
        ar_buf[ar_buf_wp] <= NastiReq'{nasti_ar_id, nasti_ar_addr, nasti_ar_len,
                                       nasti_ar_size, nasti_ar_burst, nasti_ar_lock,
                                       nasti_ar_cache, nasti_ar_prot, nasti_ar_qos,
                                       nasti_ar_region, nasti_ar_user};
        ar_buf_wp <= incr(ar_buf_wp, 1, MAX_TRANSACTION);

  //      assert(nasti_ar_burst == 2'b01)
    //      else $fatal(1, "nasti-lite support only INCR burst!");
     end

   always_ff @(posedge clk or negedge rstn)
     if(!rstn)
       ar_buf_valid <= 1'b0;
     else if(nasti_ar_valid && nasti_ar_ready)
       ar_buf_valid <= 1'b1;
     else if((xact_finish || !xact_req_valid) && ar_buf_wp == incr(ar_buf_rp, 1, MAX_TRANSACTION))
       ar_buf_valid <= 1'b0;

   always_ff @(posedge clk or negedge rstn)
     if(!rstn)
       ar_buf_rp <= 0;
     else if(ar_buf_valid && (xact_finish || !xact_req_valid))
       ar_buf_rp <= incr(ar_buf_rp, 1, MAX_TRANSACTION);

   // current transaction

   always_ff @(posedge clk or negedge rstn)
     if(!rstn)
       lite_ar_addr_accum <= 0;
     else if(lite_ar_valid && lite_ar_ready)
       lite_ar_addr_accum <= lite_ar_addr_accum + lite_step_size(xact_req);
     else if(xact_finish)
       lite_ar_addr_accum <= 0;

   assign lite_ar_id = xact_req.id;
   assign lite_ar_addr = xact_req.addr + lite_ar_addr_accum;
   assign lite_ar_prot = xact_req.prot;
   assign lite_ar_qos = xact_req.qos;
   assign lite_ar_region = xact_req.region;
   assign lite_ar_user = xact_req.user;
   assign lite_ar_valid = xact_req_valid && xact_ar_cnt < lite_packet_size(xact_req);
   assign nasti_ar_ready = !ar_buf_full;

   always_ff @(posedge clk or negedge rstn)
     if(!rstn) begin
        xact_req_valid <= 1'b0;
        xact_ar_cnt <= 0;
        xact_r_cnt <= 0;
     end else begin
        if(lite_ar_valid && lite_ar_ready)
          xact_ar_cnt <= xact_ar_cnt + 1;
        else if(xact_finish)
          xact_ar_cnt <= 0;

        if(lite_r_valid && lite_r_ready)
          xact_r_cnt <= xact_r_cnt + 1;
        else if(xact_finish)
          xact_r_cnt <= 0;

        if(xact_finish || !xact_req_valid) begin
           if(ar_buf_valid) xact_req <= ar_buf[ar_buf_rp];
           xact_req_valid <= ar_buf_valid;
        end
     end

   logic [BUF_LEN_BITS:0] xact_data_wp_offset;
//   assign xact_data_wp_offset = NASTI_DATA_WIDTH > LITE_DATA_WIDTH ? nasti_r_addr[NASTI_W_BITS-1:LITE_W_BITS] : 0;
//   syntax problem, here we have same bandwidth between nasti and lite, so rp=0;

   assign xact_data_wp_offset = 0;
   assign xact_finish = nasti_r_valid && nasti_r_ready && nasti_r_cnt == xact_req.len;

   always_ff @(posedge clk or negedge rstn)
     if(!rstn)
       xact_data_wp <= 0;
     else if(lite_r_valid && lite_r_ready) begin
        xact_data_vec[xact_data_wp+xact_data_wp_offset] <= lite_r_data;
        xact_resp <= lite_r_resp;
        xact_data_wp <= xact_data_wp + 1;
     end else if(nasti_r_valid && nasti_r_ready)
       xact_data_wp <= 0;

   assign nasti_r_valid = xact_req_valid && xact_data_wp == lite_packet_ratio(xact_req);
   assign nasti_r_id = xact_req.id;
   assign nasti_r_data = xact_data_vec;
   assign nasti_r_resp = xact_resp;
   assign nasti_r_last = nasti_r_cnt == xact_req.len;
   assign nasti_r_user = xact_req.user;
   assign nasti_r_addr = xact_req.addr + nasti_r_addr_accum;
   assign lite_r_ready = xact_req_valid && xact_r_cnt < lite_packet_size(xact_req) &&
                         xact_data_wp < lite_packet_ratio(xact_req);

   always_ff @(posedge clk or negedge rstn)
     if(!rstn) begin
        nasti_r_cnt <= 0;
        nasti_r_addr_accum <= 0;
     end else if(nasti_r_valid && nasti_r_ready) begin
        nasti_r_cnt <= nasti_r_cnt == xact_req.len ? 0 : nasti_r_cnt + 1;
        nasti_r_addr_accum <= xact_finish ? 0 : nasti_r_addr_accum + nasti_step_size(xact_req);
     end

endmodule // nasti_lite_reader
