module mux2to1_2bit(x, y, s, m);
	input [1:0]x, y;
	input s;
	output [1:0]m;

	assign m[0] = (~s&x[0]) | (s&y[0]);   
	assign m[1] = (~s&x[1]) | (s&y[1]);

	// mux2to1 u0(x[0], y[0], s, m[0]);  instantiation by port: ordering is important
	// mux2to1 u1(x[1], y[1], s, m[1]);
	
	// mux2to1 u0(.x(x[0]), .y(y[0]), .s(s), .m(m[0])); instantiation by name: ordering is not important
	// mux2to1 u1(.x(x[1]), .y(y[1]), .s(s), .m(m[1])); 

	endmodule 
