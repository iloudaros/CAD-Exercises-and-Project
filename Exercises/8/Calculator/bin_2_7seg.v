`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    13:31:48 09/13/2023 
// Design Name: 
// Module Name:    bin_2_7seg 
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
module bin_2_7seg(
    input [4:0] binary,
	 output sign,
    output reg [6:0] encoded,
	 input is_number
    );
assign sign = binary[4];
	
always @(binary, is_number) begin 
	if (is_number) encoded = 7'b0000000;
	else
	case (binary)  
	
		  5'b00000, 5'b10000 : encoded = 7'b1110111;
        5'b00001, 5'b11111 : encoded = 7'b0010010;
        5'b00010, 5'b11110 : encoded = 7'b1011101;
        5'b00011, 5'b11101 : encoded = 7'b1011011;
        5'b00100, 5'b11100 : encoded = 7'b0111010;
        5'b00101, 5'b11011 : encoded = 7'b1101011;
        5'b00110, 5'b11010 : encoded = 7'b1101111;
        5'b00111, 5'b11001 : encoded = 7'b1010010;
        5'b01000, 5'b11000 : encoded = 7'b1111111;
        5'b01001, 5'b10111 : encoded = 7'b1111011;
        5'b01010, 5'b10110 : encoded = 7'b1111110;
        5'b01011, 5'b10101 : encoded = 7'b0101111;
        5'b01100, 5'b10100 : encoded = 7'b1100101;
        5'b01101, 5'b10011 : encoded = 7'b0011111;
        5'b01110, 5'b10010 : encoded = 7'b1101101;
        5'b01111, 5'b10001 : encoded = 7'b1101100;
        default : encoded = 7'b0000000;
	endcase
end

endmodule
