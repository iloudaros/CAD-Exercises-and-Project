`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    14:33:51 09/07/2023 
// Design Name: 
// Module Name:    scan_2_7seg 
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
module scan_2_7seg (scan, ss);
  input  [7:0] scan;
  output [7:0] ss;

  
  assign ss = (scan == 8'h45) ? 8'b01111110 :
              (scan == 8'h16) ? 8'b00110000 :
              (scan == 8'h1E) ? 8'b01101101 :
              (scan == 8'h26) ? 8'b01111001 :
              (scan == 8'h25) ? 8'b00110011 :
              (scan == 8'h2E) ? 8'b01011011 :
              (scan == 8'h36) ? 8'b01011111 :
              (scan == 8'h3D) ? 8'b01110010 :
              (scan == 8'h3E) ? 8'b01111111 :
              (scan == 8'h46) ? 8'b01111011 : 8'b10000000 ;
endmodule 
