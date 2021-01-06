module register(in, clock, resetn, out);
	input [7:0]in;
	input clock, resetn;
	output reg [7:0]out;
	
	always@(posedge clock) 
	begin
		if(resetn == 1'b0)
			out <= 8'b00000000;
		else
			out <= in;
	end
	
endmodule
