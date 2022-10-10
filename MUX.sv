`timescale 1ns / 1ps

module MUX2a1(A, B, sel, Y);
input sel;
input [6:0] A, B;
output reg [6:0] Y;

always @(sel or A or B)
	begin
	case (sel)
		1'b0 : Y=A;
		1'b1 : Y=B;
	endcase
	end
endmodule
