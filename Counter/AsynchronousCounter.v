
`timescale 1ns / 1ps
`default_nettype none

module top(SW, LEDR);
	input [9:0]SW;
	output [9:0]LEDR;

	async_counter u0(SW[0], SW[9], SW[8], LEDR[2:0]);

endmodule

module async_counter(Enable, Clock, Resetn, Q);
	 input Enable, Clock, Resetn;
	 output [2:0] Q;
    	 wire [2:0] C;
	 
	 T_FF t0(Clock, resetn, Enable, C[0]);
	 T_FF t1(~C[0], resetn, Enable, C[1]);
	 T_FF t2(~C[1], resetn, Enable, C[2]);

    assign Q = C;
endmodule


module T_FF(Clock, Resetn, T, Q);
	input Clock, Resetn, T;
	output reg Q;
	reg xoring;
	
	always @ (*)
	begin
		xoring = T ^ Q;
	end
	
	always@(posedge Clock, negedge Resetn)
	begin
		if(Resetn == 1'b0) 
			Q <= 0;
		else
			Q <= xoring;
	end
endmodule
