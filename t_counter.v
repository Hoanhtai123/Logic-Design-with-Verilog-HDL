module t_counter ();

	reg clk;
	
	wire [1:0] data;
	
	initial 
	begin
		clk = 1'b1;
		forever #5 clk = ~clk;
	end
	
	counter _count (clk, data);
	
	initial 
	begin
		$monitor ("%tps: counter: %b \n", $time, data);
	end
	
endmodule 
		
		