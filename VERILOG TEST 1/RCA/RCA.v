`include "FULL_ADDER1.v"
module RCA(a,b,cin,sum,carry);
    parameter IN=8;
    input [$clog2(IN):0]a,b;
    input cin;
    output [$clog2(IN):0]sum;
    output carry;

    //instantiation
    FULL_ADDER1 FA1(.a(a[0]),
                    .b(b[0]),
                    .cin(cin),
                    .sum(sum[0]),
                    .carry(w1)
                   );
     FULL_ADDER1 FA2(.a(a[1]),
                    .b(b[1]),
                    .cin(w1),
                    .sum(sum[1]),
                    .carry(w2)
                    );
      FULL_ADDER1 FA3(.a(a[2]),
                    .b(b[2]),
                    .cin(w2),
                    .sum(sum[2]),
                    .carry(w3)
                    );
       FULL_ADDER1 FA4(.a(a[3]),
                    .b(b[3]),
                    .cin(w3),
                    .sum(sum[3]),
                    .carry(carry)
                    );
endmodule

       //testbench
       module RCA_tb();
          parameter IN=8;
          reg [$clog2(IN):0]a,b;
          reg cin;
          wire [$clog2(IN):0]sum;
          wire carry;

          //instantiation
          RCA R1(a,b,cin,sum,carry);

 
          initial
          repeat(10)
          begin
          a=$random; b=$random; cin=1;#10;
          end
          initial
          $monitor("a=%b b=%b cin=%b sum=%b carry=%b Time=%t",a,b,cin,sum,carry,$time);
          endmodule


