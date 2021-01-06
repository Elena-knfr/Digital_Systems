
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
