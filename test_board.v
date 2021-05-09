module test_board (KEY, LEDG);
	input [3:0] KEY;
	output [8:0] LEDG;
	
	assign LEDG = ~KEY[0];
	
endmodule 
	