`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 25.11.2021 22:13:52
// Design Name: 
// Module Name: UART_SwitchMonitor
//////////////////////////////////////////////////////////////////////////////////

module UART_SwitchMonitor(
    input clk_i,
    input rstb_i,
    input [3:0] switches,
    
    output reg [7:0] data_i,
    output reg tx_start
    );
   
    reg [3:0] switches_prev;
    
    always @(posedge clk_i, negedge rstb_i) begin
         if (!rstb_i) begin   
            switches_prev <= 0;
            tx_start <= 0;
         end else if (switches != switches_prev ) begin
            tx_start <= 1;
            switches_prev <= switches;
            data_i <= switches;
         end else
            tx_start <= 0;
    end
endmodule

