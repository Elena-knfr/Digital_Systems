
module NegEdge_AsyncActiveLow(d, clock, resetn, q);
    input d, clock, resetn;
    output reg q;
	 
    always@(negedge clock, negedge resetn) 
        begin
            if (resetn == 1'b0)
                q <= 0; 
            else
                q <= d;
        end
endmodule
