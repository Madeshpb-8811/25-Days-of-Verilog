module four_number_max__tb();
reg [3:0]A,B,C,D; 
wire [3:0]max; 
four_number_max  dut( 
.A(A),
.B(B),
.C(C),
.D(D),
.max(max));
initial
begin
    $monitor("A=%b,B=%b,C=%b,D=%b,max=%b",A,B,C,D,max);
         A=4'b0001;B=4'b0010;C=4'b0011;D=4'b0100;
            #10
          
A=4'b1011;B=4'b1110;C=4'b1111;D=4'b0110; 
 #10
A=4'b0101;B=4'b1010;C=4'b0111;D=4'b1100;
#10
A=4'b1001;B=4'b0110;C=4'b1011;D=4'b0101;
#10
A=4'b1101;B=4'b0110;C=4'b1011;D=4'b0100;
#30
$finish;
end
endmodule
