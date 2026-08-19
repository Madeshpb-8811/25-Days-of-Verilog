module alu_8bit_tb();

reg [7:0] a;
reg [7:0] b;
reg [2:0] op;
wire [7:0] result;

alu_8bit dut(
    .a(a),
    .b(b),
    .op(op),
    .result(result)
);

initial
begin
    $monitor("A=%b, B=%b, OPERATION=%b, RESULT=%b", a, b, op, result);

    a = 8'd25; b = 8'd23; op = 3'b000;
    #10
    a = 8'd25; b = 8'd23; op = 3'b001;
    #10
    a = 8'd25; b = 8'd23; op = 3'b010;
    #10
    a = 8'd25; b = 8'd23; op = 3'b011;
    #10
    a = 8'd25; b = 8'd23; op = 3'b100;
    #10
    a = 8'd25; b = 8'd23; op = 3'b101;
    #10
    a = 8'd25; b = 8'd23; op = 3'b110;
    #10
    a = 8'd25; b = 8'd23; op = 3'b111;

    #10
    a = 8'd200; b = 8'd75; op = 3'b000;
    #10
    a = 8'd200; b = 8'd75; op = 3'b001;
    #10
    a = 8'd200; b = 8'd75; op = 3'b010;
    #10
    a = 8'd200; b = 8'd75; op = 3'b011;
    #10
    a = 8'd200; b = 8'd75; op = 3'b100;
    #10
    a = 8'd200; b = 8'd75; op = 3'b101;
    #10
    a = 8'd200; b = 8'd75; op = 3'b110;
    #10
    a = 8'd200; b = 8'd75; op = 3'b111;

    #20
    a = 8'd0; b = 8'd0; op = 3'b000;
    #10
    a = 8'd255; b = 8'd1; op = 3'b000;
    #10
    a = 8'd0; b = 8'd255; op = 3'b001;
    #10
    a = 8'b11111111; b = 8'b00000000; op = 3'b010;
    #10
    a = 8'b10101010; b = 8'b01010101; op = 3'b100;
    #10
    a = 8'b10000001; b = 8'd0; op = 3'b110;
    #10
    a = 8'b10000001; b = 8'd0; op = 3'b111;

    #10
    a = 8'd0;
    b = 8'd255;
    op = 3'b001;

    #20;

    $finish;
end

endmodule
