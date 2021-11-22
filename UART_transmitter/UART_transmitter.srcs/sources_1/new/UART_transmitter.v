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
        input  clk_i,
        input  rstb_i,
        input  [7:0]data_i,
        input  tx_start,
        output  txd
    );
    
    wire [7:0] data;
    wire baud;
        
    baud_gen Baug_gen(
        .clk_i             (clk_i),        
        .baud              (baud),
        .rstb_i            (rstb_i));
   
    input_register input_register (
        .clk_i             (clk_i),       
        .rstb_i            (rstb_i),
        .data              (data),
        .data_i              (data_i),
        .tx_start          (tx_start));
        
    FSM FSM(
        .clk_i             (clk_i),        
        .baud              (baud),
        .rstb_i            (rstb_i),
        .data              (data),
        .tx_start          (tx_start),
        .txd               (txd));
        
        
endmodule
