`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 25.11.2021 22:11:43
// Design Name: 
// Module Name: UART
//////////////////////////////////////////////////////////////////////////////////

module UART(
    input clk_i,
    input rstb_i,
    input [3:0] switches,
    input rxd,
    
    output txd,
    output reg [3:0] leds
    );

    wire [7:0] data_i;
    wire tx_start;
    wire txd_int;
    wire [7:0] data_o;
    wire data_o_valid;

    UART_T Transmitter (.data_i(data_i),.tx_start(tx_start),.txd(txd_int),.clk_i(clk_i),.rstb_i(rstb_i));
    UART_R Receiver (.data_o(data_o),.data_o_valid(data_o_valid),.rxd(rxd),.clk_i(clk_i),.rstb_i(rstb_i));
    UART_SwitchMonitor Switch_monitor (.data_i(data_i),.tx_start(tx_start),.switches(switches),.clk_i(clk_i),.rstb_i(rstb_i));
    UART_txd_register Txd_reg (.txd(txd),.txd_int(txd_int),.rstb_i(rstb_i),.clk_i(clk_i));
    
    always @(posedge data_o_valid) begin
        leds <= data_o;
    end
    
endmodule
