`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: Univeristy of Patras
// Engineer: iloudaros
// 
// Create Date:    17:28:03 09/26/2023 
// Design Name: 
// Module Name:    Colouriser 
// Project Name:   iTalos
//
//////////////////////////////////////////////////////////////////////////////////
module Colouriser(
    input mask,
    input [2:0] R,
	 input [2:0] G,
	 input [2:0] B,
	 output [8:0] RGB_out
    );
	 
	 assign RGB_out = {mask*R, mask*G, mask*B};
	 
	 endmodule
