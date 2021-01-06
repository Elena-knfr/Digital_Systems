`timescale 1ps/1ps

module MorseEncoder(input [2:0] SW,
					input [1:0] KEY,
					input CLOCK_50,
					output [9:0] LEDR);
					
	parameter [13:0]  A = 12'b101110000000, B =12'b111010101000 , 
							C = 12'b111010111010, D = 12'b111010100000, E = 12'b100000000000, 
							F = 12'b101011101000, G = 12'b111011101000, H = 12'b101010100000;
	wire w2;
	reg [11:0] w3;
	
	RateDivider r0(CLOCK_50, KEY[0], w2);
	
	always@(*)begin
		case(SW[2:0])
			3'b000:  w3 <= A;
			3'b001:  w3 <= B;
			3'b010:  w3 <= C;
			3'b011:  w3 <= D;
			3'b100:  w3 <= E;
			3'b101:  w3 <= F;
			3'b110:  w3 <= G;
			3'b111:  w3 <= H;
		endcase
	end
	
	shift_register_12bit U2(CLOCK_50, w2, KEY[0], KEY[1], w3, LEDR[0]);
	
endmodule

module RateDivider(Clock, Resetn, Enable);
	input Clock, Resetn;
	output Enable;
	reg [27:0] rate, counter; // 28 bits gets you to 256M
	
	always @(posedge Clock)	//determines rate of counting
	begin
		rate <= 2500; //
	end
	always @(posedge Clock)
	begin
		if(Resetn == 1'b0) //reset
			counter <= rate-1;
		else if(counter == 0) // enable turns on and counter resets
			counter <= rate-1;
		else //counts down
			counter <= counter - 1;
 
	end
	
	assign Enable = (counter == 0) ? 1'b1: 1'b0;
endmodule

module shift_register_12bit(input clk, enable, resetn, loadn,
					input [11:0] data,
					output out);
	reg [11:0] Q = {12{1'b0}};
	
	always@(posedge clk) begin
		if(resetn==0)
			Q<=0;
		else if(loadn==0) begin
			Q<=data;
		end
		
		else if(enable) begin
			Q[11] <= 1'b0;
			Q[10] <= Q[11];
			Q[9] <= Q[10];
			Q[8] <= Q[9];
			Q[7] <= Q[8];
			Q[6] <= Q[7];
			Q[5] <= Q[6];
			Q[4] <= Q[5];
			Q[3] <= Q[4];
			Q[2] <= Q[3];
			Q[1] <= Q[2];
			Q[0] <= Q[1];
		end
	end
	assign out = Q[0];
endmodule
