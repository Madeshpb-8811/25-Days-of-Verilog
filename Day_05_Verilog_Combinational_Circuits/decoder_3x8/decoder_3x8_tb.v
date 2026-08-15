module decoder_3x8_tb(); 
reg [2:0] sel; 
wire [7:0] out; 
decoder_3x8 dut( 
.sel(sel), 
.out(out)); 
initial 
begin 
    $monitor("SELECTION=%b,OUTPUT=%b",sel,out); 
          
sel=3'b000; 
 
            #20 
sel=3'b001; 
 
            #20 
sel=3'b010; 
 
            #20 
sel=3'b011; 
 
            #20 
sel=3'b100; 
 
            #20 
sel=3'b101; 
 
            #20
sel=3'b110; 
 
            #20

sel=3'b111;

            #20
$finish;
end
endmodule
