module cnt25 (reset, clk, enable, clkdiv25);
input reset, clk, enable;
output clkdiv25;
reg [5:0] cnt;

assign clkdiv25 = (cnt==5'd24);
always @(posedge reset or posedge clk)
  if (reset) cnt <= 0;
   else if (enable) 
          if (clkdiv25) cnt <= 0;
            else cnt <= cnt + 1;
endmodule

module cnt8b (reset, clk, enable, clkdiv256);
input reset, clk, enable;
output clkdiv256;
reg [7:0] cnt;

assign clkdiv256 = (cnt==8'd255);
always @(posedge reset or posedge clk)
  if (reset) cnt <= 0;
   else if (enable) cnt <= cnt + 1;
endmodule


module OneHertz(reset, clk, en_nxt);
input clk, reset;
output en_nxt;
wire clk1Hz;
wire first, second, third, fourth;

cnt25 i0 (reset, clk, 1'b1, first);
cnt25 i1 (reset, clk, first, second);
cnt25 i2 (reset, clk, first & second, third);
cnt25 i3 (reset, clk, first & second & third, fourth);
cnt8b i4 (reset, clk, first & second & third & fourth, clk1Hz);
assign en_nxt = first & second & third & fourth & clk1Hz;
endmodule

/*
module testOneHertz();
  reg reset, clk;
  wire en_nxt;
  
  OneHertz CUT (reset, clk, en_nxt);
  initial begin reset=0; clk = 0; # 10 reset = 1; # 9 reset = 0; end
  always #1 clk=~clk;
endmodule
*/