module jk_flip_flop( 
    input j,k,clk, 
    output reg q
);

always @(posedge clk)
begin 
    if(j==1 && k==1) 
        q <= ~q; 
    else if(j==0 && k==1)
        q <= 1'b0;
    else if(j==1 && k==0)
        q <= 1'b1;
    
end

endmodule
