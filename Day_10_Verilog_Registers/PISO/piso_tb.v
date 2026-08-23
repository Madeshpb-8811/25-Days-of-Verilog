module piso_tb();
reg clk,load;
reg [3:0] parallel_in;
wire [3:0] register;
wire serial_out;
piso dut(
.clk(clk),
.load(load),
.parallel_in(parallel_in),
.register(register),
.serial_out(serial_out));
always 
#5 clk=~clk;
initial 
begin
   $monitor("CLOCK=%b,LOAD=%b,PARALLEL_IN=%b,REGISTER=%b,SERIAL_OUT=%b,",clk,load,parallel_in,register,serial_out);
clk=0;
parallel_in=4'b0010;load=1'b1;#10 
parallel_in=4'b1010;load=1'b0;#10
parallel_in=4'b1010;load=1'b0;#10
parallel_in=4'b1010;load=1'b0;#10
parallel_in=4'b1010;load=1'b0;#10
parallel_in=4'b1010;load=1'b1;#10
parallel_in=4'b0010;load=1'b1;#10
$finish;
end 
endmodule