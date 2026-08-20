module d_latch_tb();

reg d, en;
wire q;

d_latch dut(
    .d(d),
    .en(en),
    .q(q)
);

initial
begin

    $monitor("D=%b, ENABLE=%b, Q=%b", d, en, q);

    d=0; en=0;
    #10

    d=0; en=1;
    #10

    d=0; en=0;
    #10

    d=1; en=0;
    #10

    d=0; en=0;
    #10

    d=1; en=1;
    #10

    d=0; en=0;
    #30

    d=1; en=1;
    #10

    d=0; en=1;
    #10

    d=1; en=1;
    #10

    d=0; en=0;
    #30

    $finish;

end

endmodule