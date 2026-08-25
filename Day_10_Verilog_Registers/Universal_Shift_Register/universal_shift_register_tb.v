module universal_shift_register_tb(); 
      reg clk; 
    reg [1:0] select; 
     reg serial_left; 
     reg serial_right; 
    reg [3:0] parallel_in; 
    wire   [3:0] q ;
  universal_shift_register dut (
.clk(clk),
.select(select),
.serial_left(serial_left),
.serial_right(serial_right),
.parallel_in(parallel_in),
.q(q)
);

always
#5 clk=~clk;
initial
begin
    $monitor("SELECT=%b,SL=%b,SR=%b,D=%b,Q=%b",
             select,serial_left,serial_right,parallel_in,q);

    clk=0;
    select=2'b00;
    serial_left=1'b0;
    serial_right=1'b0;
    parallel_in=4'b0000;

    // Load
    select=2'b11; parallel_in=4'b0110; #10

    // Shift right
    select=2'b01; serial_right=1'b1; #10
    select=2'b01; serial_right=1'b0; #10

    // Shift left
    select=2'b10; serial_left=1'b1; #10
    select=2'b10; serial_left=1'b0; #10

    // Hold
    select=2'b00; #10

    // Shift left without changing serial_right
    select=2'b10; serial_left=1'b1; #10

    $finish;
end
endmodule