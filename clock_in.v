`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 31.03.2024 22:52:09
// Design Name: 
// Module Name: clock_in
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


module clock_in(clk,rst,alm_on,alm_off,sec,min,hour,time_c,alm_c, outsec,outmin,outhour,alarm);
input clk,rst;
input [5:0] sec,min,hour;
input time_c,alm_on,alm_off,alm_c;
output reg [5:0] outsec,outmin,outhour;
output reg alarm;

reg [5:0]alsc,almn,alhr;

always@(posedge clk or posedge rst or posedge time_c,posedge alm_c)
begin
if(rst)
begin
outsec=1'b0;
outmin=1'b0;
outhour=1'b0;

end
else if(time_c)
begin
outsec<=sec;
outmin<=min;
outhour<=hour;

end

else if(alm_c)
begin
alsc<=sec;
almn<=min;
alhr<=hour;
end
else
outsec=outsec+1;
end
always@(posedge clk)
begin
if(outsec>59)
begin
outmin<=outmin+1;
outsec<=0;
end
else
outmin<=outmin;
end

always@(posedge clk)
begin
if(outmin>59)
begin
outmin<=0;
outhour<=outhour+1;
end
else
outhour<=outhour;
end

always@(posedge clk)
begin
if(outhour>23)
begin
outsec<=1'b0;
outmin<=1'b0;
outhour<=1'b0;
end
end

always@(posedge clk or posedge rst)
begin
if(rst)
alarm<=0;
else begin
if({alsc,almn,alhr}=={outsec,outmin,outhour});
begin
if(alm_on)
alarm<=1'b1;
if(alm_off)
alarm<=1'b0;
end
end
end
endmodule
