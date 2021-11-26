`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 25.11.2021 22:17:51
// Design Name: 
// Module Name: UART_R_FSM
//////////////////////////////////////////////////////////////////////////////////


module UART_R_FSM(
    input clk_i,
    input rstb_i,
    input baudx16,
    input rxd,
    input midbit,
    
    output reg shift_en,
    output reg load_data_out, 
    output reg midbit_en
    );
    
    reg [3:0] r_state, r_next_state;
       
    localparam S_IDLE = 4'b0000; 
    localparam S_START = 4'b0001; 
    localparam S_BIT0 = 4'b0010;
    localparam S_BIT1 = 4'b0011; 
    localparam S_BIT2 = 4'b0100; 
    localparam S_BIT3 = 4'b0101; 
    localparam S_BIT4 = 4'b0110; 
    localparam S_BIT5 = 4'b0111; 
    localparam S_BIT6 = 4'b1000; 
    localparam S_BIT7 = 4'b1001; 
    localparam S_STOP = 4'b1010;
    
    always @ (posedge clk_i, negedge rstb_i) begin
        if (!rstb_i) begin
            r_state <= S_IDLE;
        end else begin
            if (baudx16==1'b1) begin
                r_state <= r_next_state;
            end
        end
    end
    
    always @ (rxd, midbit, r_state, r_next_state) begin
        r_next_state = r_state;
        midbit_en <= 1;
        load_data_out <= 0;
        case(r_state)
            S_IDLE : begin
             if (rxd   ==1'b0) begin
                    r_next_state = S_START;
                    midbit_en = 0;
                end
            end
            
            S_START : begin
                if (midbit==1'b1) begin
                    r_next_state = S_BIT0;
                end
            end
            S_BIT0 : begin 
                if (midbit==1'b1) begin
                    r_next_state = S_BIT1;
                end
            end
            
            S_BIT1 : begin
                if (midbit==1'b1) begin
                    r_next_state = S_BIT2;
                end
            end
            
            S_BIT2 : begin
                if (midbit==1'b1) begin
                    r_next_state = S_BIT3;
                end
            end
            
            S_BIT3  : begin
                if (midbit==1'b1) begin
                    r_next_state = S_BIT4;
                end
            end
            
            S_BIT4 : begin 
                if (midbit==1'b1) begin
                    r_next_state = S_BIT5;
                end
            end
            
            S_BIT5 : begin
                if (midbit==1'b1) begin
                    r_next_state = S_BIT6;
                end
            end
            
            S_BIT6 : begin 
                if (midbit==1'b1) begin
                    r_next_state = S_BIT7;
                end
            end
            
            S_BIT7  :  begin
                if (midbit==1'b1) begin
                    r_next_state = S_STOP;
                end
            end
            
            S_STOP    : begin
                if (midbit==1'b1) begin
                    r_next_state = S_IDLE;
                end
            end
            
            default : begin
                r_next_state = S_IDLE;
            end
        endcase
    end
    
    always @ (r_state) begin : output_logic
      case (r_state)
        S_STOP: begin
           shift_en = 1;
        end
        default: begin
           shift_en = 0;
        end
      endcase 
   end 
endmodule
