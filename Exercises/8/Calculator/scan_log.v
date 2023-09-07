module scan_log(data_in, ready, left, right);
input [7:0] data_in;
input ready;

output reg [7:0]  left, right;

always @(posedge ready) 
begin
	left<=data_in;
	right<=left;
end
endmodule