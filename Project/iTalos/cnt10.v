`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: University of Patras
// Engineer: iloudaros
// 
// Create Date:    18:38:22 09/27/2023 
// Module Name:    cnt10 
// Project Name: iTalos
//
//////////////////////////////////////////////////////////////////////////////////
module cnt10 (reset, clk, enable, clkdiv10);
input reset, clk, enable;
output clkdiv10;
reg [3:0] cnt;

assign clkdiv10 =(cnt==4'd9);
always @(posedge reset or posedge clk)
  if (reset) cnt <= 0;
   else if (enable) 
          if (clkdiv10) cnt <= 0;
            else cnt <= cnt + 1;
endmodule
