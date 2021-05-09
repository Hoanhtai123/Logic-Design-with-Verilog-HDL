module test_fsm (LEDR, SW, HEX0, HEX1, HEX2, KEY, CLOCK_50);
	
	input [17:0] SW;
	input [3:0] KEY;
	
	input CLOCK_50;
	
	output [17:0] LEDR;
		
	output [6:0] HEX0, HEX1, HEX2;
	
	wire [11:0] data;
	
	wire signal;
	
	fsm_pwdinput FSM_12 (SW[3:0], signal ,data, LEDR[17], HEX0, HEX1, HEX2);
	
	debounce d_e (CLOCK_50, (~KEY[0]), signal);
	
	assign LEDR[11:0] = data;
	
	
endmodule 