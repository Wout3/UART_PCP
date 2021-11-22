`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 22.11.2021 12:08:08
// 
//////////////////////////////////////////////////////////////////////////////////

module UART(
    input clk_i,
    input rstb_i,
    input [7:0] data_i,
    output  [7:0] data_o,
    input Tx_start
    );

    wire txd;
    wire data_o_valid;

    UART_transmitter transmitter (
    .data_i(data_i),
    .tx_start(Tx_start),
    .txd(txd),
    .clk_i(clk_i),
    .rstb_i(rstb_i)
    );
    
    UART_Receiver receiver (
    .data_o(data_o),
    .data_o_valid(data_o_valid),
    .RxD(txd),
    .clk_i(clk_i),
    .rstb_i(rstb_i)
    );
    
endmodule
