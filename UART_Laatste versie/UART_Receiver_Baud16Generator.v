`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 15.11.2021 11:33:04
// Design Name: 
// Module Name: UART_Receiver_Baud16Generator
//////////////////////////////////////////////////////////////////////////////////

module UART_Receiver_Baud16Generator(
    input		clk_i,		     // 125 MHz clock
    input		rstb_i,		    // reset
    output      reg	baudx16		// baud signal 125MHz / 813 = 153,7 kHz
    );

integer counter = 0;

always @ (posedge clk_i, negedge rstb_i) begin : baud16_generator
	if (!rstb_i) begin
		counter <= 0;
		baudx16 <= 0;
	end else if (counter >= 813) begin
		baudx16 <= 1;
		counter <= 0;
	end else begin
		baudx16 <= 0;
		counter <= counter + 1;
	end
end 

endmodule 