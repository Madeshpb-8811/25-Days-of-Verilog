module gray_to_binary(
input [3:0] g,
output [3:0] b);
assign b ={g[3],
g[3]^g[2],
g[3]^g[2]^g[1],
g[3]^g[2]^g[1]^g[0]}; 
endmodule
