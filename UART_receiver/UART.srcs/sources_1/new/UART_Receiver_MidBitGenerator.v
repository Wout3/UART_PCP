`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 15.11.2021 11:34:34
// Design Name: 
// Module Name: UART_Receiver_MidBitGenerator
//////////////////////////////////////////////////////////////////////////////////

module UART_Receiver_MidBitGenerator(
    input clk_i,
    input rstb_i,
    input midbit_en,
    input baudx16,
    output reg midbit
    );
    
    reg [3:0] counter;
    
    always @(posedge clk_i) begin
        if(!rstb_i  || counter == 16 || midbit_en == 0) begin
            counter <= 0;
            midbit <= 0;
        end
        else if (baudx16 == 1 && counter == 7) begin
            counter <= counter +1;
            midbit <= 1;
        end
        else if (baudx16 == 1 && counter != 7) begin
            counter <= counter + 1;
            midbit <= 0;
        end
    end
endmodule