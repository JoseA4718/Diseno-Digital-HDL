`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: Instituto Tecnológico de Costa Rica
// Engineer: Jose Antonio Espinoza Chaves
// 
// Create Date: 10/04/2022 10:58:08 AM
// Design Name: Gray code to binary decoder. 
// Module Name: Gray_To_Binary
// Project Name: Diseño Digital HDL
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module Gray_To_Binary #(
        parameter N = 4)(
        input [N-1:0] gray, //input gray
        output [N-1:0] bin //output binario
    );
    
    assign bin[N-1] = gray[N-1];
    
    genvar i;
    generate
    for(i = N-2; i >= 0; i = i-1) begin: Gray_To_Binary
        assign bin[i] = bin[i+1] ^ gray[i];
    end
    endgenerate
 
endmodule
