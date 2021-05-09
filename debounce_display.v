module debounce_display (clock, button, signal);
	input clock, button;
	output reg signal;
	
	reg [26:0] count;
	
	initial 
	begin
		signal = 1'b0;
		count = 26'd0;
	end
	
	always @ (posedge button, posedge clock) //enable = 0: cho nhan tin hieu 
	begin
		if (button) 
		begin
			if (~signal)
			begin
				signal <= 1'b1; // 1 clock
				count <= 26'd0;	// reset time (1s)
			end
			else
			begin
				count <= count;
				signal <= signal;
			end
		end
		else 
		begin
			if (count < 20_001_000) //thoi gian ko cho nhan tin hieu
			begin
				count <= count + 1; 
				signal <= signal;
			end
			else //sau 1s tra lai enable tiep tuc cho nhan tin hieu
			begin
				count <= 26'd0;
				signal <= 1'b0;
			end
		end
	end
	
endmodule 