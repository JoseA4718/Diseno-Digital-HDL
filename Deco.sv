`timescale 1ns / 1ps

module Deco(INgray,OUTbin);
    input [3:0] INgray;
	output reg [3:0] OUTbin;

	always @(INgray)
		case (INgray)
			4'b0000: OUTbin=4'b0000;
			4'b0001: OUTbin=4'b0001;
			4'b0011: OUTbin=4'b0010;
			4'b0010: OUTbin=4'b0011;
			4'b0110: OUTbin=4'b0100;
			4'b0111: OUTbin=4'b0101;
			4'b0101: OUTbin=4'b0110;
			4'b0100: OUTbin=4'b0111;
			4'b1100: OUTbin=4'b1000;
			4'b1101: OUTbin=4'b1001;
			4'b1111: OUTbin=4'b1010;
			4'b1110: OUTbin=4'b1011;
			4'b1010: OUTbin=4'b1100;
			4'b1011: OUTbin=4'b1101;
			4'b1001: OUTbin=4'b1110;
			4'b1000: OUTbin=4'b1111;
		endcase
endmodule
