`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 25.11.2021 22:18:54
// Design Name: 
// Module Name: UART_R_ShiftRegister
//////////////////////////////////////////////////////////////////////////////////

module UART_R_ShiftRegister(
    input clk_i,
    input rstb_i,
	
	input baudx16,
	input midbit,
	
	input shift_en,
    input rxd,
    output reg [7:0] shift_reg_data
    );
	
	reg [7:0] shift; 
    
    always @(posedge clk_i) begin
        if(rstb_i == 0) begin
            shift_reg_data <= 0;
        end
        else if (midbit == 1 && baudx16 == 1) begin
            if (shift_en) begin
                shift_reg_data <= shift;
            end
            else begin
                shift[6:0] <= shift[7:1];
                shift[7] <= rxd;
            end
        end
    end
endmodule

