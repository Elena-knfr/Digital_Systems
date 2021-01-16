`timescale 1ns / 1ps
`default_nettype none

module top(SW, LEDR);
    input [9:0]SW;
    output [9:0]LEDR;
    
    mux2to1 u0(SW[0], SW[1], SW[9], LEDR[0]);

endmodule

module mux2to1(x, y, s, m);
    input x; //select 0
    input y; //select 1
    input s; //select signal
    output m; //output
  
    //assign m = s & y | ~s & x;
    // OR
    assign m = s ? y : x;

endmodule
