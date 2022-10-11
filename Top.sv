module Top(clk, rst, Data_in, outDisplay, OUTbinario, Q1, Q2, an3, an4);
	input clk, rst;
	input [3:0] Data_in;
	output wire Q1, Q2, an3, an4;
	output wire [6:0] outDisplay;
	output wire [3:0] OUTbinario;

	wire [3:0] INgray;
	wire [6:0] A, B;
	wire Q;
	
	Decoder DecoGray_Binario(INgray,OUTbinario);
	
	registro Registro_Entrada(clk, rst, Q, Data_in, INgray);
	
	display codeDisplay0(OUTbinario,A);
	
	display1 codeDisplay1(OUTbinario,B);
	
	And1 refresh (clk, rst, Q1, Q2);
	
	MUX2a1 multiplexor(A, B, ~Q2, outDisplay);
	
	RefreshCounte500ms RefreshCounte500ms(clk, rst, Q);
	assign an3 = 1'b1;
	assign an4 = 1'b1;

endmodule
