`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 25.11.2021 22:35:29
// Design Name: 
// Module Name: UART_tb
//////////////////////////////////////////////////////////////////////////////////

module UART_tb();
    reg clk_i;
    reg rstb_i;
    reg [3:0] switches;
    reg rxd;
    wire txd;
    wire [3:0] leds;
    
    integer i;

    UART DUT(
        .leds(leds),
        .txd(txd),
        .rxd(rxd),
        .switches(switches),
        .rstb_i(rstb_i),
        .clk_i(clk_i)
        );
    
    always
        #4 clk_i = ~clk_i;
        
    always 
        #1 rxd <= txd;
    
    initial begin
        switches = 4'b0000;
        rstb_i = 1;
        clk_i = 0;
        #1 rstb_i = 0;
        #1 rstb_i = 1;
        
        #500 switches = 4'b1011;
        for (i=0; i<10; i=i+1) begin
            #2000000 switches = $urandom;
        end
        #500000 $finish;
    end
endmodule
