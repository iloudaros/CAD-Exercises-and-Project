module scan_log(data_in, ready, left, right, is_number);
input [7:0] data_in;
input ready, is_number;

output reg [7:0]  left, right;

wire new_log;

assign new_log = ready && is_number; 

always @(posedge new_log) 
begin
left  <= data_in;
right <= left; 
end

endmodule