`timescale 1ns / 1ps
`default_nettype none

module top(SW, LEDR);
	input [9:0]SW;
	output [9:0]LEDR;

	counter u0(SW[9], SW[8], SW[0], LEDR[3:0]);

endmodule

module counter(clk, resetn, en, q);
	input clk, resetn, en;
	output reg [3:0] q; //4-bit counter
	
	always@(posedge clk)
		begin
			if(resetn == 1'b0)
				q <= 0;
			else if(q == 4'b1111) //counter should count from 0 to F,
											// if reached F (hexadecimal), reset
				q <= 0;
			else if(en == 1'b1) //if enable, count up
				q <= q + 1;
		end
endmodule
