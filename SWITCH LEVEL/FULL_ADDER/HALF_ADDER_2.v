module HALF_ADDER_2(a,b,sum,carry2);
    input a,b;
    output sum,carry2;

    //directions
    XOR_GATE BASU(.a(a),
                  .b(b),
                  .y(sum)
                  );
    AND_GATE GOWRI(.a(a),
                  .b(b),
                  .y(carry2)
                  );
endmodule
    
  
