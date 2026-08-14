module decoder_tb(); 
reg [1:0]sel;
wire [3:0]out;
decoder dut(
.sel(sel),
.out(out)
);
initial 
begin
$monitor("selection=%b,output=%b",sel,out);
 sel=2'b00;
 #10
 sel=2'b01;
 #10
 sel=2'b10;
 #10
 sel=2'b11;
 #10
$finish;
end
endmodule
