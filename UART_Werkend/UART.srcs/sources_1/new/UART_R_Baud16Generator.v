`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 25.11.2021 22:17:05
// Design Name: 
// Module Name: UART_R_Baud16Generator
//////////////////////////////////////////////////////////////////////////////////

module UART_R_Baud16Generator(
    input clk_i,
    input rstb_i,
    output reg baudx16
    );
    
    integer counter = 0;
    
    always @(posedge clk_i, negedge rstb_i) begin
        if(!rstb_i) begin
            baudx16 <= 0;
            counter <= 0;
        end else if(counter >= 813) begin
                baudx16 <= 1;
                counter <= 0;    
            end
            else begin
                baudx16 <= 0;
                counter <= counter + 1;
            end
        end
endmodule

