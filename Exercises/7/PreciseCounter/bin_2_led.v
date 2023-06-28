//////////////////////////////////////////////////////////////////////////////////
// Company: University of Patras
// Engineer: iloudaros
// 
// Create Date:    20:45:08 06/28/2023 
// Design Name: 
// Module Name:    bin_2_led 
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
module bin_2_led(
input [3:0] number,
output reg [9:0] thermometer
);

always @(number) 
begin 
	case (number)
	
		0: thermometer = 10'b0;
		1: thermometer = 10'b1;
		2: thermometer = 10'b11;
		3: thermometer = 10'b111;
		4: thermometer = 10'b1111;
		5: thermometer = 10'b11111;
		6: thermometer = 10'b111111;
		7: thermometer = 10'b1111111;
		8: thermometer = 10'b11111111;
		9: thermometer = 10'b111111111;
		10:thermometer = 10'b1111111111;
		default: thermometer = 0;
	endcase
end	
endmodule
