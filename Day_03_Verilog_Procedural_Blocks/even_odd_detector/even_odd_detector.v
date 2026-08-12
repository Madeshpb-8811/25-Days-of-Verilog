module even_odd_detector(
input [3:0]number,
output reg even ,odd); 
always @(*)
begin
if(number[0] ==0)
   begin
   even=1'b1;
   odd=1'b0;
    end
else
begin
   odd=1'b1;
   even=1'b0;
end

end
endmodule
