`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    21:25:14 04/02/2018 
// Design Name: 
// Module Name:    counter 
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
module counter(clk,rst,out);
	input clk,rst;
   output out;
	reg [24:0] counter_d, counter_q;
   
  assign out = counter_q[24];
   
  always @(counter_q) begin
    counter_d <= counter_q + 1'b1;
  end
   
  always @(posedge clk) begin
    if (rst) begin
      counter_q <= 25'b0;
    end 
	 else begin
	 //counter_d <= counter_q + 1'b1;
      counter_q <= counter_d;
    end
  end


endmodule
