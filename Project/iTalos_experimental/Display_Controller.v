`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: University of Patras
// Engineer: iloudaros
// 
// Create Date:    12:33:34 09/19/2020 
// Module Name:    Display_Controller 
// Project Name: 	 iTalos
//
//////////////////////////////////////////////////////////////////////////////////
module Display_Controller(
    input Pixelclock,
	 input clk,
	 input reset,
	 input [7:0] character,
	 input char_check,
	 input colour_check,
	 input move_check,
    output HSYNC,
    output VSYNC,
    output [8:0] RGB_out
    );
	 
	 wire [9:0] X;
	 wire [9:0] Y;
	 wire mask;
	 
	 HSYNC_Provider iHSYNC(
		.Pixelclock(Pixelclock),
		.enable(Pixelclock), 
		.reset(reset), 
		.HSYNC(HSYNC), 
		.X(X)
		);
		
	 VSYNC_Provider iVSYNC(
		.new_row(~HSYNC), 
		.enable(1), 
		.reset(reset), 
		.VSYNC(VSYNC), 
		.Y(Y)
		);
	 
	 Mask_Producer iMask(
		.Pixelclock(Pixelclock),
		.reset(reset),
		.char_check(char_check),
		.move_check(move_check),
		.character(character), 
		.Xi(X), 
		.Yi(Y), 
		.mask(mask)
		);
	 
	 Colouriser iColouriser(
		.Pixelclock(Pixelclock),
		.reset(reset),
		.colour_check(colour_check),
		.mask(mask), 
		.colour(character), 
		.RGB_out(RGB_out)
		);

endmodule
