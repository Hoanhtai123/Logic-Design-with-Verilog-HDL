module fsm_pwdinput1(sw_in, key, data_f, clock3, h0, h1, count);
input[3:0] sw_in;
input key;
reg[3:0] pwd_current;
reg[3:0] pwd_next;
output [1:0] count;
reg[11:0] data_in;
output reg[11:0] data_f;
 reg[11:0] data_t;
output clock3;
output reg [6:0] h0, h1;

wire [6:0] temp1, temp2, temp3;

	initial 
	begin
		data_f = 12'b1111_1111_1111;	
		pwd_current = 4'b1111;
	end

counter count1 (key, count);

assign clock3 = ~(count[1]);

BCD_to_HEX bth0 (data_f[11:8],temp3); // display number user input
BCD_to_HEX bth1 (data_f[7:4],temp2);	// 
BCD_to_HEX bth2 (data_f[3:0],temp1);	//
	

always @ (*)
	begin
		case(count)
		2'b00:
				begin 
					pwd_next=sw_in;
				end
		2'b01:
				begin 
					pwd_next=sw_in;
				end
		2'b10:
				begin 
					pwd_next=sw_in;
				end
		default pwd_next=pwd_next;
		endcase
	end

always @ (posedge key)
	begin
		pwd_current<=pwd_next;
	end

always @ (*)
	begin
	case(count)
		2'b01:
				begin 
					data_in = {8'bxxxx_xxxx,pwd_current};
					h0 = temp1;
					h1 = 7'b111_1111;
					//h2 = 7'b111_1111;
					//clock3 = 1'b0;
				end
		2'b10:
				begin 
					data_in = {4'bxxxx,pwd_current,data_in[3:0]}; 
					h1 = temp2;
					//h2 = 7'b111_1111;
					//clock3 = 1'b0;
				end
		2'b00:
				begin 
					data_f = {pwd_current,data_in[7:0]};
					//h2 = temp3;
					//clock3 = 1'b1;
				end
		
		default data_f=12'bxxxxxxxxxxxx;
	endcase
	end
	
endmodule 