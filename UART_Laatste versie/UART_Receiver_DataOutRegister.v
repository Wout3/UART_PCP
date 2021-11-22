`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 15.11.2021 11:34:34
// Design Name: 
// Module Name: UART_Receiver_DataOutRegister
//////////////////////////////////////////////////////////////////////////////////


module UART_Receiver_DataOutRegister(
    input clk_i,
    input rstb_i,
    input [7:0] shift_reg_data,
    input load_data_out, 
    output reg data_o_valid,
    output reg [7:0] data_o
);
     
    always @(posedge clk_i,negedge rstb_i) begin 
        if (!rstb_i) begin
            data_o <= 0;
            data_o_valid <= 1;
        end else begin
            if(shift_reg_data [7:0] != data_o [7:0]) begin
                data_o [7:0] <= shift_reg_data [7:0];
                data_o_valid <= 1;
            end else begin
                data_o_valid <= 0;
            end
        end
    end
endmodule
