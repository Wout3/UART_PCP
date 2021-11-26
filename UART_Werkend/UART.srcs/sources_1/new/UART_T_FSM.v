`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 25.11.2021 22:19:37
// Design Name: 
// Module Name: UART_T_FSM
//////////////////////////////////////////////////////////////////////////////////


module UART_T_FSM(
    output reg txd,
    output reg Tx_ready,
    input rstb_i,
    input clk_i,
    input tx_start,
    input baud,
    input [7:0] data
    );
    
    localparam S_IDLE           = 4'b0000;
    localparam S_WAIT           = 4'b0001;
    localparam S_START          = 4'b0010;
    localparam S_BIT0           = 4'b0011;
    localparam S_BIT1           = 4'b0100;
    localparam S_BIT2           = 4'b0101;
    localparam S_BIT3           = 4'b0110;
    localparam S_BIT4           = 4'b0111; 
    localparam S_BIT5           = 4'b1000;
    localparam S_BIT6           = 4'b1001;
    localparam S_BIT7           = 4'b1010;
    localparam S_STOP           = 4'b1011;

    reg [3:0] r_state, r_next_state;
    
    always @(posedge clk_i, negedge rstb_i) begin
        if (!rstb_i) begin
            r_state = S_IDLE;
        end else
            r_state <= r_next_state;
    end
  
    always @( tx_start,baud) begin
        r_next_state = r_state;
        case (r_state)
            S_IDLE:begin             
                if (tx_start) begin
                    r_next_state = S_WAIT;
                end
            end
            S_WAIT:begin             
                if (baud) begin
                    r_next_state = S_START;
                end
            end
            S_START:begin             
                if (baud) begin
                    r_next_state = S_BIT0;
                end
            end
            S_BIT0:begin             
                if (baud) begin
                    r_next_state = S_BIT1;
                end
            end
            S_BIT1:begin             
                if (baud) begin
                    r_next_state = S_BIT2;
                end
            end
            S_BIT2:begin             
                if (baud) begin
                    r_next_state = S_BIT3;
                end
            end
            S_BIT3:begin             
                if (baud) begin
                    r_next_state = S_BIT4;
                end
            end
            S_BIT4:begin             
                if (baud) begin
                    r_next_state = S_BIT5;
                end
            end
            S_BIT5:begin             
                if (baud) begin
                    r_next_state = S_BIT6;
                end
            end
            S_BIT6:begin             
                if (baud) begin
                    r_next_state = S_BIT7;
                end
            end
            S_BIT7:begin             
                if (baud) begin
                    r_next_state = S_STOP;
                end
            end
            S_STOP:begin             
                if (baud) begin
                    r_next_state = S_IDLE;
                end
            end
           
            default: begin
                r_next_state = S_IDLE;
            end
        endcase
    end
    
    // Output logic
    always @(r_state) begin
        txd <= 1;
        case (r_state) 
            S_START: begin 
                txd <= 0;
            end
            S_BIT0: begin
                txd <= data[0];  
            end        
            S_BIT1: begin
                txd <= data[1];
            end          
            S_BIT2: begin
                txd <= data[2]; 
            end        
            S_BIT3: begin
                txd <= data[3];
            end        
            S_BIT4: begin
                txd <= data[4]; 
            end        
            S_BIT5: begin
                txd <= data[5];
            end         
            S_BIT6: begin
                txd <= data[6];
            end          
            S_BIT7: begin
                txd <= data[7];
            end                 
        endcase
    end
endmodule
