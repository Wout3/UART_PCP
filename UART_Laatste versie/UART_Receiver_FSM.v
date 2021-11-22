`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 15.11.2021 11:34:34
// Design Name: 
// Module Name: UART_Receiver_FSM
//////////////////////////////////////////////////////////////////////////////////

module UART_Receiver_FSM(
    input clk_i,
    input rstb_i,
    input baudx16,
    input RxD,
    input midbit,
    output reg shift_en, 
    //output reg [3:0] state,
    output reg midbit_en,
    output reg load_data_out 
    );
    
    
    reg [3:0] state, state_reg_next;
       
    localparam sIDLE = 4'b0000; 
    localparam sSTARTBIT = 4'b0001; 
    localparam sBIT0 = 4'b0010; 
    localparam sBIT1 = 4'b0011; 
    localparam sBIT2 = 4'b0100; 
    localparam sBIT3 = 4'b0101; 
    localparam sBIT4 = 4'b0110; 
    localparam sBIT5 = 4'b0111; 
    localparam sBIT6 = 4'b1000; 
    localparam sBIT7 = 4'b1001; 
    localparam sSTOPBIT = 4'b1010;
    
     // Next state logic
    always @ (posedge clk_i, negedge rstb_i) begin
        if (!rstb_i) begin
            state <= sIDLE;
        end else begin
            if (baudx16==1'b1) begin
                state <= state_reg_next;
            end
        end
    end
    
    always @ (RxD, midbit, state, state_reg_next) begin
        state_reg_next = state;
        midbit_en = 1;
        load_data_out = 0;
        case(state)
            sIDLE       : begin
                if (RxD   ==1'b0) begin
                    state_reg_next = sSTARTBIT;
                    midbit_en = 0;
                end
            end
            sSTARTBIT   : if (midbit==1'b1) state_reg_next = sBIT0;
            sBIT0       : if (midbit==1'b1) state_reg_next = sBIT1;
            sBIT1       : if (midbit==1'b1) state_reg_next = sBIT2;
            sBIT2       : if (midbit==1'b1) state_reg_next = sBIT3;
            sBIT3       : if (midbit==1'b1) state_reg_next = sBIT4;
            sBIT4       : if (midbit==1'b1) state_reg_next = sBIT5;
            sBIT5       : if (midbit==1'b1) state_reg_next = sBIT6;
            sBIT6       : if (midbit==1'b1) state_reg_next = sBIT7;
            sBIT7       : if (midbit==1'b1) state_reg_next = sSTOPBIT;
            sSTOPBIT    : if (midbit==1'b1) begin
                state_reg_next = sIDLE;
                load_data_out = 1;
                end
                
            default     :                   state_reg_next = sIDLE;
        endcase
    end
    
    //Output logic

   always @ (state) begin : output_logic
      case (state)
        
        sSTOPBIT: begin
           shift_en = 1;
        end
        default: begin
           shift_en = 0;
        end

      endcase 
   end 
   
   
endmodule