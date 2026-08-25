module mod_6_counter_tb();   
reg clk,rst;
wire [2:0] q; 
mod_6_counter dut(  
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
rst=0;#60 
rst=1;#10
rst=0;#120
$finish;


end
endmodule