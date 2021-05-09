module t_debounce ();
	
	reg clock;
	reg button;
	wire signal,enable;
	
	debounce _debounce (clock, button, signal);
	
	initial 
	begin
		clock = 1'b0;
		button = 1'b0;
		forever #1 clock = ~clock;
	end
	
	initial
	begin
		#10;
		#1 button = 1'b1;
		#1 button = 1'b0;
		#1 button = 1'b1;
		#1 button = 1'b0;
		#1 button = 1'b1;
		#1 button = 1'b0;
		#1 button = 1'b1;
		#1 button = 1'b0;
		#1 button = 1'b1;
		#1 button = 1'b0;
		#1 button = 1'b1;
		#1 button = 1'b0;
		#1 button = 1'b1;
		
		#10 button = 1'b0;
		#1 button = 1'b1;
		#1 button = 1'b0;
		#1 button = 1'b1;
		#1 button = 1'b0;
		#1 button = 1'b1;
		#1 button = 1'b0;
		#1 button = 1'b1;
		#1 button = 1'b0;
		#1 button = 1'b1;
		#1 button = 1'b0;
		
		///////////////////
		
		#200 button = 1'b1;
		#1 button = 1'b0;
		#1 button = 1'b1;
		#1 button = 1'b0;
		#1 button = 1'b1;
		#1 button = 1'b0;
		#1 button = 1'b1;
		#1 button = 1'b0;
		#1 button = 1'b1;
		#1 button = 1'b0;
		#1 button = 1'b1;
		#1 button = 1'b0;
		#1 button = 1'b1;
		
		#10 button = 1'b0;
		#1 button = 1'b1;
		#1 button = 1'b0;
		#1 button = 1'b1;
		#1 button = 1'b0;
		#1 button = 1'b1;
		#1 button = 1'b0;
		#1 button = 1'b1;
		#1 button = 1'b0;
		#1 button = 1'b1;
		#3 button = 1'b0;
		
		/////////////////////
		
		#200 button = 1'b1;
		#1 button = 1'b0;
		#1 button = 1'b1;
		#1 button = 1'b0;
		#1 button = 1'b1;
		#1 button = 1'b0;
		#1 button = 1'b1;
		#1 button = 1'b0;
		#1 button = 1'b1;
		#1 button = 1'b0;
		#1 button = 1'b1;
		#1 button = 1'b0;
		#1 button = 1'b1;
		
		#10 button = 1'b0;
		#1 button = 1'b1;
		#1 button = 1'b0;
		#1 button = 1'b1;
		#1 button = 1'b0;
		#1 button = 1'b1;
		#1 button = 1'b0;
		#1 button = 1'b1;
		#1 button = 1'b0;
		#1 button = 1'b1;
		#1 button = 1'b0;
		
		//////////////////
		
		#200 button = 1'b1;
		#1 button = 1'b0;
		#1 button = 1'b1;
		#1 button = 1'b0;
		#1 button = 1'b1;
		#1 button = 1'b0;
		#1 button = 1'b1;
		#1 button = 1'b0;
		#1 button = 1'b1;
		#1 button = 1'b0;
		#1 button = 1'b1;
		#1 button = 1'b0;
		#1 button = 1'b1;
		
		#10 button = 1'b0;
		#1 button = 1'b1;
		#1 button = 1'b0;
		#1 button = 1'b1;
		#1 button = 1'b0;
		#1 button = 1'b1;
		#1 button = 1'b0;
		#1 button = 1'b1;
		#1 button = 1'b0;
		#1 button = 1'b1;
		#3 button = 1'b0;
		
	end
	
	
	
	
endmodule 