`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 25.11.2021 22:15:44
// Design Name: 
// Module Name: UART_txd_register
//////////////////////////////////////////////////////////////////////////////////

module UART_txd_register(
    input clk_i,
    input rstb_i,
    input txd_int,
    
    output reg txd
    );
    
    always @(posedge clk_i, negedge rstb_i) begin
        if (!rstb_i)
            txd <= 0;
        else 
            txd <= txd_int;
    end
endmodule
