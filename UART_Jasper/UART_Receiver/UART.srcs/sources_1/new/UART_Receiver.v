`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 15.11.2021 19:23:44
// Design Name: 
// Module Name: UART_Receiver
//////////////////////////////////////////////////////////////////////////////////

module UART_Receiver(
	input RxD,
    input clk_i,
    input rstb_i,
    output [7:0] data_o,
  /* output midbit_en,
   output midbit,
    output shift_en,
    output baudx16,
    output [3:0] state,*/
    output data_o_valid);
    
    wire midbit_en;
    wire midbit;
    wire shift_en;
    wire baudx16;
    wire[7:0] shift_reg_data;
    //wire load_data_out;
    
    UART_Receiver_Baud16Generator Baud16Generator(
        .clk_i(clk_i),
        .rstb_i(rstb_i),
        .baudx16(baudx16)
        );
        
    UART_Receiver_MidBitGenerator MidBitGenerator(
        .clk_i(clk_i),
        .rstb_i(rstb_i),
        .baudx16(baudx16),
        .midbit_en(midbit_en),
        .midbit(midbit));
        
    UART_Receiver_FSM FSM(
        .clk_i(clk_i),
        .rstb_i(rstb_i),
        .baudx16(baudx16),
        .RxD(RxD),
        .midbit(midbit),
        .midbit_en(midbit_en),
        .load_data_out(load_data_out),
        .shift_en(shift_en),
        .state(state)
        );
        
    UART_Receiver_ShiftRegister ShiftRegister(
        .clk_i(clk_i),
        .rstb_i(rstb_i),
        .baudx16(baudx16),
        .midbit(midbit),
        .shift_en(shift_en),
        .RxD(RxD),
        .shift_reg_data(shift_reg_data)
        );
        
     UART_Receiver_DataOutRegister DataOutRegister(
        .clk_i(clk_i),
        .rstb_i(rstb_i),
        .shift_reg_data(shift_reg_data),
        .load_data_out(load_data_out),
        .data_o_valid(data_o_valid),
        .data_o(data_o));
        
endmodule
