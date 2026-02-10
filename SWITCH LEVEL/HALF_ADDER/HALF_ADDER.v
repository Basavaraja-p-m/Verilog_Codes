module HALF_ADDER(a,b,sum,carry);
    input a,b;
    output sum,carry;

    //directions
    XOR_GATE BASU(.a(a),
                  .b(b),
                  .y(sum)
                  );
    AND_GATE GOWRI(.a(a),
                  .b(b),
                  .y(carry)
                  );
endmodule
    
    //testbench code
    
    module HALF_ADDER_tb();
        reg tb_a,tb_b;
        wire tb_sum,tb_carry;

        //instantiation
        HALF_ADDER GATE(.a(tb_a),
                        .b(tb_b),
                        .sum(tb_sum),
                        .carry(tb_carry)
                        );

        initial begin
           tb_a=0; tb_b=0; #10;
           tb_a=0; tb_b=1; #10;
           tb_a=1; tb_b=0; #10;
           tb_a=1; tb_b=1; #10;
        end
        initial
           $monitor("tb_a=%b tb_b=%o tb_sum=%h tb_carry=%d Time=%t",tb_a,tb_b,tb_sum,tb_carry,$time);
endmodule 
