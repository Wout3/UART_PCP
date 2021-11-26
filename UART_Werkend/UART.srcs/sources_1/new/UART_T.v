`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 25.11.2021 22:15:44
// Design Name: 
// Module Name: UART_T
//////////////////////////////////////////////////////////////////////////////////

module UART_T(
    input clk_i,
    input rstb_i,
    input [7:0] data_i,
    input tx_start,
    
    output txd
    );
    
    wire baud;
    wire [7:0] data;
    
    UART_T_BaudGenerator BaudGenerator (
        .baud(baud),
        .clk_i(clk_i),
        .rstb_i(rstb_i)
        );
                                    
    UART_T_InputRegister InputRegister (
        .data(data),
        .tx_start(tx_start),
        .data_i(data_i),
        .clk_i(clk_i),
        .rstb_i(rstb_i)
        );
    
    UART_T_FSM FSM (
        .txd(txd),
        .data(data),
        .tx_start(tx_start),
        .clk_i(clk_i),
        .rstb_i(rstb_i),
        .baud(baud)
        );
endmodule
