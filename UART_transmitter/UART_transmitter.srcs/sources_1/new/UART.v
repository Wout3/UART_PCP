`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 22.11.2021 12:08:08
// Design Name: 
// Module Name: UART
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

module UART(
        input  clk_i,
        input  rstb_i,
        input  [7:0]data_i,
        input  tx_start,
        output  txd,
        output  [7:0]data_o,
        output data_o_valid
    );
    
    //wire  Rxd;
        
    UART_transmitter Transmitter(    
        .clk_i             (clk_i),        
        .rstb_i            (rstb_i),
        .tx_start           (tx_start),
        .data_i             (data_i),
        .txd                (txd)
        );
   
    UART_Receiver Receiver(
        .clk_i             (clk_i),       
        .rstb_i            (rstb_i),
        .RxD               (txd),
        .data_o            (data_o),
        .data_o_valid          (data_o_valid)
        );
        
endmodule
