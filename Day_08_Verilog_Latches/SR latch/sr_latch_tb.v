module sr_latch_tb();
reg s,r;
wire q;
sr_latch dut ( 
.s(s),
.r(r),
.q(q));

initial
begin
 
$monitor("S=%b,R=%b,Q=%b",s,r,q);
   s=0;r=0;
     #10
  s=0;r=1;
     #10
s=0;r=0;
     #10
s=1;r=0;
     #10
s=0;r=0;
     #10
s=1;r=1;
     #10
s=0;r=0;
     #30
$finish;
end
endmodule