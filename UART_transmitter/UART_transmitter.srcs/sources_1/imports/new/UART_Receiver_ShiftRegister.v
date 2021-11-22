`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 15.11.2021 11:34:34
// Design Name: 
// Module Name: UART_Receiver_ShiftRegister
//////////////////////////////////////////////////////////////////////////////////

module UART_Receiver_ShiftRegister(
    input clk_i,
    input rstb_i,
	input baudx16,
	input midbit,
	input shift_en,
	//input [3:0] state,
    
    input RxD,
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
                shift[7] <= RxD;
            end
        end
    end
endmodule

