module divide_by_4 (  
input clk,rst,  
output reg q);   
reg count;  
  
always @(posedge clk)  
begin  
  
  
   if(rst)  
    begin  
  
     q<=0;  
     count<=0;  
     end  
  
   else if(count== 1'b1)  
     begin  
     q<=~q;  
      count<=1'b0;  
     end  
  else  
   count<=count+1'b1;  
end  
endmodule
