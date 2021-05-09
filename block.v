module block (key, signal, enable);
	
	input key, signal;
	
	output reg enable;
	initial enable=1'b0;
	
	always @ (posedge key or posedge signal) //press key or have signal from verify module
	begin
		if (key) enable <= 1'b0;	//press key => reset enable
		else enable <= 1'b1;		//signal of blocking system
	end
	
endmodule 
		
	