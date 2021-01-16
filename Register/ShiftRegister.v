`timescale 1ns / 1ps
`default_nettype none

module top(SW, LEDR);
	input [9:0]SW;
	output [9:0]LEDR;

	shift_register_4bit u0(SW[9], SW[8], SW[7], SW[6], SW[3:0], LEDR[0]);

endmodule

module shift_register_4bit(input enable, clk, resetn, loadn, input [3:0]data, output out);
	reg [3:0]Q = {4{1'b0}};
	
	always@(posedge clk) begin
		if(resetn==0)
			Q<=0;
		else if(loadn==0) begin
			Q<=data;
		end
		
		else if(enable) begin
			Q[3] <= 1'b0;
			Q[2] <= Q[3];
			Q[1] <= Q[2];
			Q[0] <= Q[1];
		end
	end
	assign out = Q[0];
endmodule
