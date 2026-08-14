module mux_2x1_tb();
reg a,b,sel;
wire y;
mux_2x1 dut(
.a(a),
.b(b),
.sel(sel),
.y(y));
initial
begin
    $monitor("A=%b,B=%b,SEL=%b,Y=%b,",a,b,sel,y);
    a=0;b=0;sel=0;
    #10
    a=0;b=0;sel=1;
    #10
    a=0;b=1;sel=0;
    #10
     a=0;b=1;sel=1;
    #10
      a=1;b=0;sel=0;
    #10
       a=1;b=0;sel=1;
    #10
     a=1;b=1;sel=0;
    #10
     a=1;b=1;sel=1;
    #30
   $finish;
end 
endmodule

