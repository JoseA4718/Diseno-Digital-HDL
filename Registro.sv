`timescale 1ns / 1ps

module registro(clk, rst, load, Data_in, Data_out);
 input clk, rst, load;
 input [3:0] Data_in;
 output reg [3:0] Data_out;


 always @(posedge clk or posedge rst)
 
	if (rst)
		Data_out = 0;
		
	else if (load)
		Data_out = Data_in;
	
	else 
		Data_out = Data_out;
 
endmodule