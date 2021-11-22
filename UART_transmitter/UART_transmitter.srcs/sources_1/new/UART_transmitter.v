`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/22/2021 10:59:46 AM
// Design Name: 
// Module Name: UART_transmitter
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


module UART_transmitter(
        input wire clk_i,
        input wire rstb_i,
        input wire [7:0]data_i,
        input wire baud,
        input wire tx_start,
        output reg txd
    );
    
        
    baud_gen (
        .clk_i             (clk_i),        
        .baud              (baud),
        .rstb_i            (rstb_i));
   
    input_register (
        .clk_i             (clk_i),       
        .rstb_i            (rstb_i),
        .data              (data),
        .data_i              (data_i),
        .tx_start          (tx_start));
        
    FSM (
        .clk_i             (clk_i),        
        .baud              (baud),
        .rstb_i            (rstb_i),
        .data              (data),
        .tx_start          (tx_start),
        .txd               (txd));
        
        
endmodule
