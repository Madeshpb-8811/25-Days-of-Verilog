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

//not gate logic
module not_gate(
  input A,
  output Y
);
  assign Y = ~A;
endmodule
