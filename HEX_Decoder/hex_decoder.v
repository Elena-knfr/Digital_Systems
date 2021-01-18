`timescale 1ns / 1ps

module hex_decoder(SW, HEX0);
	input [3:0]SW;
	output [6:0]HEX0;
	wire m0, m1, m2, m3, m4, m5, m6, m7, m8, m9, m10, m11, m12, m13, m14, m15;
	
	assign m0 = ~SW[3] & ~SW[2] & ~SW[1] & ~SW[0];
	assign m1 = ~SW[3] & ~SW[2] & ~SW[1] & SW[0];
	assign m2 = ~SW[3] & ~SW[2] & SW[1] & ~SW[0];
	assign m3 = ~SW[3] & ~SW[2] & SW[1] & SW[0];
	assign m4 = ~SW[3] & SW[2] & ~SW[1] & ~SW[0];
	assign m5 = ~SW[3] & SW[2] & ~SW[1] & SW[0];
	assign m6 = ~SW[3] & SW[2] & SW[1] & ~SW[0];
	assign m7 = ~SW[3] & SW[2] & SW[1] & SW[0];
	assign m8 = SW[3] & ~SW[2] & ~SW[1] & ~SW[0];
	assign m9 = SW[3] & ~SW[2] & ~SW[1] & SW[0];
	assign m10 = SW[3] & ~SW[2] & SW[1] & ~SW[0];
	assign m11 = ~SW[3] & ~SW[2] & SW[1] & SW[0];
	assign m12 = SW[3] & SW[2] & ~SW[1] & ~SW[0];
	assign m13 = SW[3] & SW[2] & ~SW[1] & SW[0];
	assign m14 = SW[3] & SW[2] & SW[1] & ~SW[0];
	assign m15 = SW[3] & SW[2] & SW[1] & SW[0];
	
	assign HEX0[0] = m0 | m2 | m3 | m5 | m6 | m7 | m8 | m9 | m10 | m12 | m14 | m15;
	assign HEX0[1] = m0 | m1 | m2 | m3 | m4 | m7 | m8 | m9 | m10 | m13;
	assign HEX0[2] = m0 | m1 | m3 | m4 | m5 | m6 | m7 | m8 | m9 | m10 | m11 | m12;
	assign HEX0[3] = m0 | m2 | m3 | m5 | m6 | m8 | m11 | m12 | m13 | m14;
	assign HEX0[4] = m0 | m2 | m6 | m8 | m10 | m11 | m12 | m13 | m14 | m15;
	assign HEX0[5] = m0 | m4 | m5 | m6 | m8 | m9 | m10 | m11 | m12 | m14 | m15;
	assign HEX0[6] = m2 | m3 | m4 | m5 | m6 | m8 | m9 | m10 | m11 | m13 | m14 | m15;

endmodule 
	
