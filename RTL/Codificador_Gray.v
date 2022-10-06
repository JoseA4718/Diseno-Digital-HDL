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
    //define que el primer bit en ambos casos es la misma
    genvar i;
    generate
    //para el resto de los 3 de casos:
    for(i = N-2; i >= 0; i = i-1) begin: Gray_To_Binary
    //Define la transformación a binario de los otros bits
        assign bin[i] = bin[i+1] ^ gray[i];
    end
    endgenerate
 
endmodule

/////////////// 

/////////////BCD A Siete Segmnetos en Base a FPGA Basys3 

        
module siete_segmentos ( //modulo para mostrar binario 
        input [3:0]unidades;
        input [3:0]decimales;
        input cs; //Seleccion de input 1 bit. Define encendido o apagado
        output reg [6:0]seg; //siete salidas correspondientes a los segmentos de cada digito
        output reg[1:0] digito; //representa la salida de los dos digitos necesarios en el display
        );
        parameter cero = 7'b000_0001; //cada bit define si las entradas abc...g se activan o no, formando la configuración de numeros
        parameter uno =7'b100_1111;
        parameter dos =7'b001_0010;
        parameter tres =7'b000_0110;
        parameter cuatro =7'b100_1100;
        parameter cinco =7'b010_0100;
        parameter seis =7'b010_0000;
        parameter siete =7'b000_1111;
        parameter ocho =7'b000_0000;
        parameter nueve =7'b000_0100;

        reg [1:0] selec_dig//Definicion de register para seleccionar uno de los digitos
        always @ (selec_dig) begin
                case (selec_dig)
                        2'b00 : digito=4'b1110; //enciende unidades
                        2'b00 : digito=4'b1101; //enciende decimales
                endcase
        end 
        always @*
                case(selec_dig)
                        2'b00:begin //UNIDADES
                                case(unidades)
                                        4'b0000:seg=cero;
                                        4'b0001:seg=uno;
                                        4'b0010:seg=dos;
                                        4'b0011:seg=tres;
                                        4'b0100:seg=cuatro;
                                        4'b0101:seg=cinco;
                                        4'b0110:seg=seis;
                                        4'b0111:seg=siete;
                                        4'b1000:seg=ocho;
                                        4'b1001:seg=nueve;
                                endcase
                        end
                        2'b00:begin
                                case(decimales)
                                        4'b0000:seg=cero;
                                        4'b0001:seg=uno;
                                        4'b0010:seg=dos;
                                        4'b0011:seg=tres;
                                        4'b0100:seg=cuatro;
                                        4'b0101:seg=cinco;
                                        4'b0110:seg=seis;
                                        4'b0111:seg=siete;
                                        4'b1000:seg=ocho;
                                        4'b1001:seg=nueve;
                                endcase
                        end                                           
endmodule
        
                                                
        
        
        
        
        
        
