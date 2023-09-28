`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company:  University of Patras
// Engineer: iloudaros
// 
// Create Date:    13:09:49 09/26/2023 
// Module Name:    Mask_Producer 
// Project Name:   iTalos
//
//////////////////////////////////////////////////////////////////////////////////
module Mask_Producer(
	 input Pixelclock,
	 input reset,
	 input char_check,
	 input move_check,
	 input [7:0] character,
    input [9:0] Xi,
    input [9:0] Yi,
	 output reg mask
    );
	 
	 reg [9:0] X,Y;
	 
	 reg [9:0] Xoff,Yoff;
	 
	 reg [7:0] valid_character;
	 
	 always @(posedge Pixelclock or posedge reset)
	 begin 
		if (reset) valid_character = 0;
		else if (char_check) valid_character = character;
	 end
	 
	 always @(posedge Pixelclock or posedge reset)
	 begin 
		if (reset)
		begin
			Xoff=0;
			Yoff=0;
		end
		else if (move_check) 
		begin
			case(character)
				8'h43: Yoff = Yoff-1; //I
				8'h42: Yoff = Yoff+1; //K
				8'h3b: Xoff = Xoff-1; //J
				8'h4b: Xoff = Xoff+1; //L
			endcase
		end
	 end
	 
	 
	 
	 
	 always @(negedge Pixelclock or posedge reset) 
	 begin 
		if (reset) 
		begin
			mask=0;
			X=Xi;
			Y=Yi;
		end
	   else
		begin
			mask=0;
			X = X + Xoff;
			Y = Y + Yoff;
			case (valid_character)
				8'h2b : //F
				begin
					if (X>=361 && X<=365 && Y>=212 && Y<=231 ||
						 X>=366 && X<=374 && Y>=212 && Y<=213 ||
						 X>=366 && X<=372 && Y>=221 && Y<=222
						 ) mask = 1;
				end
				
				8'h15 ://Q
				begin
					if (X>=364 && X<=372 && Y>=212 && Y<=213 ||
						 X>=361 && X<=365 && Y>=214 && Y<=229 ||
						 X>=370 && X<=374 && Y>=214 && Y<=229 ||
						 X>=364 && X<=372 && Y>=230 && Y<=231 ||
						 X>=366 && X<=369 && Y>=232 && Y<=233 ||
						 X>=368 && X<=374 && Y>=234 && Y<=235 
						 ) mask = 1;
				end
				
				8'h33 ://H
				begin
					if (X>=361 && X<=365 && Y>=212 && Y<=231 ||
						 X>=370 && X<=374 && Y>=212 && Y<=231 ||
						 X>=366 && X<=369 && Y>=221 && Y<=222
						 ) mask = 1;
				end
				
				8'h22 ://X
				begin 
					if (X>=361 && X<=365 && Y>=212 && Y<=215 ||
						 X>=370 && X<=374 && Y>=212 && Y<=215 ||
						 X>=364 && X<=372 && Y>=216 && Y<=220 ||
						 X>=366 && X<=369 && Y>=221 && Y<=222 ||
						 X>=364 && X<=372 && Y>=223 && Y<=226 ||
						 X>=361 && X<=365 && Y>=227 && Y<=231 ||
						 X>=370 && X<=374 && Y>=227 && Y<=231 
						 ) mask = 1;
				end
				
				default : mask = 0;
			endcase
		  end
	 end 

endmodule
