`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    21:39:01 04/27/2018 
// Design Name: 
// Module Name:    toneC 
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

module toneC(clk, speaker);
input clk;
output speaker;

reg [22:0] tone;
always @(posedge clk) 
	tone <= tone+2;

wire [6:0] ramp = (tone[22] ? tone[21:15] : ~tone[21:15]);
wire [14:0] clkdivider = {2'b01, ramp, 6'b000000};

reg [14:0] counter;
always @(posedge clk) 
		if(counter==0) 
			counter <= clkdivider; 
		else 
			counter <= counter-1;

reg speaker;
always @(posedge clk) 
	if(counter==0) 
		speaker <= ~speaker;
endmodule