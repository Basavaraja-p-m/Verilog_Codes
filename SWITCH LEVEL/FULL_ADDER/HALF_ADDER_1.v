module HALF_ADDER_1(a,b,sum1,carry1);
    input a,b;
    output sum1,carry1;

    //directions
    XOR_GATE BASU(.a(a),
                  .b(b),
                  .y(sum1)
                  );
    AND_GATE GOWRI(.a(a),
                  .b(b),
                  .y(carry1)
                  );
endmodule

