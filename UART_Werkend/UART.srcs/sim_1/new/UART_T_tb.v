`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 25.11.2021 22:38:55
// Design Name: 
// Module Name: UART_T_tb
//////////////////////////////////////////////////////////////////////////////////

module UART_T_tb();
    reg clk_i;
    reg rstb_i;
    reg tx_start;
    wire txd;
    reg [7:0] data_i;
    
    UART_T DUT(
        .txd(txd),
        .data_i(data_i),
        .tx_start(tx_start),
        .clk_i(clk_i),
        .rstb_i(rstb_i));
    
    initial begin
        clk_i = 0;
        forever
            #4 clk_i = ~clk_i; 
    end
    
    initial begin
        rstb_i = 0;
        tx_start = 0;
        #100 rstb_i = 1;
        #100
        
        forever begin
            #($urandom % 500) data_i = $urandom;
            #10 tx_start = 1;
            #10 tx_start = 0;
            #1800000;
        end
    end
endmodule
