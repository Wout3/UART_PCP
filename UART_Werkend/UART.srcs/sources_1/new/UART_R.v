`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 25.11.2021 22:15:44
// Design Name: 
// Module Name: UART_R
//////////////////////////////////////////////////////////////////////////////////


module UART_R(
    input clk_i,
    input rstb_i,
    input rxd,
    output [7:0] data_o,
    output data_o_valid);
     
    wire baudx16, midbit_en;
    wire midbit,shift_en, load_data_out;
    wire [7:0] shift_reg_data;
    
    UART_R_Baud16Generator Baud16Generator(
        .clk_i(clk_i),
        .baudx16(baudx16),
        .rstb_i(rstb_i));
        
    UART_R_MidbitGenerator MidbitGenerator(
        .clk_i(clk_i),
        .baudx16(baudx16),
        .rstb_i(rstb_i),
        .midbit(midbit),
        .midbit_en(midbit_en)
        );
        
    UART_R_FSM FSM(
        .clk_i(clk_i),
        .midbit(midbit),
        .midbit_en(midbit_en),
        .baudx16(baudx16),
        .rstb_i(rstb_i),
        .rxd(rxd),
        .load_data_out(load_data_out),
        .shift_en(shift_en)
        );
        
    UART_R_ShiftRegister ShiftRegister(
        .clk_i(clk_i),
        .baudx16(baudx16),
        .midbit(midbit),
        .rxd(rxd),
        .rstb_i(rstb_i),
        .shift_en(shift_en),
        .shift_reg_data(shift_reg_data)
        );
        
     UART_R_DataOutRegister DataOutRegister(
        .clk_i(clk_i),
        .rstb_i(rstb_i),
        .shift_reg_data(shift_reg_data),
        .load_data_out(load_data_out),
        .data_o_valid(data_o_valid),
        .data_o(data_o)
     );
        
endmodule

