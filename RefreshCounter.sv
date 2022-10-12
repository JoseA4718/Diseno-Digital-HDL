module Cont(clk, rst, Cout);
	input wire clk, rst;
	output reg[18:0] Cout;

always@(posedge clk or posedge rst)
		if(rst) begin
			Cout = 19'd0;
		end
		else if (Cout == 19'd480000) begin
			Cout = 19'd0;
		end
		else begin 
			Cout = Cout + 19'd1;
		end
endmodule
