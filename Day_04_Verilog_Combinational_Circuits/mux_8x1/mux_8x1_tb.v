module mux_8x1_tb();  
reg a,b,c,d,e,f,g,h; 
reg [2:0]sel;  
wire y;
mux_8x1 dut(  
.a(a),
.b(b),
.c(c),
.d(d),
.e(e),
.f(f),
.g(g),
.h(h),


.sel(sel),
.y(y));
initial
begin
    $monitor("A=%b,B=%b,C=%b,D=%b,E=%b,F=%b,G=%b,H=%b,SEL=%b,Y=%b,",a,b,c,d,e,f,g,h,sel,y);   
a=0; b=1; c=0; d=1; e=0; f=1; g=0; h=1; sel=3'b000;
#10
a=0; b=1; c=0; d=1; e=0; f=1; g=0; h=1; sel=3'b001;
#10
a=0; b=1; c=0; d=1; e=0; f=1; g=0; h=1; sel=3'b010;
#10
a=0; b=1; c=0; d=1; e=0; f=1; g=0; h=1; sel=3'b011;
#10
a=0; b=1; c=0; d=1; e=0; f=1; g=0; h=1; sel=3'b100;
#10
a=0; b=1; c=0; d=1; e=0; f=1; g=0; h=1; sel=3'b101;
#10
a=0; b=1; c=0; d=1; e=0; f=1; g=0; h=1; sel=3'b110;
#10
a=0; b=1; c=0; d=1; e=0; f=1; g=0; h=1; sel=3'b111;
#30
$finish; 
end  
endmodule 
 
