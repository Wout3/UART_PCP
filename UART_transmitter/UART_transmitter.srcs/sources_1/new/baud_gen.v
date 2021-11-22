`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/08/2021 11:19:32 AM
// Design Name: 
// Module Name: baud_gen
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module baud_gen
    #(
        parameter CLOCK_RATE = 125000000,
        parameter BAUD_RATE = 9600
    )(
        input  clk_i,
        input  rstb_i,
        output  reg baud = 0
    );
    
    localparam THRESHOLD = CLOCK_RATE/BAUD_RATE;
    
    integer rxCounter = 0;
    
    always @ (posedge clk_i, negedge rstb_i) begin
        if (!rstb_i) begin
            baud <= 0;
            rxCounter <= 0;
        end else begin
            if (rxCounter >= 13) begin
                rxCounter <= 0;
                baud <= 1;
            end else begin
                rxCounter = rxCounter + 1;
                baud <= 0;
            end
        end
    end
        
endmodule
