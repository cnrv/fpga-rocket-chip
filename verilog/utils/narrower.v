// NARROWER is used to tackle with data transmit from 64bit m-axi to 32bit s-axi
// neutrino 2019
// but i suppose the "nasti_lite_bridge" IP can tackle with it independently, gonna elimit it in the future version

module narrower(
	input [63:0] w_data_64,
	input [7:0] w_strb_8,
	output[63:0] r_data_64,

	output[31:0] w_data_32,
	output[3:0] w_strb_4,
	input [31:0] r_data_32
	);
	
	wire which_side_valid; 
	// generally the low 32 bits should be valid, but sometimes it changes 
	// so here : 1 means highvalid; 0 means lowvalid 
	assign which_side_valid = w_strb_8[7:4] ? 1:0 ;

	assign w_data_32 = which_side_valid ? w_data_64[63:32] : w_data_64[31:0] ;
	assign w_strb_4 = which_side_valid ? w_strb_8[7:4] : w_strb_8[3:0] ;
	assign r_data_64 = {r_data_32, r_data_32} ;
endmodule