module set_password (mode, data_in, password, clock3, enable);
	input mode,clock3,enable;
	input [11:0] data_in;
	output reg [11:0] password;
	
	always @ (posedge clock3) // three times press button
	begin
		if (!mode && !enable) // mode = 0 (set) and not be blocked
		begin
			password = data_in; 
		end
		else password = password; // else password still password
	end 
endmodule 	