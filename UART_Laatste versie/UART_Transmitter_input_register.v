`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/08/2021 12:20:08 PM
// Design Name: 
// Module Name: input_register
//////////////////////////////////////////////////////////////////////////////////


module UART_Transmitter_input_register(
        input wire clk_i,
        input wire rstb_i,
        input wire [7:0]data_i,
        input wire tx_start,
        output reg [7:0]data
    );
    
    always @ (posedge clk_i, negedge rstb_i, posedge tx_start) begin
        if (!rstb_i)begin
            data <=0;
        end else begin
            if(tx_start == 1'b1) begin
                data <= data_i;
            end
        end
    end
    
endmodule
