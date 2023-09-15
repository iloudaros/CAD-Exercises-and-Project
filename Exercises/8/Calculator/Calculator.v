`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: University of Patras
// Engineer: Ioannis Loudaros 
// 
// Create Date:    14:29:16 09/07/2023 
// Design Name: 
// Module Name:    Calculator 
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
module Calculator (reset, clk, ps2clk, ps2data, left_o, right_o, sign, encoded_result);
  input        reset, clk;
  input        ps2clk, ps2data;
  output [7:0] left_o;
  output [7:0] right_o;
  output [6:0] encoded_result;
  output sign;
  
  wire [7:0] scan;
  
  wire [7:0] right, left;
  wire [3:0] A, B;
  wire [4:0] result;
  wire ready, is_number;
  
  kbd_protocol kbd (reset, clk, ps2clk, ps2data, scan, ready, is_number);
  scan_log log (scan, ready, left, right, is_number); 
  scan_2_7seg  lft (left, left_o);
  scan_2_7seg  rgt (right, right_o);
  
  scan_2_binary toA (left, A);
  scan_2_binary toB (right, B);
  
  alu myalu (scan, A, B, result);
  
  bin_2_7seg converter (result, sign, encoded_result, is_number);
  


endmodule
