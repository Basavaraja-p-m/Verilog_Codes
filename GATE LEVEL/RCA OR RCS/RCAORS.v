`include "FULL_ADDER1.v"
module RCAORS(
              input [3:0]a,b,
              input cin,
              input ctrl,
              output [3:0]B,
              output [3:0]s,
              output cout
              );

      //gate primitives
      xor x1(B[0],ctrl,b[0]);
      xor x2(B[1],ctrl,b[1]);
      xor x3(B[2],ctrl,b[2]);
      xor x4(B[3],ctrl,b[3]);
      wire [2:0]w;
      //instantiation
      FULL_ADDER1 FA1(.a(a[0]),
                     .b(B[0]),
                     .cin(cin),
                     .sum(s[0]),
                     .carry(w[0])
                     );
      FULL_ADDER1 FA2(.a(a[1]),
                     .b(B[1]),
                     .cin(w[0]),
                     .sum(s[1]),
                     .carry(w[1])
                     );
      FULL_ADDER1 FA3(.a(a[2]),
                     .b(B[2]),
                     .cin(w[1]),
                     .sum(s[2]),
                     .carry(w[2])
                     );
      FULL_ADDER1 FA4(.a(a[3]),
                     .b(B[3]),
                     .cin(w[2]),
                     .sum(s[3]),
                     .carry(cout)
                     );
      endmodule

      //testbench
      module RCAORS_tb();
          reg [3:0]a,b;
          reg cin;
          reg ctrl;
          wire [3:0]B;
          wire [3:0]s;
          wire cout;

          //instantiation
          RCAORS RS(a,b,cin,ctrl,B,s,cout);

          initial
           repeat(5)
          begin
           a=$random % 16;b=$random % 16;cin=1;ctrl=1;#10;
           end
           initial
           $monitor("a=%d b=%d cin=%b ctrl=%b  s=%d cout=%b Time=%0t",a,b,cin,ctrl,s,cout,$time);
        endmodule



