module and_gate (
  input A,B,
  output y
);
assign y = A & B;
endmodule

//or gate logic
module or_gate(
  input A,B,
  output Y
);
  assign Y = A|B;
endmodule
