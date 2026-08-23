module piso( 
input clk,load, 
input [3:0] parallel_in, 
output reg [3:0] register, 
output reg serial_out  
); 
always @(posedge clk) 
begin 
   serial_out<=register[0];  

   if(load) 
   register<= parallel_in; 
   else
    register<={1'b0,register[3],register[2],register[1]};  
end  
endmodule
