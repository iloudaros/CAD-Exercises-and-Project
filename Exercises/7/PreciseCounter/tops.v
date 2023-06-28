module tops (reset, clk, left, right, led, pause);
  input reset, clk, pause;
  output [6:0] left, right;
  output [9:0] led;
  wire [2:0] ts;
  wire [3:0] ss;
  wire [3:0] st;
  wire [2:0] current_ts;
  wire [3:0] current_ss;
  wire [3:0] current_st;

  
  OneHertz      i0 (reset, clk, en_nxt, en_next_tenth);
  secondcounter i1 (reset, clk, en_nxt, en_next_tenth, current_ts, current_ss, current_st);
  bin_2_7       lt ({1'b0,ts}, left);
  bin_2_7       rt (ss, right);
  holder 		 hd (.data_in({current_ts, current_ss, current_st}), .data_out({ts,ss,st}), .clk(clk), .rst(reset), .pause(pause));
  bin_2_led	    ld (st, led);

endmodule