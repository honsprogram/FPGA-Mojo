module mojo_top(
    // 50MHz clock input
    input clk,
    // Input from reset button (active low)
    input rst_n,
    // cclk input from AVR, high when AVR is ready
    input cclk,
    // Outputs to the 8 onboard LEDs
    output[7:0]led,
    // AVR SPI connections
    output spi_miso,
    input spi_ss,
    input spi_mosi,
    input spi_sck,
    // AVR ADC channel select
    output [3:0] spi_channel,
    // Serial connections
    input avr_tx, // AVR Tx => FPGA Rx
    output avr_rx, // AVR Rx => FPGA Tx
    input avr_rx_busy, // AVR Rx buffer full
	 // HZ add
	 input A,
	 input B,
	 input C,
	 input D

    );

wire rst = ~rst_n; // make reset active high

// these signals should be high-z when not used
assign spi_miso = 1'bz;
assign avr_rx = 1'bz;
assign spi_channel = 4'bzzzz;

//assign led = 8'b0;
assign led[1] = 1'b0;

assign led[7] = rst;
// Blinker   
  myadd add2 (
     .A(A),
     .B(B),
	  .C(C),
	  .D(D),
     .Q(led[2]),
	  .R(led[3]),
	  .S(led[4]),
	  .T(led[5])
  );
  
  counter blink(
					.clk(clk),
					.rst(rst),
					.out(led[6] )
	);


mypwm pwm1(
		.clk(clk),
		.pwmin(4'b0011),
		.pwmout(led[0])
		);



endmodule