module half_subtractor(
input A,B,
output diff,borrow);

assign diff = A^B;
assign borrow = (~A)&B;

endmodule
