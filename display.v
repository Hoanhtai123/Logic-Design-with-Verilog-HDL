module display (clock1, clock3, clock5, key1, mode, enable, trials, result_in, data_in, ledr, ledg, h3, h4, h5, h6, h7);
	
	input [1:0] result_in, trials;
	input clock1, clock5, clock3, mode, enable, key1;
	input [11:0] data_in;
	
	output reg [17:0] ledr;
	output reg [8:0] ledg;
	
	output reg [6:0] h3, h4, h5, h6, h7;
	
	initial 
	begin
		h5 = 7'b100_0000;
		h4 = 7'b100_0000;
		ledr = {18{1'b0}};
		ledg = {9{1'b0}};
		h6 = 7'b111_1111;  // off hex
		h7 = 7'b111_1111;	 // off hex
	end
	
	always @ (trials) // display number of trials
	begin
		if (trials == 2'b00)	h4 = 7'b100_0000;  // 0
		else if (trials == 2'b01) h4 = 7'b111_1001; // 1
		else if (trials == 2'b10) h4 = 7'b010_0100; // 2
	end
	
	always @ (clock3,key1,enable) // ledr and ledg for verify, set and block
	begin
		if (enable == 1'b1) // block, turn on all leds
		begin
			ledr = {18{1'b1}};
			ledg = {9{1'b1}};
		end
		else //not be blocked
		begin
			if ((~clock3) || key1) //when we change mode or input new input
			begin
				h6 = 7'b111_1111;  // off hex
				h7 = 7'b111_1111;	 // off hex
				ledr = {18{1'b0}};
				ledg = {9{1'b0}};
			end
			else 
			begin
				if ((result_in == 2'b00) && mode) // verify right, turn on led green with frequency 5Hz 
				begin
					ledr = {18{1'b0}};
					ledg = {9{clock5}};
				end
				else 
				if ((result_in == 2'b01) && mode) //verify wrong, turn on led red with frequency 1Hz				begin
				begin
					ledr = {18{clock1}};
					ledg = {9{1'b0}};
				end
				else if (!mode)	// set password successfully
				begin	
					h6 = 7'b100_0001;  // U
					h7 = 7'b001_0010;	 // S
				end
				else // reset system but result still 2'b11
				begin
					h6 = 7'b111_1111;  // off hex
					h7 = 7'b111_1111;	 // off hex
					ledr = {18{1'b0}}; // off leds
					ledg = {9{1'b0}};
				end
			end
		end
	end
	
	always @ (mode, enable) // display mode
	begin
		if (enable) h3 = 7'b000_0000; // B : block
		else
		begin
			if (!mode) h3 = 7'b001_0010;	//S : set password
			else h3 = 7'b100_0110;	// C : check password
		end
	end
	
endmodule 
	
	