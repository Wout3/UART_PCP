`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/15/2021 11:29:19 AM
// Design Name: 
// Module Name: FSM_tb
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


module FSM_tb();
    reg clk_i;
    reg rstb_i;
    reg [7:0]data;
    reg baud;
    reg tx_start;
    wire txd;

    FSM DUT (
        .clk_i             (clk_i),        
        .baud              (baud),
        .rstb_i            (rstb_i),
        .data              (data),
        .tx_start          (tx_start),
        .txd               (txd));
        
    initial begin
       clk_i = 0;
       forever
           #(5) clk_i = ~clk_i;       
    end
    
    initial begin
    rstb_i = 1'b1;
    #10;
    rstb_i = 1'b0;
    data = $random;
    $finish();
    end
endmodule
