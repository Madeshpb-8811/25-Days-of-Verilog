module pipo_tb(); 
reg [7:0] d;
reg clk;
wire [7:0] q;
pipo dut(
.d(d),
.clk(clk),
.q(q));
always 
#5 clk=~clk ;
initial 
begin
     $monitor("CLOCK=%b,D=%b,Q=%b",clk,d,q); 
   clk=0;
d=8'b00001111;#10
d=8'b10001111;#10
d=8'b01001111;#10
d=8'b00101111;#10
d=8'b00011111;#10
d=8'b11001111;#10
d=8'b11101111;#10
$finish;
end 
endmodule 