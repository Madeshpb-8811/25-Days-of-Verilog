module jk_flip_flop_tb();
reg j,k,clk;
wire q;
jk_flip_flop dut(
.j(j),
.k(k),
.q(q),
.clk(clk));
always
#5 clk =~clk;
initial 
begin
  $monitor("J=%b,k=%b,CLOCK=%b,Q=%b,",j,k,clk,q); 
     clk=0; 
j=0;k=0;#10
j=1;k=0;#10
j=0;k=0;#10
j=0;k=1;#10
j=0;k=0;#10
j=1;k=0;#10
j=0;k=0;#10
j=1;k=1;#10 
j=0;k=0;#10
j=1;k=1;#10 
j=0;k=0;#10
$finish; 
end
endmodule