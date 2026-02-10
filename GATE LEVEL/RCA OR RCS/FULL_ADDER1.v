module FULL_ADDER1(a,b,cin,sum,carry);
      input a,b,cin;
      output sum,carry;

      //gate primitives

      wire w1,w2,w3;
      xor x1(w1,a,b);
      xor x2(sum,w1,cin);
      and a1(w2,a,b);
      and a2(w3,w1,cin);
      or o1(carry,w3,w2);
endmodule

      //testbench code
      module FULL_ADDER1_tb();
          reg a,b,cin;
          wire sum,carry;

          //instantiation
          FULL_ADDER1 FA1(a,b,cin,sum,carry);

          //procedural block
          initial begin
            repeat(5)
              begin
              a=$random; b=$random; cin=$random; #10;
              end
           end
           initial
              $monitor("a=%d b=%d cin=%d sum=%d carry=%d Time=%t",a,b,cin,sum,carry,$time);
         endmodule
