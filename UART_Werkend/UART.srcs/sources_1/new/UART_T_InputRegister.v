`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 25.11.2021 22:20:04
// Design Name: 
// Module Name: UART_T_InputRegister
//////////////////////////////////////////////////////////////////////////////////


module UART_T_InputRegister(
    input clk_i,
    input rstb_i,
    input [7:0] data_i,
    input tx_start,
    output reg [7:0] data
    );
    
    always @(posedge clk_i, negedge rstb_i, posedge tx_start) begin
        if (rstb_i == 1'b0)
            data <= 0;
        else if (tx_start == 1'b1)
            data <= data_i;
    end
endmodule

