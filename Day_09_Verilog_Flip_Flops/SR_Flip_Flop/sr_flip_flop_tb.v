module sr_flip_flop_tb();
reg s,r,clk;
wire q;
sr_flip_flop dut(
.s(s),
.r(r),
.clk(clk),
.q(q));
always 
#5 clk=~clk;
initial
begin
  $monitor("S=%b,R=%b,CLOCK=%b,Q=%b,",s,r,clk,q);
   clk=0;
 s=0;r= 0;#10
 s=0;r= 1;#10
 s=0;r= 0;#10
 s=1;r= 0;#10
 s=0;r= 0;#10
 s=1;r= 1;#10
 s=0;r= 0;#10
$finish;
end 
endmodule
