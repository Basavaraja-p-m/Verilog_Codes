module HALF_SUBTRACTER(a,b,diff,barrow);
    input a,b;
    output diff,barrow;

     // gate primitives
     wire w;
     xor x(diff,a,b);
     and a1(barrow,w1,b);
     not n(w1,a);
endmodule

//testbench code
 module HALF_SUBTRACTER_tb();
     reg a,b;
     wire diff,barrow;

     //instantiation
     HALF_SUBTRACTER HS(a,b,diff,barrow);

     //procedurel block
     initial begin
      repeat(5)
      begin
      a=$random; b=$random; #10;
      end
      end
      initial
       $monitor("a=%d b=%d diff=%d barrow=%d Time=%0t",a,b,diff,barrow,$time);
  endmodule
