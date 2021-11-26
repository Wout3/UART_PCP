`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 25.11.2021 22:38:06
// Design Name: 
// Module Name: UART_R_tb
//////////////////////////////////////////////////////////////////////////////////


module UART_R_tb();
    reg clk_i;
    reg rstb_i;
    wire [7:0] data;
    wire  data_o_valid;
    wire [7:0] data_o;
    wire rxd;
    
    UART_R DUT(
        .clk_i(clk_i),
        .rstb_i(rstb_i),
        .rxd(rxd),
        .data_o(data_o),
        .data_o_valid( data_o_valid));
    
    uartgen uartgen (
        .tx(rxd),
        .data(data));
        
    initial begin
        clk_i = 0;
        forever
            #4 clk_i = ~clk_i; 
    end
    
    initial begin
       rstb_i = 0;
       #100 rstb_i = 1;
    end    
endmodule

