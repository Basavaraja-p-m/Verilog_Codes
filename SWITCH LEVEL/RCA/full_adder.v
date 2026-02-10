 `include "HALF_ADDER.v"
 `include "OR_GATE.v"
  module full_adder(a,b,c,sum,carry);
     input a,b,c;
     output sum,carry;

     //internal signols
     wire w1,w2,w3;

     //instantiation
     HALF_ADDER HA1(.a(a),
                   .b(b),
                   .sum(w1),
                   .carry(w2)
                   );
     HALF_ADDER BA2(.a(w1),
                   .b(c),
                   .sum(sum),
                   .carry(w3)
                   );
     OR_GATE OG(.a(w2),
                .b(w3),
                .y(carry)
                );
   endmodule

   //test bench
   `include "HALF_ADDER.v"
    `include "OR_GATE.v"

   module full_adder_tb();
       reg tb_a,tb_b,tb_c;
       wire tb_sum,tb_carry;

       //instantiation
       full_adder SA(.a(tb_a),
                     .b(tb_b),
                     .c(tb_c),
                     .sum(tb_sum),
                     .carry(tb_carry)
                     );
       initial begin
           tb_a=0; tb_b=0; tb_c=0; #10;
           tb_a=0; tb_b=0; tb_c=1; #10;
           tb_a=0; tb_b=1; tb_c=0; #10;
           tb_a=0; tb_b=1; tb_c=1; #10;
       end
       initial
          $monitor("tb_a=%b tb_b=%b tb_c=%b tb_sum=%b tb_carry=%b Time=%t",tb_a,tb_b,tb_c,tb_sum,tb_carry,$time);
 endmodule
          
