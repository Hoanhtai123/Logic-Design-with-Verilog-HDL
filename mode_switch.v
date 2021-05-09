module mode_switch (key, mode);
	input key;
	output reg mode;
	
	initial 
	begin
		mode = 1'b0; //set 
	end
	
	always @ (posedge key)
	begin
		mode <= (~mode); // set <-> verify
	end 
	
endmodule 