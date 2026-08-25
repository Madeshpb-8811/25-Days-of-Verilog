module up_counter(
input clk,rst,
output reg [3:0] q 
);
always @(posedge clk)
begin 
 if(rst)
q<=4'b0000;
else if(q==4'b1111) 
q<=4'b0000;
else 
q<=q+1'b1;
end
endmodule
