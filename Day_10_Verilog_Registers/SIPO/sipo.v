module sipo( 
    input serial_in,
    input clk,
    output  reg [3:0] q
);
always @(posedge clk) 
begin
q<={serial_in,q[3],q[2],q[1]};
end
endmodule
