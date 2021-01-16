`timescale 1ns / 1ps
`default_nettype none

module top(SW, LEDR);
    input [9:0]SW;
    output [9:0]LEDR;
    
	mux7to1 u0(SW[6:0], SW[9:8], LEDR[0]);

endmodule

module mux7to1(in, sel, out);
    input [6:0]in;
    input [2:0]sel; //select signal
    output reg out;
	 
    always@(*)
        case(sel)
            3'b000 : out = in[0];
            3'b001 : out = in[1];
            3'b010 : out = in[2];
            3'b011 : out = in[3];
            3'b100 : out = in[4];
            3'b101 : out = in[5];
            3'b110 : out = in[6];
            default : out = in[0];
        endcase
endmodule
