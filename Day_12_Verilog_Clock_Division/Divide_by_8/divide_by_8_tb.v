module divide_by_8_tb() ;   
reg clk,rst;  
wire q;


divide_by_8  dut (   
.clk(clk),
.rst(rst),


.q(q)); 

always 
#5 clk =~clk;
initial 
begin
$monitor("CLOCK=%b,RESET=%b,COUNT=%b,Q=%b",clk,rst,dut.count,q);  

clk =0;
rst=1'b1 ;#10 
rst=1'b0 ;#160 
$finish; 
end
endmodule