module counter_delay (clear, clock, load, start_stop, count, data);

  parameter size = 4;

  input [size-1:0] data;
  output [size-1:0] count;
  input start_stop;
  input load;
  input clock;
  input clear;
  reg [size-1:0] count;
  
  always @(posedge clock) begin
  #20;
   if (clear) count <= 0;
    else if (load) count <= data;
              else if (start_stop) count <= count + 1;
              end
endmodule
