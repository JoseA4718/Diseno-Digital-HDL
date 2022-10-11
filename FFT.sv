module FFT(clk, rst, T, Q);
	input clk, rst, T; 
	output reg Q;  
  
  always @ (posedge clk or posedge rst) 
   
    if (rst)  
      Q = 1;  
    else if (T)  
      Q = ~Q;  
    else  
      Q = Q;  
   
  
endmodule
