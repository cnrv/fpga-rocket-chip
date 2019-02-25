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
	wire we;
	
	parameter BRAM_INIT_FILE = "bootrom.hex";
    initial begin
        if (BRAM_INIT_FILE != "")
            $readmemh(BRAM_INIT_FILE, bram);
    end

    integer i;

    /*read and display the values from the text file on screen*/ 

    initial begin

     for (i=0; i < 10; i=i+1)

     $display("%d:%h",i,bram[i]);

    end     

    assign we = (we_perbyte == 0)? 0:1; //the interface is byte-wise enable signal, we do not care it. shrink into 1 bit signal

	always @(posedge clock)
	begin
 	   bram[addr] <= (we && en) ? wdata:bram[addr];
	   outreg <= (we || !en) ? 0:bram[addr];
	end
	assign rdata = outreg;
endmodule	
	
	
