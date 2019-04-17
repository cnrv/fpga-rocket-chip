`timescale 1ns / 1ps
`define RANDOMIZE_GARBAGE_ASSIGN
`define RANDOMIZE_INVALID_ASSIGN
`define RANDOMIZE_REG_INIT
`define RANDOMIZE_MEM_INIT
`define SYNTHESIS
`define RANDOMIZE_DELAY 0.002


///////////////////////////////////////////////////////////////////////////////////////////////////////////////////
module data_arrays_0_ext(
  input RW0_clk,
  input [8:0] RW0_addr,
  input RW0_en,
  input RW0_wmode,
  input [31:0] RW0_wmask,
  input [255:0] RW0_wdata,
  output [255:0] RW0_rdata
);

  reg reg_RW0_ren;
  reg [8:0] reg_RW0_addr;
  reg [255:0] ram [511:0];
  `ifdef RANDOMIZE_MEM_INIT
    integer initvar;
    initial begin
      #`RANDOMIZE_DELAY begin end
      for (initvar = 0; initvar < 512; initvar = initvar+1)
        ram[initvar] = {8 {$random}};
      reg_RW0_addr = {1 {$random}};
    end
  `endif
  integer i;
  always @(posedge RW0_clk)
    reg_RW0_ren <= RW0_en && !RW0_wmode;
  always @(posedge RW0_clk)
    if (RW0_en && !RW0_wmode) reg_RW0_addr <= RW0_addr;
    
  integer j;
    integer width = 8;
    integer size = 32;
    always @(posedge RW0_clk)
    for (i=0; i<size; i=i+1)
      for (j=0; j<width; j=j+1)
          begin
              if (RW0_en && RW0_wmode && RW0_wmask[i])
                  ram[RW0_addr][i*width+j] <= RW0_wdata[i*width+j];
          end

    
  `ifdef RANDOMIZE_GARBAGE_ASSIGN
  reg [255:0] RW0_random;
  `ifdef RANDOMIZE_MEM_INIT
    initial begin
      #`RANDOMIZE_DELAY begin end
      RW0_random = {$random, $random, $random, $random, $random, $random, $random, $random};
      reg_RW0_ren = RW0_random[0];
    end
  `endif
  always @(posedge RW0_clk) RW0_random <= {$random, $random, $random, $random, $random, $random, $random, $random};
  assign RW0_rdata = reg_RW0_ren ? ram[reg_RW0_addr] : RW0_random[255:0];
  `else
  assign RW0_rdata = ram[reg_RW0_addr];
  `endif

endmodule

///////////////////////////////////////////////////////////////////////////////////////////////////////////////////


module tag_array_ext(
  input RW0_clk,
  input [5:0] RW0_addr,
  input RW0_en,
  input RW0_wmode,
  input [3:0] RW0_wmask,
  input [87:0] RW0_wdata,
  output [87:0] RW0_rdata
);

  reg reg_RW0_ren;
  reg [5:0] reg_RW0_addr;
  reg [87:0] ram [63:0];
  `ifdef RANDOMIZE_MEM_INIT
    integer initvar;
    initial begin
      #`RANDOMIZE_DELAY begin end
      for (initvar = 0; initvar < 64; initvar = initvar+1)
        ram[initvar] = {3 {$random}};
      reg_RW0_addr = {1 {$random}};
    end
  `endif
  integer i;
  always @(posedge RW0_clk)
    reg_RW0_ren <= RW0_en && !RW0_wmode;
  always @(posedge RW0_clk)
    if (RW0_en && !RW0_wmode) reg_RW0_addr <= RW0_addr;

  integer j;
  integer width = 22;
  integer size = 4;
  always @(posedge RW0_clk)
  for (i=0; i<size; i=i+1)
	for (j=0; j<width; j=j+1)
		begin
			if (RW0_en && RW0_wmode && RW0_wmask[i])
				ram[RW0_addr][i*width+j] <= RW0_wdata[i*width+j];
		end

  `ifdef RANDOMIZE_GARBAGE_ASSIGN
  reg [95:0] RW0_random;
  `ifdef RANDOMIZE_MEM_INIT
    initial begin
      #`RANDOMIZE_DELAY begin end
      RW0_random = {$random, $random, $random};
      reg_RW0_ren = RW0_random[0];
    end
  `endif
  always @(posedge RW0_clk) RW0_random <= {$random, $random, $random};
  assign RW0_rdata = reg_RW0_ren ? ram[reg_RW0_addr] : RW0_random[87:0];
  `else
  assign RW0_rdata = ram[reg_RW0_addr];
  `endif

endmodule

///////////////////////////////////////////////////////////////////////////////////////////////////////////////////


module tag_array_0_ext(
  input RW0_clk,
  input [5:0] RW0_addr,
  input RW0_en,
  input RW0_wmode,
  input [3:0] RW0_wmask,
  input [83:0] RW0_wdata,
  output [83:0] RW0_rdata
);

  reg reg_RW0_ren;
  
  reg [5:0] reg_RW0_addr;
  reg [83:0] ram [63:0];
  
  `ifdef RANDOMIZE_MEM_INIT
    integer initvar;
    initial begin
      #`RANDOMIZE_DELAY begin end
      for (initvar = 0; initvar < 64; initvar = initvar+1)
        ram[initvar] = {3 {$random}};
      reg_RW0_addr = {1 {$random}};
    end
  `endif
  
  integer i;
  always @(posedge RW0_clk)
    reg_RW0_ren <= RW0_en && !RW0_wmode;
  always @(posedge RW0_clk)
    if (RW0_en && !RW0_wmode) reg_RW0_addr <= RW0_addr;

  integer j;
  integer width = 21;
  integer size = 4;
  always @(posedge RW0_clk)
  for (i=0; i<size; i=i+1)
	for (j=0; j<width; j=j+1)
		begin
			if (RW0_en && RW0_wmode && RW0_wmask[i])
				ram[RW0_addr][i*width+j] <= RW0_wdata[i*width+j];
		end


  `ifdef RANDOMIZE_GARBAGE_ASSIGN
  reg [95:0] RW0_random;
  `ifdef RANDOMIZE_MEM_INIT
    initial begin
      #`RANDOMIZE_DELAY begin end
      RW0_random = {$random, $random, $random};
      reg_RW0_ren = RW0_random[0];
    end
  `endif
  always @(posedge RW0_clk) RW0_random <= {$random, $random, $random};
  assign RW0_rdata = reg_RW0_ren ? ram[reg_RW0_addr] : RW0_random[83:0];
  `else
  assign RW0_rdata = ram[reg_RW0_addr];
  `endif

endmodule

///////////////////////////////////////////////////////////////////////////////////////////////////////////////////


module data_arrays_0_0_ext(
  input RW0_clk,
  input [8:0] RW0_addr,
  input RW0_en,
  input RW0_wmode,
  input [3:0] RW0_wmask,
  input [127:0] RW0_wdata,
  output [127:0] RW0_rdata
);

  reg reg_RW0_ren;
  reg [8:0] reg_RW0_addr;
  reg [127:0] ram [511:0];
  
  `ifdef RANDOMIZE_MEM_INIT
    integer initvar;
    initial begin
      #`RANDOMIZE_DELAY begin end
      for (initvar = 0; initvar < 512; initvar = initvar+1)
        ram[initvar] = {4 {$random}};
      reg_RW0_addr = {1 {$random}};
    end
  `endif
  
  integer i;
  always @(posedge RW0_clk)
    reg_RW0_ren <= RW0_en && !RW0_wmode;
  always @(posedge RW0_clk)
    if (RW0_en && !RW0_wmode) reg_RW0_addr <= RW0_addr;
  //read-able status judge & address get  
   
  integer j;
  integer width = 32;
  integer size = 4;
  always @(posedge RW0_clk)
  for (i=0; i<size; i=i+1)
    for (j=0; j<width; j=j+1)
        begin
            if (RW0_en && RW0_wmode && RW0_wmask[i])
                ram[RW0_addr][i*width+j] <= RW0_wdata[i*width+j];
        end
   // write action, according to mask 
   
  `ifdef RANDOMIZE_GARBAGE_ASSIGN
  
  reg [127:0] RW0_random;
  `ifdef RANDOMIZE_MEM_INIT
    initial begin
      #`RANDOMIZE_DELAY begin end
      RW0_random = {$random, $random, $random, $random};
      reg_RW0_ren = RW0_random[0];
    end
  `endif
  
  always @(posedge RW0_clk) RW0_random <= {$random, $random, $random, $random};
 
  assign RW0_rdata = reg_RW0_ren ? ram[reg_RW0_addr] : RW0_random[127:0];
  `else
  assign RW0_rdata = ram[reg_RW0_addr];
  `endif

endmodule


