module even_odd_detector_tb();
reg [3:0] number;
wire even,odd;
even_odd_detector dut(
.number(number),
.even(even),
.odd(odd));
initial
begin
$monitor("number=%b,even=%b,odd=%b",number,even,odd);
number=4'b1001; 
#10
number=4'b1010; 
#10
number=4'b1100; 
#10
number=4'b1111; 
#10
number=4'b0000; 
#10
number=4'b1110; 
#10
number=4'b0001; 
#30
$finish;
end
endmodule
