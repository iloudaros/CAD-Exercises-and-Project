module kbd_protocol (reset, clk, ps2clk, ps2data, scancode, char_check, colour_check, move_check);
  input        reset, clk, ps2clk, ps2data;
  output reg char_check;
  output reg colour_check;
  output reg move_check;
  output [7:0] scancode;
  reg    [7:0] scancode;
  
  // Synchronize ps2clk to local clock and check for falling edge;
  reg    [7:0] ps2clksamples; // Stores last 8 ps2clk samples

  always @(posedge clk or posedge reset)
    if (reset) ps2clksamples <= 8'd0;
      else ps2clksamples <= {ps2clksamples[7:0], ps2clk};

  wire fall_edge; // indicates a falling_edge at ps2clk
  assign fall_edge = (ps2clksamples[7:4] == 4'hF) & (ps2clksamples[3:0] == 4'h0);

  reg    [9:0] shift;   // Stores a serial package, excluding the stop bit;
  reg    [3:0] cnt;     // Used to count the ps2data samples stored so far
  reg          f0;      // Used to indicate that f0 was encountered earlier
  
  // A simple FSM is implemented here. Grab a whole package,
  // check its parity validity and output it in the scancode
  // only if the previous read value of the package was F0
  // that is, we only trace when a button is released, NOT when it is
  // pressed.
  
  always @(posedge clk or posedge reset)
    if (reset) 
      begin
        cnt    <= 4'd0;
        scancode <= 8'd0;
        shift    <= 10'd0;
        f0       <= 1'b0;
		  char_check = 0;
		  colour_check = 0;
		  move_check = 0;
      end  
     else if (fall_edge)
         begin
           if (cnt == 4'd10) // we just received what should be the stop bit
             begin
               cnt <= 0;
               if ((shift[0] == 0) && (ps2data == 1) && (^shift[9:1]==1)) // A well received serial packet
                 begin
                   if (f0) // following a scancode of f0. So a key is released ! 
                     begin
                       scancode <= shift[8:1];
							  
							  //char check
							  char_check=0;
							  if (shift[8:1]== 8'h2b || shift[8:1]== 8'h15|| shift[8:1]== 8'h33 || shift[8:1] ==8'h22) char_check = 1;
							  
							  //colour check
							  colour_check = 0;
							  if (shift[8:1]== 8'h2d || shift[8:1]== 8'h34|| shift[8:1]== 8'h32 || shift[8:1] ==8'h1d) colour_check = 1;
							  
							  //move check
							  move_check = 0;
							  if (shift[8:1]== 8'h43 || shift[8:1]== 8'h3b|| shift[8:1]== 8'h42 ||shift[8:1]== 8'h4b) move_check = 1;
							  
                       f0 <= 0;
                     end
                    else if (shift[8:1] == 8'hF0) f0 <= 1'b1;
                 end // All other packets have to do with key presses and are ignored
             end
            else
             begin
               shift <= {ps2data, shift[9:1]}; // Shift right since LSB first is transmitted
               cnt <= cnt+1;
             end
         end
endmodule