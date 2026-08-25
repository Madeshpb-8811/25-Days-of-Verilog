module up_down_counter( 
  input clk,rst,select, 
  output reg [3:0] q  );
 always @(posedge clk) 
begin 
 if(rst) q<=4'b0000;  
else
begin
    case(select)
        1'b0:
        begin
            if(q == 4'b0000)
                q <= 4'b1111;
            else
                q <= q - 1'b1;
        end

        1'b1:
        begin
            if(q == 4'b1111)
                q <= 4'b0000;
            else
                q <= q + 1'b1;
        
        end
    endcase
end
end
endmodule
