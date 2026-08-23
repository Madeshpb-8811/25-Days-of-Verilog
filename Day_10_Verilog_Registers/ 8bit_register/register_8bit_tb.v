module register_8bit_tb();
reg clk,en;
reg [7:0] d;
wire [7:0] q;
register_8bit dut(
.clk(clk),
.en(en),
.d(d),
.q(q));
always 
#5 clk=~clk;

initial 
begin 
    $monitor("CLOCK=%b,ENABLE=%b,D=%b,Q=%b",clk,en,d,q);
  clk=0;
   d=8'b00001111;en =1'b0;#10 
   d=8'b00001111;en =1'b1;#10
  d=8'b10001111;en =1'b0;#10
  d=8'b10001111;en =1'b1;#10
 d=8'b01001111;en =1'b0;#10
d=8'b01001111;en =1'b1;#10
 d=8'b00101111;en =1'b0;#10
d=8'b00101111;en =1'b1;#10
 d=8'b00011111;en =1'b0;#10
 d=8'b00011111;en =1'b1;#10 
$finish; 


end 
endmodule