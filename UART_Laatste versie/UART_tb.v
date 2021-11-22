`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/15/2021 11:29:19 AM
// Design Name: 
// Module Name: FSM_tb
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


module FSM_tb();
    reg clk_i;
    reg rstb_i;
    reg [7:0]data_i;
    reg tx_start;
    wire txd;
    wire [7:0] data_o;
    wire  data_o_valid;
    
    UART DUT (
        .clk_i             (clk_i),        
        .rstb_i            (rstb_i),
        .data_i             (data_i),
        .tx_start          (tx_start),
        .data_o            (data_o),
        .txd                (txd),
        .data_o_valid      (data_o_valid)
       );
        
    initial begin
       clk_i = 0;
       forever
           #(5) clk_i = ~clk_i;       
    end
    
    initial begin
    
    rstb_i = 1'b0;
    tx_start = 0;
    #10;
    
    rstb_i = 1'b1;
    repeat (10) begin
        data_i = $urandom; //8'b01010101;
        tx_start = 1;
        #10;
        tx_start = 0;
    end
    $finish();
    end
endmodule
