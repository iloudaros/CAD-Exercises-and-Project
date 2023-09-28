`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: University of Patras
// Engineer: iloudaros
// 
// Create Date:    13:26:06 09/25/2023 
// Module Name:    VSYNC_Provider 
// Project Name:   iTalos
//
//////////////////////////////////////////////////////////////////////////////////
module VSYNC_Provider(
    input new_row,
    input enable,
	 input reset,
    output VSYNC,
	 output reg [9:0] Y
    );
	 
	 parameter VerticalFrontPorch = 12; 
	 parameter VSYNCPulse = 2; 
	 parameter VerticalBackPorch = 35; 
	 parameter VisibleRows = 400; 
	 
	 reg [9:0] counter;
	 
	 always @(posedge new_row or posedge reset) 
	 begin
		
		if (reset) 
		begin
			counter <= 0;
		end
		else if (enable)
		begin
		
			if (counter == (VerticalFrontPorch + VSYNCPulse + VerticalBackPorch + VisibleRows - 1))
				  counter <= 0;
			else counter <= counter + 1;

		end
	 end
	 
	 
	 	 always @(posedge new_row or posedge reset)
	 begin 
		if (reset)
		begin
			Y<=0;
		end
		else if (enable)
		
		begin
			if (counter < (VerticalFrontPorch + VSYNCPulse + VerticalBackPorch))
				  Y <= 0 ;
			else Y <= Y+1;
		end
	 
	 end 
	 
	 assign VSYNC = ((counter >= VerticalFrontPorch) && (counter < VerticalFrontPorch + VSYNCPulse))? 1 : 0;	 

endmodule
