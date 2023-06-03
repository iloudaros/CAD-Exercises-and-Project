module tops (reset, clk, left, right, pause);
  input reset, clk, pause;
  output [6:0] left, right;
  wire [2:0] ts;
  wire [3:0] ss;
  wire [2:0] current_ts;
  wire [3:0] current_ss;
  

      
  OneHertz      i0 (reset, clk, en_nxt);
  secondcounter i1 (reset, clk, en_nxt, current_ts, current_ss);
  bin_2_7       lt ({1'b0,ts}, left);
  bin_2_7       rt (ss, right);
  holder 		 hd (.data_in({current_ts, current_ss}), .data_out({ts,ss}), .clk(clk), .rst(reset), .pause(pause));
  
endmodule