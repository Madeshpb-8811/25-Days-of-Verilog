module four_bit_magnitude_comparator_tb(); 
reg [3:0]A,B;
wire greater,equal,less; 

four_bit_magnitude_comparator dut(
.A(A),
.B(B),
.greater(greater),
.equal(equal),
.less(less));

initial
begin
$monitor("A=%b,B=%b,greater=%b,equal=%b,less=%b",A,B,greater,equal,less);
A=4'b1001;B=4'b1010;
#10
A=4'b1011;B=4'b1011;
#10
A=4'b1101;B=4'b1000;
#10
A=4'b0001;B=4'b0010;
#10
A=4'b1101;B=4'b1101;
#10
A=4'b0111;B=4'b0010; 
#30
$finish;
end
endmodule
