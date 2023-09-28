`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: University of Patras
// Engineer: iloudaros
// 
// Create Date:    12:34:59 09/19/2020 
// Module Name:    freqdiv4 
// Project Name:   iTalos
//
//////////////////////////////////////////////////////////////////////////////////
module freqdiv4(
    input clk,
	 input reset,
    output Pixelclock
    );
	 
	 reg [1:0] count;
	 assign Pixelclock = (count == 3);
	 
	 
	 always @(posedge clk, posedge reset)
	 begin
		if(reset) count <= 0;
		else count <= count+1;
	 end

endmodule
