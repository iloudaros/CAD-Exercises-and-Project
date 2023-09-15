`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    13:40:32 09/15/2023 
// Design Name: 
// Module Name:    division 
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
module division(
    input [3:0] divident,
    input [3:0] divisor,
    output reg [3:0] quotient,
    output reg [3:0] remainder
    );
	 
	 
	 reg [3:0] quotient_temp;
	 reg [3:0] remainder_temp;
	 reg [2:0] i;
	 
	 always @(divident, divisor)
	 begin
		
		quotient_temp = 4'b0;
		remainder_temp = divident;
	 
		for(i=0; i<4; i = i+1) begin 
		
			if (remainder_temp >= divisor) begin
				quotient_temp = quotient_temp + 1;
				remainder_temp=remainder_temp-divisor;
			end
		end
		
		quotient = quotient_temp;
		remainder = remainder_temp;
		
	end


endmodule
