module bcd_to_7seg_tb(); 
reg [3:0] bcd;
wire [6:0] out;
bcd_to_7seg dut( 
.bcd(bcd), 
.out(out));
initial
begin
   $monitor("BCD=%b,7SEGMENT=%b",bcd,out); 
bcd=4'b0000;#10 
bcd=4'b0001;#10
bcd=4'b0010;#10
bcd=4'b0011;#10
bcd=4'b0100;#10
bcd=4'b0101;#10
bcd=4'b0110;#10
bcd=4'b0111;#10
bcd=4'b1000;#10
bcd=4'b1001;#10
bcd=4'b1010;#20

$finish;
end
endmodule 