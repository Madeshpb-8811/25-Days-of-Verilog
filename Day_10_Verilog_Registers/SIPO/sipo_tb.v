module sipo_tb();  
reg clk,serial_in;
wire [3:0] q;
sipo dut( 
.clk(clk),
.serial_in(serial_in),
.q(q));
always
#5 clk=~clk;
initial
begin
$monitor("CLOCK=%b,SERIAL_IN=%b,Q=%b",clk,serial_in,q);

 clk=0;
serial_in=1;#10 
serial_in=1;#10 
serial_in=0;#10 
serial_in=1;#10
serial_in=1;#10 
serial_in=0;#10
serial_in=0;#10 
serial_in=1;#10 
$finish; 
end
endmodule