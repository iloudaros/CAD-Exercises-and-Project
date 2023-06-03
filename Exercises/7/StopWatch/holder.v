`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    19:26:05 06/01/2023 
// Design Name: 
// Module Name:    holder 
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
module holder(
    input [6:0] data_in ,
	 input clk,rst,pause,
    output [6:0] data_out
    );
	 
	 reg [6:0] hold_reg;
	 
	 always @(posedge rst or posedge clk)begin 
		if (rst) hold_reg <= 0;
		else if (!pause) hold_reg <= data_in;
		end 
		
	assign data_out = pause? hold_reg : data_in;



endmodule
