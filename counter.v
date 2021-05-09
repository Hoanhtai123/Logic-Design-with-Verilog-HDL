module counter (clock, count);
	
	input clock;
	
	output [1:0] count;
	
	wire Qa, Qb;
	
	D_FF1 a (((~Qa) & (~Qb)), Qa, clock);
	
	D_FF1 b ((Qa & (~Qb)), Qb, clock);
	
	assign count = {Qb,Qa};
	
endmodule 