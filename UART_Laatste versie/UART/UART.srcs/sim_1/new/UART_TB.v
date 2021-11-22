`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/15/2021 11:29:19 AM
// 
//////////////////////////////////////////////////////////////////////////////////


module UART_TB();
    reg clk_i;
    reg rstb_i;
    reg [7:0] data_i;
    wire [7:0] data_o;
    reg Tx_start;
    
    UART DUT(.data_i(data_i),.data_o(data_o),.rstb_i(rstb_i),.clk_i(clk_i),.Tx_start ( Tx_start));
    
    initial begin
        clk_i = 0;
        forever
            #4 clk_i = ~clk_i; 
    end
    
    initial begin
        rstb_i = 0;
        Tx_start = 0;
        #100 rstb_i = 1;
        #100
        
        forever begin
            #100 data_i = $urandom;
            #100 Tx_start = 1;
            #10 Tx_start = 0;
            #1000000;
        end
    end
    
endmodule


