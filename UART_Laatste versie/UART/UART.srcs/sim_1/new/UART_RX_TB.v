`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 22.11.2021 19:48:59
// Design Name: 
// Module Name: UART_RX_TB
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


module UART_RX_TB();
    reg clk_i;
    reg rstb_i;
    wire [7:0] data;
    wire  data_o_valid;
    wire [7:0] data_o;
    wire RxD;
    
    UART_Receiver DUT(
        
        .clk_i(clk_i),
        .rstb_i(rstb_i),
        .RxD(RxD),
        .data_o(data_o),
        .data_o_valid( data_o_valid));
    
    uartgen uartgen (
        .tx(RxD),
        .data(data));
        
    initial begin
        clk_i = 0;
        forever
            #4 clk_i = ~clk_i; //125MHz
    end
    
    initial begin
       rstb_i = 0;
       #100 rstb_i = 1;
    end    
endmodule

