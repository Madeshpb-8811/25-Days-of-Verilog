module full_adder(
input A,B,Cin,
output sum,carry);
assign sum = (A^B)^Cin;
assign carry =( A&B)|(Cin&(A^B));   
endmodule
