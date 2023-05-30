module counter_8bit (clear, clock, load, start_stop, count, data);

input [7:0] data;
output [7:0] count;
input start_stop;
input load;
input clock;
input clear;

counter low_nibble (clear, clock, load, start_stop, count[3:0], data[3:0]);

counter high_nibble (clear, clock, load, start_stop & (&count[3:0]), count[7:4], data[7:4]);


endmodule
