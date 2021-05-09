module D_FF1 (d, q, clock);
	
	input d, clock;
	output reg q;
	
	initial q = 1'b0;
	
	always @ (posedge clock)
	begin
		q <= d;
	end

endmodule 