`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    18:21:40 09/27/2023 
// Design Name: 
// Module Name:    freqdiv625 
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
module freqdiv6250(
    input reset,
	 input Pixelclock,
    output new_freq
    );
	 
	 
	cnt25 i0 (reset, Pixelclock, 1'b1, first);
	cnt25 i1 (reset, Pixelclock, first, second);
	cnt10 i2 (reset, Pixelclock, first & second , third);
	assign new_freq = first & second & third;


endmodule
