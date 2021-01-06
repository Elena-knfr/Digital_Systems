
module PosEdge_SyncActiveHigh(d, clock, resetp, q);
    input d, clock, resetp;
    output reg q;
	 
    always@(posedge clock) 
        begin
            if (resetp == 1'b1)
                q <= 0; 
            else
                q <= d;
        end
endmodule
