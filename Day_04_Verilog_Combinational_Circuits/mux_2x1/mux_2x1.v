module mux_2x1(
input a,b,
input sel,
output reg y );
always@(*)
begin 
     case(sel)
       1'b0: y=a;
        1'b1: y=b;
      endcase
   end
endmodule
