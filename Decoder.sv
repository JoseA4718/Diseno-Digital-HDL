`timescale 1ns / 1ps

module Decoder(INgray,OUTbinario);
	input [3:0] INgray;
	output reg [3:0] OUTbinario;
	
//Deco
	always @(INgray)
		case (INgray)
			4'b0000: OUTbinario=4'b0000;
			4'b0001: OUTbinario=4'b0001;
			4'b0011: OUTbinario=4'b0010;
			4'b0010: OUTbinario=4'b0011;
			4'b0110: OUTbinario=4'b0100;
			4'b0111: OUTbinario=4'b0101;
			4'b0101: OUTbinario=4'b0110;
			4'b0100: OUTbinario=4'b0111;
			4'b1100: OUTbinario=4'b1000;
			4'b1101: OUTbinario=4'b1001;
			4'b1111: OUTbinario=4'b1010;
			4'b1110: OUTbinario=4'b1011;
			4'b1010: OUTbinario=4'b1100;
			4'b1011: OUTbinario=4'b1101;
			4'b1001: OUTbinario=4'b1110;
			4'b1000: OUTbinario=4'b1111;
		endcase
endmodule