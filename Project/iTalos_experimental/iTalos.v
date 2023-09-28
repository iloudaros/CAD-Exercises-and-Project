`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: University of Patras
// Engineer: iloudaros
// 
// Create Date:    10:25:57 09/19/2020 
// Module Name:    iTalos 
// Project Name:   iTalos
//
//////////////////////////////////////////////////////////////////////////////////
module iTalos(
    input reset,
    input clk,
    input ps2clk,
    input ps2data,
    output Servo_PWM,
    output HSYNC,
	 output VSYNC,
    output [8:0] RGB_out
    );

wire [7:0] scan;
wire Pixelclock;
wire char_check, colour_check, move_check;


kbd_protocol Keyboard(reset, clk, ps2clk, ps2data, scan, char_check, colour_check, move_check);

freqdiv4 Pixelclock_Provider(clk, reset, Pixelclock);

Display_Controller Display(Pixelclock, clk, reset, scan, char_check, colour_check, move_check, HSYNC, VSYNC, RGB_out);

Robot_Arm_Controller Talos(Pixelclock, reset, scan, Servo_PWM);


endmodule
