`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/08/2021 11:38:55 AM
// Design Name: 
// Module Name: baud_gen_tb
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


module baud_gen_tb();
    reg clk_i;
    reg rstb_i;
    wire baud;

    baud_gen DUT (
        .clk_i             (clk_i),        
        .baud              (baud),
        .rstb_i            (rstb_i));
        
    initial begin
       clk_i = 0;
       forever
           #(5) clk_i = ~clk_i;       
    end
        
    initial begin
    rstb_i = 1'b1;
    #10;
    rstb_i = 1'b0;
    #500;
    $finish();
    end
endmodule
