module main(KEY,SW, LEDR, LEDG, HEX0,HEX1,HEX2,HEX3,HEX4,HEX5,HEX6,HEX7,CLOCK_50);
	input [3:0] KEY;
	input [17:0]SW;
	input CLOCK_50;

	output [17:0]LEDR;
	output [8:0] LEDG;
	output [6:0] HEX0,HEX1,HEX2,HEX3,HEX4,HEX5,HEX6,HEX7;

	wire[11:0] data_in,password;
	wire mode,enable,signal,clock3;
	wire[1:0] result;
	wire[1:0] trials;

	wire clockey0, clockey1, clockey2,clockey0_display,clockey3_display;
	
	set_password _set_password(mode, data_in, password, clock3, enable);

	fsm_pwdinput _fsm_pwdinput(SW[10:7],clockey0, clockey0_display,data_in,clock3,HEX0,HEX1,HEX2);

	mode_switch _mode_switch(clockey1, mode);

	verify _verify(mode, password, data_in, enable, clock3, signal, result, trials);

	block _block(clockey2, signal, enable);

	display _display (.clock1(test), .clock3(clock3), .clock5(test2), .key1(clockey1), .mode(mode), .enable(enable), .trials(trials), .result_in(result), .data_in(data_in), .ledr(LEDR), .ledg(LEDG), .h3(HEX3), .h4(HEX4), .h5(HEX5), .h6(HEX6), .h7(HEX7));

	//clock_div creclk (CLOCK_50, clock_debounce);
	
	debounce clkey_de0 (CLOCK_50, (~KEY[0]), clockey0);
	
	debounce clkey_de1 (CLOCK_50, (~KEY[1]), clockey1);
	
	debounce clkey_de2 (CLOCK_50, (~KEY[2]), clockey2);

	debounce_display clkey_de4 (CLOCK_50, (~KEY[0]), clockey0_display);
	
	//debounce_display clkey_de5 (CLOCK_50, clock3, clockey3_display);

////////////////////////////////////////////////////////////////////////
	reg [25:0] accum1 = 0;
	reg [30:0] accum2 = 0;
	wire clock1 = (accum1 == 0);
	wire clock5 = (accum2 == 0);
	reg test=0;
	reg test2=0;

	always@(posedge CLOCK_50)
	begin
		accum1 <= (clock1 ? 25_000_000 : accum1) - 1; // for 1hz clock
		accum2 <= (clock5 ? 5_000_000 : accum2) - 1;	// for 5hzsecond clock
		if (clock1) test<=(~test);
		if (clock5) test2<=(~test2);
	end
	
	
endmodule



