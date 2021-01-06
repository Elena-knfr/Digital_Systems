`timescale 1ns / 1ps

module main(SW, KEY, LEDR);
    input [9:0]SW;
    input [3:0]KEY;
    output [9:0]LEDR;

    wire w, clock, resetn, out_light;
    
    reg [3:0]PS, NS; // PS represents current state, NS represents next state
    
    localparam A = 4'b0000, B = 4'b0001, C = 4'b0010, D = 4'b0011, E = 4'b0100, F = 4'b0101, G = 4'b0110;
    
    assign w = SW[1]; //input
    assign clock = ~KEY[0];
    assign resetn = SW[0]; //active low synch reset

    //State table
    //The state table should only contain the logic for state transitions
    //Do not mix in any output logic. The output logic should be handled separately.
    //This will make it easier to read, modify and debug the code.
    always@(*)
    begin 
        case(PS)
            A: begin
                   if (!w) NS = A;
                   else NS = B;
               end
            B: begin
                   if(!w) NS = A;
                   else NS = C;
               end
            C: begin
                   if (!w) NS = E;
                   else NS = D;
               end
            D: begin
                   if (!w) NS = E;
                   else NS = F;
               end
            E: begin
                   if (!w) NS = A;
                   else NS = G;
               end
            F: begin
                   if (!w) NS = E;
                   else NS = F;
               end
            G: begin
                   if (!w) NS = A;
                   else NS = C;
               end
            default: NS = A;
        endcase
    end 
    
    // State Registers
    always @(posedge clock)
    begin 
        if(resetn == 1'b0)
            PS <= A; // Should set reset state to state A
        else
            PS <= NS;
    end 

    // Output logic
    // Set out_light to 1 to turn on LED when in relevant states
    assign out_light = ((PS == F) | (PS == G));

    assign LEDR[9] = out_light; //output z
    assign LEDR[3:0] = PS;
endmodule
