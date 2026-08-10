module full_subtractor(
input A,B,Bin,
output diff,borrow);

assign diff = (A^B)^Bin;
assign borrow = (~A&B)|(~(A^B)&Bin);

endmodule
