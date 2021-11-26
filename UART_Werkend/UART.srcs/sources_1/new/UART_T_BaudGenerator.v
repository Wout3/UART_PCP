`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 25.11.2021 22:10:06
// Design Name: 
// Module Name: UART_T_BaudGenerator
//////////////////////////////////////////////////////////////////////////////////

module UART_T_BaudGenerator
    #(
        parameter CLOCK_RATE = 125000000,
        parameter BAUD_RATE = 9600
    )(
        input  clk_i,
        input  rstb_i,
        output  reg baud = 0
    );
    
    localparam THRESHOLD = CLOCK_RATE/BAUD_RATE;
    reg [13:0] rxCounter;
    
    always @(posedge clk_i, negedge rstb_i) begin
        if (!rstb_i) begin
            baud <= 0;
            rxCounter <= 0;
        end else begin
            if (rxCounter >= THRESHOLD) begin
                baud <= 1;
                rxCounter <= 0;
            end else begin
                baud <= 0;
                rxCounter <= rxCounter + 1;
            end
       end
   end
endmodule
