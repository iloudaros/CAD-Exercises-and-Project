`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    17:01:25 05/31/2023 
// Design Name: 
// Module Name:    unsigned_multiplier 
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
module unsigned_multiplier(
    input [1:0] a,
    input [1:0] b,
    output [6:0] representation,
	 output sign
    );

wire [3:0] result;

assign result = a*b;
assign sign = 0;

btd converter (.data_in(result), .representation(representation), .sign());  



endmodule
