module one_bit_comparator_tb(); 
reg A,B; 
wire greater,equal,less;
one_bit_comparator dut(
.A(A),
.B(B),
.greater(greater),
.equal(equal),
.less(less));

initial
begin
$monitor("A=%b,B=%b,GREATER=%b,EQUAL=%b,LESS=%b,",A,B,greater,equal,less);
A=0;B=0; 
#10
A=0;B=1; 
#10
A=1;B=0; 
#10
A=1;B=1; 
#30
$finish; 
end
endmodule
