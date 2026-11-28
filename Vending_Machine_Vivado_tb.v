`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 20.08.2026 19:35:08
// Design Name: 
// Module Name: Vending_Machine_Vivado_tb
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
module Vending_Machine_Vivado_tb;

//inputs
reg clock;
reg [1:0] money;
reg reset;

//output
wire dispense;
wire [1:0] returned_change;

Vending_Machine_Vivado uut(
    .clock(clock),
    .reset(reset),
    .money(money),
    .dispense(dispense),
    .returned_change(returned_change)
);

initial begin

    //initialise inputs
    $dumpfile("vending_machine_18105070.vcd");
    $dumpvars(0,Vending_Machine_Vivado_tb);
    reset = 1;
    clock = 0;

    #6 reset = 0;
    money = 2;
    #19 money = 2;
    #10000 $finish;

end

always #5 clock = ~clock;

endmodule