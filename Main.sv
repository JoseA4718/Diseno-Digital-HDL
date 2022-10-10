`timescale 1ns / 1ps

module Main(clk, rst, Data_in, outDisplay, OUTbinario, Q1, Q2, an3, an4);
    input clk, rst;
	input [3:0] Data_in;
	output wire Q1, Q2, an3, an4;
	output wire [6:0] outDisplay;
	output wire [3:0] OUTbinario;

	wire [3:0] INgray;
	wire [6:0] A, B;
	wire Q;
	
	Deco DecoGray_Binario(INgray,OUTbinario);
	
	Register Registro_Entrada(clk, rst, Q, Data_in, INgray);
	
	Display_0 codeDisplay0(OUTbinario,A);
	
	Display_1 codeDisplay1(OUTbinario,B);
	
	Refresh_1 refresh(clk, rst, Q1, Q2);
	
	MUX2a1 multiplexor(A, B, ~Q2, outDisplay);
	
	Refresh_500 RefreshCounter500ms(clk, rst, Q);
	assign an3 = 1'b1;
	assign an4 = 1'b1;
endmodule
