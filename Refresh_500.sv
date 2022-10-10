`timescale 1ns / 1ps

module Refresh_500(clk, rst, Q);
    input wire clk, rst;
	output reg Q;
	reg [24:0] Cout;

always@(posedge clk or posedge rst)
		if(rst)
		begin 
			Cout = 25'd0;
			Q = 1'b0;
		end
				
		else if(Cout == 25'd25000000)
		begin 
			Cout = 25'd0;
			Q = 1'b1;
		end
			
		else 
		begin 
			Cout = Cout + 25'd1;
			Q = 1'b0;
		end

endmodule
