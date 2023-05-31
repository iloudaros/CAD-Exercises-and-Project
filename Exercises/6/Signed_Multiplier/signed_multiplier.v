`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    17:00:06 05/31/2023 
// Design Name: 
// Module Name:    signed_multiplier 
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
module signed_multiplier(
    input signed [1:0] a,
    input signed [1:0] b,
    output [6:0] representation,
	 output sign
    );

wire signed [4:0] result;

assign result = a*b;

btd converter (.data_in(result), .representation(representation), .sign(sign));  




endmodule
