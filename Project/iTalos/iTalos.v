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


kbd_protocol Keyboard(reset, clk, ps2clk, ps2data, scan, check);

freqdiv4 Pixelclock_Provider(clk, reset, Pixelclock);

Display_Controller Display(Pixelclock, reset, check, scan, HSYNC, VSYNC, RGB_out);

Robot_Arm_Controller Talos(Pixelclock, reset, scan, Servo_PWM);


endmodule
