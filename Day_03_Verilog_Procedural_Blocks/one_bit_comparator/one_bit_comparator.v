module one_bit_comparator(
input A,B,
output reg greater,equal,less);
always @(*)
  begin
     if(A>B)
     begin

      greater=1;  less = 0;equal=0; 
     end

    else if(A<B)
     begin 

       less = 1;  equal=0; greater=0;
      end 
    else 
       begin

        equal=1; greater=0; less = 0;
       end

  end
endmodule   
