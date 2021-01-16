`timescale 1ns / 1ps
`default_nettype none

module top(SW, LEDR); 
	input[9:0]SW;
	output[9:0]LEDR;

	PosEdge_AsyncActiveHigh u0(SW[0], SW[9], SW[1], LEDR[0]);

endmodule

module PosEdge_AsyncActiveHigh(d, clock, resetp, q);
    input d, clock, resetp;
    output reg q;
	 
    always@(posedge clock, posedge resetp) 
        begin
            if (resetp == 1'b1)
                q <= 0; 
            else
                q <= d;
        end
endmodule
