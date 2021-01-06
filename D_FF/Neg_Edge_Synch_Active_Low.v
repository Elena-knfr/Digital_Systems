
module NegEdge_SyncActiveLow(d, clock, resetn, q);
    input d, clock, resetn;
    output reg q;
	 
    always@(negedge clock) 
        begin
            if (resetn == 1'b0)
                q <= 0; 
            else
                q <= d;
        end
endmodule
