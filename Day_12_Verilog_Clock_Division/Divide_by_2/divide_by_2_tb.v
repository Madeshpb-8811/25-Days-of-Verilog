module divide_by_2_tb() ; 
reg clk,rst; 
wire q;
divide_by_2();

always 
#5 clk =~clk;
initial 
begin
$monitor("CLOCK=%b,RESET=%b,Q=%b",clk,rst,q);

clk =0;
rst=1'b1 ;#10 
rst=1'b0 ;#80
$finish; 
end
endmodule

module divide_by_2_tb() ; 
reg clk,rst; 
wire q;
divide_by_2  dut ( 
.clk(clk),
.rst(rst),
.q(q)); 

always 
#5 clk =~clk;
initial 
begin
$monitor("CLOCK=%b,RESET=%b,Q=%b",clk,rst,q);

clk =0;
rst=1'b1 ;#10 
rst=1'b0 ;#80
$finish; 
end
endmodule