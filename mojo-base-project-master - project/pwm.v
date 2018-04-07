`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    00:12:31 04/07/2018 
// Design Name: 
// Module Name:    pwm 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module mypwm(clk,pwmin,pwmout);
input clk;
input [3:0] pwmin;
output pwmout;
reg [3:0] cnt;
always @(posedge clk) 
		cnt <= cnt + 1'b1; 
assign pwmout=(pwmin>cnt)? 1:0;

endmodule
