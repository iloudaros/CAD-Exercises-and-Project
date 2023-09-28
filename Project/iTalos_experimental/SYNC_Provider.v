`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: University of Patras
// Engineer: iloudaros
// 
// Create Date:    00:51:10 09/28/2023 
// Module Name:    SYNC_Provider 
// Project Name: iTalos
//
//////////////////////////////////////////////////////////////////////////////////
module SYNC_Provider(
    input Pixelclock,
    input Reset,
    output HSYNC,
    output VSYNC,
    output reg [9:0] X,
    output reg [8:0] Y
    );
	 
	 parameter HorizontalFrontPorch = 16; 
	 parameter HSYNCPulse = 96; 
	 parameter HorizontalBackPorch = 48; 
	 parameter VisiblePixels = 640;
	 
	 parameter VerticalFrontPorch = 12; 
	 parameter VSYNCPulse = 2; 
	 parameter VerticalBackPorch = 35; 
	 parameter VisibleRows = 400;


endmodule
