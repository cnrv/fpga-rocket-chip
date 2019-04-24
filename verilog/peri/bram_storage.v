module bram_storage(
    input en,
	input clock,
	input [12:0] addr,
	input [63:0] wdata,
	input [7:0] we_perbyte,
	output [63:0] rdata
	);

	reg [63:0] bram [8191:0];
	reg [63:0] outreg;
	wire[63:0] wmask;
	
	parameter BRAM_INIT_FILE = "firmware.hex";
    initial begin
        if (BRAM_INIT_FILE != "")
            $readmemh(BRAM_INIT_FILE, bram);
    end
    
    // generate wmask according to we_perbyte
    assign wmask[7:0] = we_perbyte[0] ? 8'hff:8'h00;
    assign wmask[15:8] = we_perbyte[1] ? 8'hff:8'h00;
    assign wmask[23:16] = we_perbyte[2] ? 8'hff:8'h00; 
    assign wmask[31:24] = we_perbyte[3] ? 8'hff:8'h00;
    assign wmask[39:32] = we_perbyte[4] ? 8'hff:8'h00;
    assign wmask[47:40] = we_perbyte[5] ? 8'hff:8'h00;
    assign wmask[55:48] = we_perbyte[6] ? 8'hff:8'h00;
    assign wmask[63:56] = we_perbyte[7] ? 8'hff:8'h00;    
 
	always @(posedge clock)
 	    if (en)
 	   		outreg <= (!we_perbyte) ? bram[addr]: 0;
 	   	else
 	   		outreg <= 0;

 	always @(posedge clock)
 		if (en)
 			bram[addr] <= (~wmask & bram[addr]) | (wmask & wdata);
 		else 
 			bram[addr] <= bram[addr];

	assign rdata = outreg;
endmodule	
	
	
