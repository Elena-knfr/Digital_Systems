`timescale 1ns / 1ps
`default_nettype none

module top(SW, LEDR); 
	input[9:0]SW;
	output[9:0]LEDR;

	T_FF u0(SW[0], SW[9], SW[1], LEDR[0]);

endmodule

module T_FF(Clock, Clear_b, T, Q);
	input Clock, Clear_b, T;
	output reg Q;
	reg xoring;
	
	always @ (*)
	begin
		xoring = T ^ Q;
	end
	
	always@(posedge Clock)
	begin
		if(Clear_b == 1'b0) 
			Q <= 1'b0;
		else
			Q <= xoring;
	end
endmodule
