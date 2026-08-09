module and_gate_tb() ; 
  reg A,B; 
  wire Y;
 and_gate dut(
    .A(A),
   .B(B),
   .Y(Y)); 
$monitor("A=%b,B=%b,Y=%b",A,B,Y) ; 
 initial
   begin 
     A=0,B=0; 
     #10
     A=0,B=1; 
     #10
     A=1,B=0; 
     #10
     A=1,B=1; 
     #50
     $finish
 end
endmodule
