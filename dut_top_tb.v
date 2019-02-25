`timescale 1ns / 1ps

module dut_top_tb;
	reg clock;
	reg resetn;
    wire uartTX;
    wire uartRX;
  
  	rocketTop dut_inst(

	 .clock100(clock), 
	 .buttonresetn(resetn),
     .uart_TX(uartTX),
     .uart_RX(uartRX)

  		);
    
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
