module universal_shift_register(
    input clk,
    input [1:0] select,
    input serial_left,
    input serial_right,
    input [3:0] parallel_in,
    output reg [3:0] q
);
always@(posedge clk)
begin
  case(select)
     2'b01:q<={serial_right,q[3],q[2],q[1]};
     2'b10:q<={q[2],q[1],q[0],serial_left};
     2'b11:q<=parallel_in;
 endcase 
end
endmodule
