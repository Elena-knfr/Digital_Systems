`timescale 1ns / 1ps
`default_nettype none

module top(SW, LEDR);
	input [9:0]SW;
	output [9:0]LEDR;

	register u0(SW[7:0], SW[9], SW[8], LEDR[7:0]);

endmodule

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
