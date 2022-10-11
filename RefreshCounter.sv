module Cont(clk, rst, Cout);
	input wire clk, rst;
	output reg[18:0] Cout;

always@(posedge clk or posedge rst)
		if(rst)
			Cout = 19'd0;
			
		else if(Cout == 19'd480000)
			Cout = 19'd0;
			
		else 
			Cout = Cout + 19'd1;
 
endmodule
