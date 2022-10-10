`timescale 1ns / 1ps

module Display_0(in, out);
    input [3:0] in;
    output [6:0] out;
        assign out = (in==4'd0)? 7'b1000000:
                         (in==4'd1)? 7'b1111001:
                         (in==4'd2)? 7'b0100100:
                         (in==4'd3)? 7'b0110000:
                         (in==4'd4)? 7'b0011001:
                         (in==4'd5)? 7'b0010010:
                         (in==4'd6)? 7'b0000010:
                         (in==4'd7)? 7'b1111000:
                         (in==4'd8)? 7'b0000000:
                         (in==4'd9)? 7'b0011000: 
                         (in==4'd10)? 7'b1000000:
                         (in==4'd11)? 7'b1111001:
                         (in==4'd12)? 7'b0100100:
                         (in==4'd13)? 7'b0110000:
                         (in==4'd14)? 7'b0011001:
                         (in==4'd15)? 7'b0010010:7'b1111111;
endmodule
