`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 19.08.2026 15:02:13
// Design Name: 
// Module Name: Vending_Machine_Vivado
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////
module Vending_Machine_Vivado(
    input clock,
    input reset,
    input [1:0] money, // 01 = 5 rs, 10 = 10 rs
    output reg dispense,
    output reg [1:0] returned_change
);

parameter s0 = 2'b00;
parameter s1 = 2'b01;
parameter s2 = 2'b10;

reg [1:0] current_state, next_state;

always @(posedge clock)
begin
    if (reset == 1)
    begin
        current_state = 0;
        next_state = 0;
        returned_change = 2'b00;
    end
    else
        current_state = next_state;

    case(current_state)

        s0: // state 0 : 0 rs
        if(money == 0)
        begin
            next_state = s0;
            dispense = 0;
            returned_change = 2'b00;
        end
        else if(money == 2'b01)
        begin
            next_state = s1;
            dispense = 0;
            returned_change = 2'b00;
        end
        else if(money == 2'b10)
        begin
            next_state = s2;
            dispense = 0;
            returned_change = 2'b00;
        end

        s1: // state 1 : 5 rs
        if(money == 0)
        begin
            next_state = s0;
            dispense = 0;
            returned_change = 2'b01;
        end
        else if(money == 2'b01)
        begin
            next_state = s2;
            dispense = 0;
            returned_change = 2'b00;
        end
        else if(money == 2'b10)
        begin
            next_state = s0;
            dispense = 1;
            returned_change = 2'b00;
        end

        s2: // state 2 : 10 rs
        if(money == 0)
        begin
            next_state = s0;
            dispense = 0;
            returned_change = 2'b10;
        end
        else if(money == 2'b01)
        begin
            next_state = s0;
            dispense = 1;
            returned_change = 2'b00;
        end
        else if(money == 2'b10)
        begin
            next_state = s0;
            dispense = 1;
            returned_change = 2'b01;
        end

    endcase
end

endmodule
