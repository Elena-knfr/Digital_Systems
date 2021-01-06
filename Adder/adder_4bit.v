module adder_4bit(A, B, Cin, S, Cout);
	input [3:0]A, B;
	input Cin;
	output [3:0]S;
	output Cout;
	wire w1, w2, w3;
	
	FA f0(.a(A[0]), .b(B[0]), .Cin(Cin), .s(S[0]), .Cout(w1));
	FA f1(.a(A[1]), .b(B[1]), .Cin(w1), .s(S[1]), .Cout(w2));
	FA f2(.a(A[2]), .b(B[2]), .Cin(w2), .s(S[2]), .Cout(w3));
	FA f3(.a(A[3]), .b(B[3]), .Cin(w3), .s(S[3]), .Cout(Cout));
	
endmodule

module FA(a, b, cin, s, cout);
	input a, b, cin;
	output s, cout;
	
	assign s = cin ^ a ^ b;
	assign cout = (a & b) | (a & cin) | (b & cin);
	
endmodule

