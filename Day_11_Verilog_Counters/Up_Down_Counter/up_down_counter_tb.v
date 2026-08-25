module up_down_counter_tb();   
reg clk,rst,select; 
wire [3:0] q;
up_down_counter dut(  
.clk(clk),
.rst(rst),
.select(select),

.q(q));
always  
#5 clk =~clk;

initial
begin 
$monitor("CLOCK=%b,SELECT=%b,RESET=%b,Q=%b",clk,select,rst,q); 
clk=0;

rst=1;#10
select =1'b0;rst=0;#220 
rst=1;#10
select =1'b1;rst=0;#220 
rst=1;#10
$finish;


end
endmodule