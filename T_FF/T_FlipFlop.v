
module T_FF(Clock, Clear_b, T, Q);
	input Clock, Clear_b, T;
	output reg Q;
	reg xoring;
	
	always @ (*)
	begin
		xoring = T ^ Q;
	end
	
	always@(posedge Clock)
	begin
		if(Clear_b == 1'b0) 
			Q <= 1'b0;
		else
			Q <= xoring;
	end
endmodule
