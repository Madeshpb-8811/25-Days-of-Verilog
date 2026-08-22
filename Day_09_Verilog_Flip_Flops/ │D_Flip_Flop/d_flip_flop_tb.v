module d_flip_flop_tb();
reg d,clk;
wire q;

d_flip_flop dut( 
.d(d),
.clk(clk),
.q(q));

always
#5 clk=~clk;

initial
begin 
 $monitor("CLOCK=%b;D=%b,Q=%b",clk,d,q); 
clk=0; 

d=1'b0;#10 
d=1'b1;#10
d=1'b1;#10
d=1'b0;#10 
$finish;
end
endmodule