`timescale 1us/1ps
module uartgen
  # ( 
      parameter integer BAUD_RATE = 9600
      )
   (
    output       tx,
    output [7:0] data
    );

   localparam ONE_SEC = 1_000_000;   
   
   reg [7:0]     data; // Register om data in te bewaren
   reg           tx=1; // TX begint hoog
   
   initial begin       
      forever begin
         // Wacht voor een willekeurige tijd
         // En genereer dan een willekeurige data
         #($urandom % 50) data = $random;
         #(ONE_SEC/BAUD_RATE) tx=0; //startbit
         #(ONE_SEC/BAUD_RATE) tx=data[0]; //bit0
         #(ONE_SEC/BAUD_RATE) tx=data[1]; //bit1
         #(ONE_SEC/BAUD_RATE) tx=data[2]; //bit2
         #(ONE_SEC/BAUD_RATE) tx=data[3]; //bit3
         #(ONE_SEC/BAUD_RATE) tx=data[4]; //bit4
         #(ONE_SEC/BAUD_RATE) tx=data[5]; //bit5
         #(ONE_SEC/BAUD_RATE) tx=data[6]; //bit6
         #(ONE_SEC/BAUD_RATE) tx=data[7]; //bit7
         #(ONE_SEC/BAUD_RATE) tx=1; //stop       
         
         #(ONE_SEC/BAUD_RATE) tx=1; //stop    
      end  
   end
endmodule
