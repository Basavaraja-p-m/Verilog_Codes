module FULL_ADDER(a,b,c,sum,carry);
    input a,b,c;
    output sum,carry;

    //instantiation
    HALF_ADDER_1 DUT(.a(a),
                     .b(b),
                     .sum1(sum1),
                     .carry1(carry1)
                     );
    HALF_ADDER_2 DFT(.a(sum1),
                     .b(c),
                     .sum(sum),
                     .carry2(carry2)
                     );
    OR_GATE ABC(.a(carry1),
                .b(carry2),
                .y(carry)
                );
endmodule

   //testbench code
   module FULL_ADDER_tb();
       reg tb_a,tb_b,tb_c;
       wire tb_sum,tb_carry;

       //instantiation
       FULL_ADDER DEF(.a(tb_a),
                      .b(tb_b),
                      .c(tb_c),
                      .sum(tb_sum),
                      .carry(tb_carry)
                      );
      

       initial begin
          tb_a=0; tb_b=0; tb_c=0; #10;          tb_a=0; tb_b=0; tb_c=1; #10;
          tb_a=0; tb_b=1; tb_c=0; #10;          tb_a=0; tb_b=1; tb_c=1; #10;
          tb_a=1; tb_b=0; tb_c=0; #10;          tb_a=1; tb_b=0; tb_c=1; #10;          tb_a=1; tb_b=1; tb_c=0; #10;          tb_a=1; tb_b=1; tb_c=1; #10;        end
          initial
           $monitor("tb_a=%b tb_b=%b tb_c=%b tb_sum=%b tb_carry=%b Time=%t",tb_a,tb_b,tb_c,tb_sum,tb_carry,$time);
endmodule
