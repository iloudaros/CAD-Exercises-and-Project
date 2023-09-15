`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    13:10:56 09/13/2023 
// Design Name: 
// Module Name:    alu 
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
module alu(
    input [7:0] opcode,
    input [3:0] A,
    input [3:0] B,
    output reg signed [4:0] result
    );
	 
wire [3:0]	div_result; 

division mydiv (A,B,div_result,);

always @(opcode, A, B)
	begin

		case (opcode)
			8'h79 : result = $unsigned(A) + $unsigned(B);
			8'h7B : result = $unsigned(A) - $unsigned(B);
			8'h7C : result = $unsigned(A) * $unsigned(B);
			8'h4A : result = div_result;
			default: result = 4'b0000;
		endcase
	
	end 

endmodule
