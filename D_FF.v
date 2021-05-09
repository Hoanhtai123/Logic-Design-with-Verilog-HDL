/*module D_FF (d, q, key);
	
	input d, key;
	output reg q;
	
	initial q = 1'b0;
	
	always @ (negedge key)
	begin
		q <= d;
	end

endmodule */