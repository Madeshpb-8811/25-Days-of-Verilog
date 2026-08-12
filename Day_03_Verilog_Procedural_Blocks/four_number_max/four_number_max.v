module four_number_max(
input [3:0]A,B,C,D,
output reg max); 
reg [3:0] temp; 
always @(*) 
begin
temp = A;
if(B>temp)
   temp =B;
 if (C>temp)
   temp =C;
if (D>temp)
   temp =D;
max=temp;
end
endmodule
