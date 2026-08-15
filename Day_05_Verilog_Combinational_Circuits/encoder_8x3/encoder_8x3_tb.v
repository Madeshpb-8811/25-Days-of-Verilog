module encoder_8x3_tb();  
reg [7:0] sel;  
wire [2:0] out;  
encoder_8x3 dut(  
.sel(sel),  
.out(out));  
initial  
begin  
    $monitor("SELECTION=%b,OUTPUT=%b",sel,out);  
           
sel=8'b00000001;  
  
            #20  
sel=8'b00000010;  
  
            #20  
sel=8'b00000100;  
  
            #20  
sel=8'b00001000; 
  
            #20  
sel=8'b00010000;
            #20  
sel=8'b00100000;
  
            #20 
sel=8'b01000000;
  
            #20 
 
sel=8'b10000000;
 
            #20 
$finish; 
end 
endmodule
