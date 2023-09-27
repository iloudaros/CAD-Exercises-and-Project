`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: University of Patras
// Engineer: iloudaros
// 
// Create Date:    13:20:41 09/25/2023 
// Module Name:    HSYNC_Provider 
// Project Name:   iTalos
//
//////////////////////////////////////////////////////////////////////////////////
module HSYNC_Provider(
    input Pixelclock,
    input enable,
	 input reset,
    output HSYNC,
	 output reg [9:0] X
    );
	 
	 parameter HorizontalFrontPorch = 16; 
	 parameter HSYNCPulse = 96; 
	 parameter HorizontalBackPorch = 48; 
	 parameter VisiblePixels = 640;
	 
	 reg [9:0] counter;
	 
	 always @(posedge Pixelclock or posedge reset) 
	 begin
		
		if (reset) 
		begin
			counter <= 0;
			X <= 0;
		end
		else if (enable)
		begin
		
			if (counter == (HorizontalFrontPorch + HSYNCPulse + HorizontalBackPorch + VisiblePixels - 1)) 
				  counter <= 0;
			else counter <= counter + 1;
			
			if (counter < (HorizontalFrontPorch + HSYNCPulse + HorizontalBackPorch))
				  X <= 0 ;
			else X <= X+1;
		end
	 end
	 
	 assign HSYNC = ((counter >= HorizontalFrontPorch) && (counter < HorizontalFrontPorch + HSYNCPulse))? 0 : 1;
		
endmodule
