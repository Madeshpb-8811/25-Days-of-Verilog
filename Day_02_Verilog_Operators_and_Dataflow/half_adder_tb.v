module half_adder_tb();

reg A,B;

wire sum,carry;


half_adder dut(

.A(A),

.B(B),

.sum(sum),

.carry(carry));

initial
begin
 $monitor("A=%b,B=%b,sum=%b,carry=%b",A,B,sum,carry);
    A=0;B=0;
      #10    
    A=0;B=1;
      #10
    A=1;B=0;
      #10
    A=1;B=1;
      #10
$finish;


end

endmodule
