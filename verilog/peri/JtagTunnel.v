module JTAGTUNNEL(
    output jtag_tck,
    output jtag_tms,
    output jtag_tdi,
    input jtag_tdo,
    input jtag_tdo_en
);

parameter USER_CHAIN=4;
wire CAPTURE;
wire DRCK;
wire RESET;
wire SEL;
wire SHIFT;
wire UPDATE;
wire RUNTEST;

wire jtag_tck;
reg  jtag_tms;
wire jtag_tdi;
wire jtag_tdo;
wire jtag_tdo_en;
wire TDO;
wire reset;
wire start_tck;
reg [6:0] shiftreg_cnt;
reg [7:0] counter_neg;
reg [7:0] counter_pos;
reg         TDI_REG;

BSCANE2 #(
  .JTAG_CHAIN(USER_CHAIN) // Value for USER command.
)
BSCANE2_inst (
  .CAPTURE(CAPTURE), // 1-bit output: CAPTURE output from TAP controller.
  .DRCK(DRCK), // 1-bit output: Gated TCK output. When SEL is asserted, DRCK toggles when CAPTURE or
  // SHIFT are asserted.
    .RESET(RESET), // 1-bit output: Reset output for TAP controller.
    .RUNTEST(RUNTEST), // 1-bit output: Output asserted when TAP controller is in Run Test/Idle state.
    .SEL(SEL), // 1-bit output: USER instruction active output.
    .SHIFT(SHIFT), // 1-bit output: SHIFT output from TAP controller.
    .TCK(TCK), // 1-bit output: Test Clock output. Fabric connection to TAP Clock pin.
    .TDI(TDI), // 1-bit output: Test Data Input (TDI) output from TAP controller.
    .TMS(TMS), // 1-bit output: Test Mode Select output. Fabric connection to TAP.
    .UPDATE(UPDATE), // 1-bit output: UPDATE output from TAP controller
    .TDO(TDO) // 1-bit input: Test Data Output (TDO) input for USER function.
  );
//
BUFGCE BUFGCE_JTAG (
  .O(jtag_tck), // 1-bit output: Clock output
  .CE(start_tck), // 1-bit input: Clock enable input for I0
  .I(TCK) // 1-bit input: Primary clock
);


assign start_tck = SEL;
assign jtag_tdi = TDI;
assign TDO = jtag_tdo_en ? jtag_tdo : 1'b1;

always@(*) begin
        if (counter_neg == 8'h04) begin
                jtag_tms = TDI_REG;
        end else if (counter_neg == 8'h05) begin
                jtag_tms = 1'b1;
        end else if ((counter_neg == (8'h08 + shiftreg_cnt)) || (counter_neg == (8'h08 + shiftreg_cnt - 8'h01))) begin
                jtag_tms = 1'b1;
        end else begin
                jtag_tms = 1'b0;
        end
end

always@(posedge TCK) begin
        if (~SHIFT) begin
                shiftreg_cnt <= 7'b0000000;
        end else if ((counter_pos >= 8'h01) && (counter_pos <= 8'h07))  begin
                shiftreg_cnt <= {{TDI, shiftreg_cnt[6:1]}};
        end else begin
                shiftreg_cnt <= shiftreg_cnt;
        end
end

always@(posedge TCK) begin
        if (~SHIFT) begin
                TDI_REG <= 1'b0;
        end else if (counter_pos == 8'h00) begin
                TDI_REG <= ~TDI;
        end else begin
                TDI_REG <= TDI_REG;
        end
end

always@(negedge TCK) begin
        if (~SHIFT) begin
                counter_neg <= 8'b00000000;
        end else begin
                counter_neg <= counter_neg + 1;
        end
end

always@(posedge TCK) begin
        if (~SHIFT) begin
                counter_pos <= 8'b00000000;
        end else begin
                counter_pos <= counter_pos + 1;
        end
end
endmodule
