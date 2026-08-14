module priority_encoder_tb();  
reg [3:0]in; 
wire [1:0]out; 
priority_encoder dut( 
.in(in), 
.out(out)
);
initial 
begin
$monitor("input=%b,output=%b",in,out); 
 in=4'b1111; 
 #10
 in=4'b0011; 
 #10
 in=4'b0111; 
 #10
 in=4'b0001; 
 #10
$finish;
end
endmodule
