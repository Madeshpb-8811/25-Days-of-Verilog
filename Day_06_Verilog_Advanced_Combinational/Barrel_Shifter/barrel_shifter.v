module barrel_shifter(  
input [7:0]data,  
input[2:0]shift,  
input dir ,  
output reg [7:0] out);  
always @(*)  
begin  
 if(dir)  
  begin   
       
      out=data>>shift; 
  end  
else  
begin   
  
     out=data<<shift; 
  end  
end  
endmodule
