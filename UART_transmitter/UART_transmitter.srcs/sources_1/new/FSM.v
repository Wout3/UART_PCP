`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/08/2021 12:20:08 PM
// Design Name: 
// Module Name: FSM
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


module FSM(
        input wire clk_i,
        input wire rstb_i,
        input wire [7:0]data,
        input wire baud,
        input wire tx_start,
        output reg txb
    );
    
    localparam S_IDLE  = 4'b0000;
    localparam S_START = 4'b0001;
    localparam S_BIT0  = 4'b0010;
    localparam S_BIT1  = 4'b0011;
    localparam S_BIT2  = 4'b0100;
    localparam S_BIT3  = 4'b0101;
    localparam S_BIT4  = 4'b0110;
    localparam S_BIT5  = 4'b0111;
    localparam S_BIT6  = 4'b1000;
    localparam S_BIT7  = 4'b1001;
    localparam S_STOP  = 4'b1010;
    
    reg [2:0] r_state, r_next_state;
   
    always @ (posedge clk_i, negedge rstb_i ) begin : state_register
      if (~rstb_i) begin
         r_state = S_IDLE;
      end else begin
         r_state = r_next_state;
      end
    end
    
    always @ (tx_start,baud, r_state) begin : next_state_logic
      case (r_state)
        S_IDLE: begin
           if(tx_start) begin
              r_next_state = S_START;
           end else begin
              r_next_state = r_state;
           end
        end
        S_START: begin
           if(baud) begin
              r_next_state = S_BIT0;
           end else begin
              r_next_state = r_state;
           end
        end
        S_BIT0: begin
           if(baud) begin
              r_next_state = S_BIT1;
           end else begin
              r_next_state = r_state;
           end
        end
        S_BIT1: begin
           if(baud) begin
              r_next_state = S_BIT2;
           end else begin
              r_next_state = r_state;
           end
        end
        S_BIT2: begin
           if(baud) begin
              r_next_state = S_BIT3;
           end else begin
              r_next_state = r_state;
           end
        end
        S_BIT4: begin
           if(baud) begin
              r_next_state = S_BIT5;
           end else begin
              r_next_state = r_state;
           end
        end
        S_BIT5: begin
           if(baud) begin
              r_next_state = S_BIT6;
           end else begin
              r_next_state = r_state;
           end
        end
        S_BIT6: begin
           if(baud) begin
              r_next_state = S_BIT7;
           end else begin
              r_next_state = r_state;
           end
        end
        S_BIT7: begin
           if(baud) begin
              r_next_state = S_STOP;
           end else begin
              r_next_state = r_state;
           end
        end
        S_STOP: begin
           if(baud) begin
              r_next_state = S_IDLE;
           end else begin
              r_next_state = r_state;
           end
        end
        default: begin
           r_next_state = S_IDLE;
        end
      endcase  
    end
    
    always @ (r_state) begin : output_logic
      case (r_state)
        S_IDLE: begin
           
        end
        S_START: begin
           
        end
        S_BIT0: begin
           
        end
        S_BIT1: begin
           
        end
        S_BIT2: begin
           
        end
        S_BIT4: begin
           
        end
        S_BIT5: begin
           
        end
        S_BIT6: begin
           
        end
        S_BIT7: begin
           
        end
        S_STOP: begin
           
        end
      endcase  
    end
    
endmodule
