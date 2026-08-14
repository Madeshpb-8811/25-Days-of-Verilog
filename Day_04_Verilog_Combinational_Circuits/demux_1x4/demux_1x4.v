module demux1x4(
input a, 
input[1:0] sel, 
output reg [3:0] out);
always@(*)
begin
    case(sel)
     2'b00:out={3'b000,a}; 
      2'b01:out={2'b00,a,1'b0};  
      2'b10:out={1'b0,a,2'b00}; 
       2'b11:out={a,3'b000}; 
default:out=4'b0000; 
      endcase
end
endmodule 
