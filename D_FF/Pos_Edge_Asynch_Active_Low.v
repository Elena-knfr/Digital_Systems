
module PosEdge_AsyncActiveLow(d, clock, resetn, q);
    input d, clock, resetn;
    output reg q;
	 
    always@(posedge clock, negedge resetn) 
        begin
            if (resetn == 1'b0)
                q <= 0; 
            else
                q <= d;
        end
endmodule
