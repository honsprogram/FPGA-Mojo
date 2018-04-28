`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    21:18:36 04/27/2018 
// Design Name: 
// Module Name:    toneB 
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

module toneB(clk, speaker);
input clk;
output speaker;

reg [14:0] counter;
always @(posedge clk) 
		if(counter==28408) 
			counter<=0; 
		else 
			counter <= counter+1;

reg speaker;
always @(posedge clk) 
		if(counter==28408)
					speaker <= ~speaker;
endmodule
