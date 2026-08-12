module four_bit_magnitude_comparator(  
input  [3:0] A,  
input   [3:0] B,  
output reg greater,equal,less);
always @(*)
begin
if(A>B)
begin
 greater=1;equal=0;less=0;
end
else if(A<B)
begin
 greater=0;equal=0;less=1;
end
else
begin
 greater=0;equal=1;less=0;
end
end
endmodule
