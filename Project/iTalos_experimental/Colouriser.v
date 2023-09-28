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
	 input Pixelclock,
	 input reset,
	 input colour_check,
    input mask,
    input [7:0] colour,
	 output [8:0] RGB_out
    );
	 
	 reg [2:0] R,G,B;
	 
	 always @(posedge Pixelclock or posedge reset)
	 begin
		if (reset)
		begin 
			R = 3'b111;
			G = 3'b111;
			B = 3'b111;
		end 
		else if (colour_check)
		begin
			case (colour)
				8'h2d: //R
				begin 
					R = 3'b111;
					G = 3'b000;
					B = 3'b000;
				end
			
				8'h34: //G 
				begin 
					R = 3'b000;
					G = 3'b111;
					B = 3'b000;
				end
				
				8'h32: 
				begin //B
					R = 3'b000;
					G = 3'b000;
					B = 3'b111;
				end
				
				8'h1d://W
				begin 
					R = 3'b111;
					G = 3'b111;
					B = 3'b111;
				end
				
				default:
				begin 
					R = 3'b111;
					G = 3'b111;
					B = 3'b111;
				end
				
			endcase
		end
	 end 
	 
	 assign RGB_out = {mask*R, mask*G, mask*B};
	 
	 endmodule
