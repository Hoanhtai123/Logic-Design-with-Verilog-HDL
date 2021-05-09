module verify (mode, password, data_in, enable, clock, signal, result,trials);
	input mode, enable;
	input [11:0] password, data_in;
	input clock;
	
	output reg [1:0] trials;

	output reg signal; // tin hieu cho block module
	output reg [1:0] result; // result for display led
	initial 
	begin	
		trials = 2'b00;
		signal = 1'b0;
	end 
	//assign signal = (~trials[1]); // trial[1]: 1->0, signal: 0->1;

	always @ (posedge clock) // reset but result still 11 till next input.
	begin
		if (enable==1'b0) // not be blocked
		begin
			if (mode) // mode = 1 (verify)
			begin
				signal = 1'b0;	//reset signal for block module
				if (password == data_in) 
				begin
					trials <= (2'b00);	// reset trials
					result <= (2'b00); // output led verify right
				end
				else 
				begin
					trials <= trials + 1;	//	increase trials 
					result <= (2'b01); // output led verify wrong
					if (trials+1 == 2'b11) // 3 times verify wrong
					begin
						trials <= (2'b00); // block and reset trials 
						signal = 1'b1;
						result <= (2'b11);
					end
				end
			end
			else // mode = 0 (set)
			begin 
				result <= (2'b10); // output led mode set password  
				trials<=(2'b00);	// reset trials every time when set password
			end
		end
		else result <= (2'b11); //output led block
	end
	
endmodule 