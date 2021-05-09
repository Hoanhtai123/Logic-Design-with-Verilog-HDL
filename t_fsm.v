module t_fsm ();
	reg [8:0] test;
	reg clk;
	
	wire [11:0] result;
	wire outclk3;
	wire [6:0] t_h0,t_h1;
	wire [1:0] count;
	
	fsm_pwdinput1 fsm1 (.key(clk), .sw_in(test[3:0]), .data_f(result), .clock3(outclk3), .h0(t_h0), .h1(t_h1), .count(count));
	
	initial
	begin
		#5 clk = 1'b0;
		forever #5 clk = ~clk;
	end 
	
	
	initial
	begin
		$monitor ("%tps: clock %b, data_in %b, result %b, clock3: %b, count %b \n", $time, clk, test[3:0], result, outclk3, count);
	end 
	
	initial #1000 $finsih;
	
	initial
	begin
		for (test = 0; test < 256; test = test + 1)
		begin
			#10;
		end
	end 
	
endmodule 