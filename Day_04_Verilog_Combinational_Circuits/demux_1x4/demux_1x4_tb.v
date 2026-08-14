module demux1x4_tb(); 
reg a; 
reg [1:0] sel ; 
wire [3:0] out; 
demux1x4 dut( 
.a(a), 
.sel(sel), 
.out(out)); 
initial 
begin 
   $monitor("A=%b,sel=%b,out=%b",a,sel,out); 
 
    a=0;sel=2'b00; 
     #10 
     a=0;sel=2'b01; 
     #10 
     a=0;sel=2'b10; 
     #10 
     a=0;sel=2'b11; 
     #10 
     a=1;sel=2'b00; 
     #10 
     a=1;sel=2'b01; 
     #10 
     a=1;sel=2'b10; 
     #10 
     a=1;sel=2'b11; 
     #30 
   $finish; 
end 
endmodule
