module clock_div(clock50, clock);
	
	input clock50;
	output reg clock;
	
	reg [26:0]counter=0;
   always @(posedge clock50)
   begin
		counter <= (counter>=249999) ? 0 : counter+1;
      clock <= (counter < 125000) ? 1'b0 : 1'b1;
   end
endmodule 