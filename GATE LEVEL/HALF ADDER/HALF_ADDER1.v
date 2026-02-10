module HALF_ADDER1(a,b,sum,carry);
     input a,b;
     output sum,carry;

     //gate level primitives

     xor x1(sum,a,b);
     and a1(carry,a,b);
endmodule

     //testbench code

     module HALF_ADDER1_tb();
         reg tb_a,tb_b;
         wire tb_sum,tb_carry;

         //instantitaion

         HALF_ADDER1 HA1(.a(tb_a),
                         .b(tb_b),
                         .sum(tb_sum),
                         .carry(tb_carry)
                         );

           //procedural block

           initial begin
           repeat(4)
           begin
            tb_a=$random;tb_b=$random; #10;
           end
           end

          initial
            $monitor("tb_a=%b tb_b=%b tb_sum=%b tb_carry=%b Time=%t",tb_a,tb_b,tb_sum,tb_carry,$time);

endmodule






