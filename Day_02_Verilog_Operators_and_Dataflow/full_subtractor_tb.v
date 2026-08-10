module full_subtractor_tb();

reg A,B,Bin;
wire diff,borrow;

full_subtractor dut(
    .A(A),
    .B(B),
    .Bin(Bin),
    .diff(diff),
    .borrow(borrow)
);

initial
begin
    $monitor("A=%b,B=%b,Bin=%b,diff=%b,borrow=%b",
             A,B,Bin,diff,borrow);

    A=0; B=0; Bin=0;
    #10

    A=0; B=0; Bin=1;
    #10

    A=0; B=1; Bin=0;
    #10

    A=0; B=1; Bin=1;
    #10

    A=1; B=0; Bin=0;
    #10

    A=1; B=0; Bin=1;
    #10

    A=1; B=1; Bin=0;
    #10

    A=1; B=1; Bin=1;
    #20

    $finish;
end

endmodule
