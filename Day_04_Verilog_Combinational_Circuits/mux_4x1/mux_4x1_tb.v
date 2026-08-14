module mux_4x1_tb(); 
reg a,b,c,d;
reg [1:0]sel; 
wire y;
mux_4x1 dut( 
.a(a),
.b(b),
.c(c),
.d(d),

.sel(sel),
.y(y));
initial
begin
    $monitor("A=%b,B=%b,C=%b,D=%b,SEL=%b,Y=%b,",a,b,c,d,sel,y);  
    a=0; b=1; c=0; d=1; sel=2'b00;
#10
a=0; b=1; c=0; d=1; sel=2'b01;
#10
a=0; b=1; c=0; d=1; sel=2'b10;
#10
a=0; b=1; c=0; d=1; sel=2'b11;
#10

a=1; b=0; c=1; d=0; sel=2'b00;
#10
a=1; b=0; c=1; d=0; sel=2'b01;
#10
a=1; b=0; c=1; d=0; sel=2'b10;
#10
a=1; b=0; c=1; d=0; sel=2'b11;
#30
$finish; 
end  
endmodule 
 
