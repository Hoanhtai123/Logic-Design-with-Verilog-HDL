module fsm_pwdinput(sw_in, key, clockey0_display, data_f, clock3, h0, h1, h2);
input[3:0] sw_in;
input key,clockey0_display;
reg[3:0] pwd_current;
reg[3:0] pwd_next=4'b1111;
wire [1:0] count;
//reg[11:0] data_in;
output [11:0] data_f;
 reg[3:0] data_t1;
 reg[3:0] data_t2;
 reg[3:0] data_t3;
output reg clock3=0;
output reg [6:0] h0, h1, h2 ;

wire [6:0] temp1, temp2, temp3;
wire[3:0] w_data_t1 = data_t1;
wire[3:0] w_data_t2 = data_t2;
//wire[3:0] w_data_t3 = data_t3;
assign data_f={data_t3,data_t2,data_t1};

	initial 
	begin
		//data_f = 12'b1111_1111_1111;	
		pwd_current = 4'b1111;
		clock3 = 1'b0;
	end

counter count1 (key, count);

//assign clock3 = ~(count[1]);

BCD_to_HEX_delay bth3 (data_t3,temp3,(~clockey0_display)); // display number user input
BCD_to_HEX_delay bth2 (data_t2,temp2,(~clockey0_display));	// 
BCD_to_HEX_delay bth1 (data_t1,temp1,(~clockey0_display));	//

always @ (sw_in) // whenever sw_in change we prepare data
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
		default: pwd_next=4'b1111;
		endcase
	end

always @ (negedge key) // when user press key we update data
	begin
		pwd_current<=pwd_next;
	end
	
always @ (negedge clockey0_display)	// delay clock, clock go after input data
begin
	case(count)
		2'b00: clock3 = 1'b1;
		2'b01: clock3 = 1'b0;
		2'b10: clock3 = 1'b0;
		default: clock3 = 1'b0;
	endcase
end

always @ (pwd_current)	//when data is updated we input data
	begin
	case(count)
		2'b01:
				begin 
					//data_f = {8'b1111_1111,pwd_current};
					//data_f=12'b1111_1111_1111;
					
					data_t1 = pwd_current;
					data_t2=4'b1111;
					data_t3=4'b1111;
					h0 = (~key)?temp1:7'b111_1111;
					h1 = 7'b111_1111;
					h2 = 7'b111_1111;
					//clock3 = 1'b0;
				end
		2'b10:
				begin 
					//data_f= {4'b1111,pwd_current,data_t[3:0]};
					data_t1=w_data_t1; 			// assign data saved for data_t1, make sure that we have data for data_t1 
					data_t2= pwd_current;		// 
					data_t3=4'b1111;
					h0 = temp1;
					h1 = temp2;
					h2 = 7'b111_1111;
					//clock3 = 1'b0;
				end
		2'b00:
				begin 
					//data_f = {pwd_current,data_t[7:0]};
					data_t1=w_data_t1;
					data_t2=w_data_t2;
					data_t3 = pwd_current;
					h0 = temp1;
					h1 = temp2;
					h2 = temp3;
					//clock3 = 1'b1;
				end
		
		default: 
				begin
				h0 = 4'b1111;
				h1 = 4'b1111;
				h2 = 4'b1111;
				//clock3=1'b0;
				data_t1=4'b1111;
				data_t2=4'b1111;
				data_t3=4'b1111;
				end
	endcase
	end
	
endmodule 