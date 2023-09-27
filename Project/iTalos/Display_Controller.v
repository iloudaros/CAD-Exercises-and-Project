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
	 input reset,
	 input [7:0] character,
    output HSYNC,
    output VSYNC,
    output [8:0] RGB_out
    );
	 
	 wire [9:0] X;
	 wire [8:0] Y;
	 wire mask;
	 
	 HSYNC_Provider iHSYNC(
		.Pixelclock(Pixelclock),
		.enable(1), 
		.reset(reset), 
		.HSYNC(HSYNC), 
		.X(X)
		);
		
	 VSYNC_Provider iVSYNC(
		.new_row(~HSYNC), 
		.enable(Pixelclock), 
		.reset(reset), 
		.VSYNC(VSYNC), 
		.Y(Y)
		);
	 
	 Mask_Producer iMask(
		.Pixelclock(Pixelclock), 
		.reset(reset),
		.character(character), 
		.X(X), 
		.Y(Y), 
		.mask(mask)
		);
	 
	 Colouriser iColouriser(
		.mask(mask), 
		.R(3'b111), 
		.G(3'b111), 
		.B(3'b111), 
		.RGB_out(RGB_out)
		);

endmodule
