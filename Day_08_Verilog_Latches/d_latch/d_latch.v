module d_latch(   
input d,  
input en, 

output reg  q);  
always @(*) 
begin      
    if( en ==1)    
          q=d;    
end 
endmodule
