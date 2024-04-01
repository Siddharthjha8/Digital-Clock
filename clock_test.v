`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01.04.2024 21:11:14
// Design Name: 
// Module Name: clock_test
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


module clock_test;
reg clk,rst;
reg [5:0] sec,min,hour;
reg time_c,alm_c,alm_on,alm_off;
wire [6:0] outsc_1,outsc_2,outmn_1,outmn_2,outhr_1,outhr_2 ;
wire alarm;

clock c1(clk,rst,alm_on,alm_off,sec,min,hour,time_c,alm_c,outsc_1,outsc_2,outmn_1,outmn_2,outhr_1,outhr_2,alarm);
initial
begin
rst=0;time_c=0;sec=0;min=0;hour=0;alm_on=0;alm_off=0;alm_c=0;
#10;
rst=0;time_c=1;sec=40;min=56;hour=23;alm_on=0;alm_off=0;alm_c=0;
#100 rst=0;time_c=0;sec=40;min=56;hour=23;alm_on=0;alm_off=0;alm_c=0;
#80 rst=0;time_c=0;sec=40;min=58;hour=23;alm_on=1;alm_off=0;alm_c=0;
#10 rst=0;time_c=0;sec=00;min=00;hour=00;alm_on=1;alm_off=0;alm_c=1;
#100 rst=0;time_c=0;sec=00;min=00;hour=00;alm_on=1;alm_off=0;alm_c=0;
#100 rst=0;time_c=0;sec=00;min=00;hour=00;alm_on=0;alm_off=1;alm_c=0;
#1000 $finish();
end

initial
begin
clk=0;
forever #1 clk=~clk;
#10000 $finish();
end
initial
begin
$monitor("time=%d,%d,%d,%d,%d,%d,%d,%d",outsc_1,outsc_2,outmn_1,outmn_2,outhr_1,outhr_2,clk,alarm);
#1000 $finish();
end
endmodule
