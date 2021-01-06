
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
