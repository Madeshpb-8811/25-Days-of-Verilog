module barrel_shifter_tb(); 
reg [7:0] data ; 
reg [2:0] shift; 
reg dir; 
wire [7:0] out; 
barrel_shifter dut( 
.data(data), 
.shift(shift), 
.dir(dir), 
.out(out)); 
initial 
begin 
$monitor("DATA=%b,SHIFT=%b,DIRECTION=%b,OUT=%b",data,shift,dir,out); 
    
data=8'b11111111;dir=1'b1;shift=3'b000; 
 
    #10 
data=8'b11111111;dir=1'b1;shift=3'b001; 
 
    #10 
data=8'b11111111;dir=1'b1;shift=3'b010; 
 
    #10 
data=8'b11111111;dir=1'b1;shift=3'b011; 
 
    #10 
data=8'b11111111;dir=1'b1;shift=3'b100; 
 
    #10 
data=8'b11111111;dir=1'b1;shift=3'b101; 
 
    #10 
data=8'b11111111;dir=1'b1;shift=3'b110; 
 
    #10 
data=8'b11111111;dir=1'b1;shift=3'b111; 
 
    #10 
 
 
data=8'b11111111;dir=1'b0;shift=3'b000; 
 
    #10 
 
data=8'b11111111;dir=1'b0;shift=3'b001; 
 
    #10 
 
data=8'b11111111;dir=1'b0;shift=3'b010; 
 
    #10 
 
data=8'b11111111;dir=1'b0;shift=3'b011; 
 
    #10 
 
data=8'b11111111;dir=1'b0;shift=3'b100; 
 
    #10 
 
data=8'b11111111;dir=1'b0;shift=3'b101; 
 
    #10 
 
data=8'b11111111;dir=1'b0;shift=3'b110; 
 
    #10 
 
data=8'b11111111;dir=1'b0;shift=3'b111; 
 
    #30 
$finish; 
end 
endmodule