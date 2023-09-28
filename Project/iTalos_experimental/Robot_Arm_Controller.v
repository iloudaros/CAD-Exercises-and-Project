`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company:  University of Patras 
// Engineer: iloudaros
// 
// Create Date:    16:29:41 09/19/2023 
// Module Name:    Robot_Arm_Controller 
// Project Name:   iTalos
//
//////////////////////////////////////////////////////////////////////////////////
module Robot_Arm_Controller(
    input Pixelclock,
	 input reset,
	 input [7:0] character,
    output Servo_PWM
    );
	 
	 reg [7:0] state;
	 reg [3:0] limit;
	 reg [6:0] counter;
	 
	 freqdiv6250 freqgcd(reset, Pixelclock, enable);
	 
	 
	 always @(posedge Pixelclock or posedge reset)
	 begin 
		if (reset)
		begin
			state <= 0;
			counter <= 0;
		end
		else 
		begin 
			state <= character;
			if (enable) 
			begin
				if(counter == 80) counter <= 0;
				else counter <= counter + 1;
			end
		end
	 end
	 
	 always @(posedge Pixelclock)
	 begin
		case (state)
		
			8'h2B : limit = 4; //F(olded)
			8'h15 : limit = 5; //Q(uarterly extended)
			8'h33 : limit = 6; //H(alf extended)
			8'h22 : limit = 8; //(e)X(tended)
		endcase
	 
	 end 
	 
	 assign Servo_PWM = (counter <= limit)? 1 : 0;


endmodule
