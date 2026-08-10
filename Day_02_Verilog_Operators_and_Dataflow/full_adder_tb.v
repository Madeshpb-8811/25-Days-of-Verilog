module full_adder_tb();

reg A,B,Cin;

wire sum,carry;

full_adder dut(

.A(A),

.B(B),

.Cin(Cin),

.sum(sum),

.carry(carry));

initial

begin

    $monitor("A=%b,B=%b,Cin=%b,sum=%b,carry=%b",A,B,Cin,sum,carry);
         A=0;B=0;Cin=0;
             #10
        A=0;B=0;Cin=1;
             #10
        A=0;B=1;Cin=0;
             #10
         A=0;B=1;Cin=1;
             #10
        A=1;B=0;Cin=0;
             #10
       A=1;B=0;Cin=1;
             #10
      A=1;B=1;Cin=0;
             #10
      A=1;B=1;Cin=1;
            #20
$finish;
end
endmodule
