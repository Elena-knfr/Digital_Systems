//To derive the slower flashing rates, should use a counter, call it RateDivider, which is
//clocked with the 5 KHz clock. The output of RateDivider can be used as part of a circuit
//to create pulses at the required rates.

//Every time RateDivider has counted the appropriate
//number of clock pulses, a pulse should be generated for one clock cycle.

module RateDivider(Clock, Sel, Resetn, Enable);
	input [1:0] Sel;
	input Clock, Resetn;
	output Enable;
	reg [27:0] rate, counter; // 28 bits gets you to 256M
	
	always @(posedge Clock) //determines rate of counting
	begin
		case (Sel)
			2'b00: rate <= 1; //operate at full speed: 5 KHz / 5000 = 1
			2'b01: rate <= 5000; //operate at 1 Hz: 5 KHz / 1 = 5000
			2'b10: rate <= 10000; //operate at 0.5 Hz: 5 KHz / 0.5 = 10000
			2'b11: rate <= 20000; //operate at 0.25 Hz: 5 KHz / 0.25 = 20000
			default: rate <= 1;
		endcase // case (Sel)
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
