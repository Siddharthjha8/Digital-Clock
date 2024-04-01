`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 31.03.2024 15:44:06
// Design Name: 
// Module Name: clock
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


module clock(clk,rst,alm_on,alm_off,sec,min,hour,time_c,alm_c,outsc_1,outsc_2,outmn_1,outmn_2,outhr_1,outhr_2,alarm);
input clk,rst;
input [5:0] sec,min,hour;
input time_c,alm_c,alm_on,alm_off;
output  [6:0]outsc_1,outsc_2,outmn_1,outmn_2,outhr_1,outhr_2;
output  alarm;
wire [3:0]s1,s2,m1,m2,h1,h2;
wire [5:0]sc,mn,hr;
parameter a=10;
clock_in c1(clk,rst,alm_on,alm_off,sec,min,hour,time_c,alm_c,sc,mn,hr,alarm);

assign s2=sc/a;
assign s1=sc%a;
assign m2=mn/a;
assign m1=mn%a;
assign h2=hr/a;
assign h1=hr%a;
display d1(s1,outsc_1);
display d2(s2,outsc_2);
display d3(m1,outmn_1);
display d4(m2,outmn_2);
display d5(h1,outhr_1);
display d6(h2,outhr_2);
endmodule
