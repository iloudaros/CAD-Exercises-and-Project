module counter_tb;
reg [7:0] data_in;
wire [7:0] count;
reg enable, l, clk, clr;
integer i,error;


counter_8bit dut (clr, clk, l, enable, count, data_in);

always #5 clk = ~clk;

initial begin

    clk <= 0; clr <= 1; l <= 0;  enable <= 0;  data_in <= 8'b0; i <=0; error <=0;
    #1;
    clr = 0;

    // Load Test
    l=1;
    repeat(2**8) begin
        data_in = i;
        #5;
        if (count !=i) error = error+1;
        #5;
        i=i+1;
    end

    if (!error) $display("Load works correctly");
    else $display("Load test ended with %d errors", error);
    


    //clr test 
    data_in = 8'b11111111;
    error = 0;
    #10;
    l=0;
    clr = 1;
    #10 clr = 0;
    if (count) error = 1; 
    if (!error) $display("Clear works correctly");
    else $display("Clear test ended with errors");


    //count test
    enable=1;
    error=0;
    i=0;
    repeat(2**8) begin
        if(i!=count) error=1;
        #10;
        i=i+1;
    end

    if (!error) $display("Count works correctly");
    else $display("Count test ended with errors");

    #10;

    //Enable test
    enable = 0;
    error = 0;

    i=count;

    #100;

    if(count!=i) error = 1;

    if (!error) $display("Enable works correctly");
    else $display("Enable test ended with errors");


    #10;




    
    $finish;
end


endmodule