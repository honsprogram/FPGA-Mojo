`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    22:45:12 04/01/2018 
// Design Name: 
// Module Name:    add 
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
module myadd(A,B,C,D,Q,R,S,T);
	 input A,B,C,D;
    output Q,R,S,T;
	 wire A,B,C,D;
	
  

assign Q= (A==0 && B==0 && C==0 && D==0) ? 1 : 0 ;
assign R= (A==1 && B==0 && C==0 && D==0) ? 1 : 0 ;
assign S= (A==0 && B==1 && C==0 && D==0) ? 1 : 0 ;
assign T= (A==0 && B==0 && C==1 && D==0) ? 1 : 0 ;


endmodule
