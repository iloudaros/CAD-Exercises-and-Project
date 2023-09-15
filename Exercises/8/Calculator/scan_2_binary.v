`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    13:09:18 09/13/2023 
// Design Name: 
// Module Name:    scan_2_binary 
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
module scan_2_binary(
    input [7:0] scan,
    output [3:0] binary
    );
	 
  assign binary = (scan == 8'h45) ? 4'b0000 :
              (scan == 8'h16) ? 4'b0001 :
              (scan == 8'h1E) ? 4'b0010 :
              (scan == 8'h26) ? 4'b0011 :
              (scan == 8'h25) ? 4'b0100 :
              (scan == 8'h2E) ? 4'b0101 :
              (scan == 8'h36) ? 4'b0110 :
              (scan == 8'h3D) ? 4'b0111 :
              (scan == 8'h3E) ? 4'b1000 :
              (scan == 8'h46) ? 4'b1001 : 4'b1010 ;

endmodule
