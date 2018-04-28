`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    16:53:54 04/27/2018 
// Design Name: 
// Module Name:    input_capture 
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
module input_capture(
    input clk,
    input rst,
    output [3:0] channel,
    input new_sample,
    input [9:0] sample,
    input [3:0] sample_channel,
    output [7:0] led
  );
 
  assign channel = 4'd0; // only read A0
 
  reg [9:0] sample_d, sample_q;
  wire pwmwire;
 
  pwm #(.CTR_LEN(10)) led_pwm ( // 10bit PWM
    .clk(clk),
    .rst(rst),
    .compare(sample_q),
    .pwm(pwmwire)
  );
 
  assign led = {8{pwmwire}}; // duplicate the PWM signal to each LED
 
  always @(*) begin
    sample_d = sample_q;
 
    if (new_sample && sample_channel == 4'd0) // valid sample
      sample_d = sample;
  end
 
  always @(posedge clk) begin
    if (rst) begin
      sample_q <= 10'd0;
    end else begin
      sample_q <= sample_d;
    end
  end
 
endmodule