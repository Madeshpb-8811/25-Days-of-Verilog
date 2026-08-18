module parity_checker(input [3:0]d,
input received_parity,
output error);
assign error = d[3]^d[3]^d[3]^d[3]^received_parity;
endmodule

module parity_checker(input [3:0]d,
input received_parity,
output error);
assign error = d[3]^d[2]^d[1]^d[0]^received_parity; 
endmodule
