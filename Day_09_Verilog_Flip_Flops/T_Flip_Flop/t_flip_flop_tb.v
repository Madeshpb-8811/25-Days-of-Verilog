module t_flip_flop_tb();
reg t,clk,rst; 
wire q;
t_flip_flop dut(
.t(t),
.clk(clk),
.rst(rst),

.q(q));
always
#5 clk=~clk;
initial
begin 
  $monitor("CLOCK=%b,RESET=%b,T=%b,Q=%b,",clk,rst,t,q); 
 clk=0;rst=1;t=1;#10 
t=1;rst=0;#10
t=0;rst=0;#10
t=1;rst=0;#10
t=0;rst=0;#10
$finish;
end 
endmodule