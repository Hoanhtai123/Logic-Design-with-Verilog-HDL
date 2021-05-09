module BCD_to_HEX_delay (data_in, out_7seg, clock);
	
	input [3:0] data_in;

	output reg [6:0] out_7seg;
	
	input clock;
	
	initial out_7seg = 7'b111_1111;
	
	always @ (posedge clock)
	begin
		case(data_in)
		4'b0000 :
		out_7seg <= 7'b100_0000 ;
		4'b0001 :
		out_7seg <= 7'b111_1001 ;
		4'b0010 :
		out_7seg <= 7'b010_0100 ;
		4'b0011 : 
		out_7seg <= 7'b011_0000 ;
		4'b0100 :
		out_7seg <= 7'b001_1001 ;
		4'b0101 :
		out_7seg <= 7'b001_0010 ;
		4'b0110 :
		out_7seg <= 7'b000_0010 ;
		4'b0111 :
		out_7seg <= 7'b111_1000 ;
		4'b1000 :
		out_7seg <= 7'b000_0000 ;
		4'b1001 :
		out_7seg	<= 7'b001_0000 ;
		default : 
		out_7seg	<= 7'b111_1111 ;
	endcase
	end
	
endmodule 