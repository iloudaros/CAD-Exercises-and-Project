`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    15:57:57 05/31/2023 
// Design Name: 
// Module Name:    btd 
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
module btd(
    input signed [4:0] data_in,
    output reg [6:0] representation,
    output sign
    );
	
assign sign = data_in[4];
	
always @(data_in) begin 
	
	case (data_in)  
	
		  5'b00000, 5'b10000 : representation = 7'b1110111;
        5'b00001, 5'b11111 : representation = 7'b0010010;
        5'b00010, 5'b11110 : representation = 7'b1011101;
        5'b00011, 5'b11101 : representation = 7'b1011011;
        5'b00100, 5'b11100 : representation = 7'b0111010;
        5'b00101, 5'b11011 : representation = 7'b1101011;
        5'b00110, 5'b11010 : representation = 7'b1101111;
        5'b00111, 5'b11001 : representation = 7'b1010010;
        5'b01000, 5'b11000 : representation = 7'b1111111;
        5'b01001, 5'b10111 : representation = 7'b1111011;
        5'b01010, 5'b10110 : representation = 7'b1111110;
        5'b01011, 5'b10101 : representation = 7'b0101111;
        5'b01100, 5'b10100 : representation = 7'b1100101;
        5'b01101, 5'b10011 : representation = 7'b0011111;
        5'b01110, 5'b10010 : representation = 7'b1101101;
        5'b01111, 5'b10001 : representation = 7'b1101100;
        default : representation = 7'b0000000;
	endcase

end


endmodule
