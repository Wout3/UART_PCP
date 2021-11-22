`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 15.11.2021 19:17:34
// Design Name: 
// Module Name: UART_Receiver_tb
//////////////////////////////////////////////////////////////////////////////////


module UART_Receiver_tb();
    reg clk_i;
    reg rstb_i;
    wire [7:0] data;
    wire data_o_valid;
    wire [7:0] data_o;
    wire [3:0] state;
  /*  wire midbit_en;
    wire shift_en;
    wire midbit;
    wire baudx16; */
    wire RxD;
    
    UART_Receiver DUT(
        
        .clk_i(clk_i),
        .rstb_i(rstb_i),
        .RxD(RxD),
      /*  .midbit_en(midbit_en),
        .state(state),
        .midbit(midbit),
        .shift_en(shift_en),
        .baudx16(baudx16),*/
        .data_o(data_o),
        .data_o_valid( data_o_valid)
        );
    
    uartgen uartgen (
        .tx(RxD),
        .data(data));
        
    initial begin
        rstb_i = 0;
        clk_i = 0;
        forever
            #4 clk_i = ~clk_i; 
    end
    
    initial begin
       rstb_i = 0;
       #100 rstb_i = 1;
    end    
endmodule
