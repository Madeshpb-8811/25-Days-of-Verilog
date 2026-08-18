module parity_checker_tb( ); 
reg [3:0] d; 
reg received_parity; 

wire error;  
parity_checker dut( 
.d(d),
.received_parity(received_parity),
.error(error)); 
initial
begin
$monitor("DATA=%b,RECEIVED_PARITY=%b,ERROR=%b",d,received_parity,error);  
d=4'b0000;received_parity=0;#10 
d=4'b0001;received_parity=0;#10
d=4'b0010;received_parity=0;#10
d=4'b0011;received_parity=0;#10
d=4'b0100;received_parity=0;#10
d=4'b0101;received_parity=0;#10
d=4'b0110;received_parity=0;#10
d=4'b0111;received_parity=0;#10
d=4'b1000;received_parity=0;#10
d=4'b1001;received_parity=0;#10
d=4'b1010;received_parity=0;#10
d=4'b1011;received_parity=0;#10
d=4'b1100;received_parity=0;#10
d=4'b1101;received_parity=0;#10
d=4'b1110;received_parity=0;#10
d=4'b1111;received_parity=0;#10

d=4'b0000;received_parity=1;#10 
d=4'b0001;received_parity=1;#10 
d=4'b0010;received_parity=1;#10 
d=4'b0011;received_parity=1;#10 
d=4'b0100;received_parity=1;#10 
d=4'b0101;received_parity=1;#10 
d=4'b0110;received_parity=1;#10 
d=4'b0111;received_parity=1;#10 
d=4'b1000;received_parity=1;#10 
d=4'b1001;received_parity=1;#10 
d=4'b1010;received_parity=1;#10 
d=4'b1011;received_parity=1;#10 
d=4'b1100;received_parity=1;#10 
d=4'b1101;received_parity=1;#10 
d=4'b1110;received_parity=1;#10 
d=4'b1111;received_parity=1;#10

$finish; 
end

endmodule