`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 19.02.2024 15:21:00
// Design Name: 
// Module Name: display
// Project Name: 
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


module display(in,out);
input [3:0]in;
output reg [6:0] out;
always@(*)
case(in)
4'b0000: out=7'b1111110;
4'b0001: out=7'b0110000;
4'b0010: out=7'b1101101;
4'b0011: out=7'b1111001;
4'b0100: out=7'b0110011;
4'b0101: out=7'b1011011;
4'b0110: out=7'b1011111;
4'b0111: out=7'b1110000;
4'b1000: out=7'b1111111;
4'b1001: out=7'b1111011;
default: out=7'b0000000;
endcase
endmodule
