module ring_counter_tb();   
reg clk,rst;
wire [3:0] q;
ring_counter dut(  
.clk(clk),
.rst(rst),
.q(q));
always  
#5 clk =~clk;

initial
begin 
$monitor("CLOCK=%b,RESET=%b,Q=%b",clk,rst,q);
clk=0;
rst=1;#10
rst=0;#80
rst=1;#10
rst=0;#40 
$finish;


end
endmodule