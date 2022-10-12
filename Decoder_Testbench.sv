`timescale 1ns / 1ps

module Decoder_Testbench(
     );
     
    reg [3:0] sw;
    wire [3:0] led;
    
    Decoder UUT(sw,led);
    
    initial begin
    sw[0] = 0;
    sw[0] = 0;
    sw[0] = 0;
    sw[0] = 0;
    #100;
    
    sw[0] = 1;
    sw[0] = 1;
    sw[0] = 0;
    sw[0] = 1;
    #100;
    
    sw[0] = 1;
    sw[0] = 0;
    sw[0] = 1;
    sw[0] = 1;
    #100;
    
    sw[0] = 1;
    sw[0] = 1;
    sw[0] = 1;
    sw[0] = 1;
    #100;
    
    end
    
    
endmodule
