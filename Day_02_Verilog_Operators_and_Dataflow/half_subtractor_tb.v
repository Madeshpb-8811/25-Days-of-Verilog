module half_subtractor_tb();

reg A,B;
wire diff,borrow;

half_subtractor dut(
    .A(A),
    .B(B),
    .diff(diff),
    .borrow(borrow)
);

initial
begin
    $monitor("A=%b,B=%b,diff=%b,borrow=%b",A,B,diff,borrow);

    A=0; B=0;
    #10

    A=0; B=1;
    #10

    A=1; B=0;
    #10

    A=1; B=1;
    #10

    $finish;
end

endmodule
