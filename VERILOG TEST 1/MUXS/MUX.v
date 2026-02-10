`include "AND.v"
`include "OR.v"
module MUX(i,s,y);
    input [3:0]i;
    input [1:0]s;
    output y;

  wire w1,w2,w3,w4;
    //instatiation
    AND A1(.a(~s[1]),
           .b(~s[0]),
           .c(i[0]),
           .y(w1)
           );
   AND A2(.a(~s[1]),
           .b(s[0]),
           .c(i[1]),
           .y(w2)
           );
   AND A3(.a(s[1]),
           .b(~s[0]),
           .c(i[2]),
           .y(w3)
           );
   AND A4(.a(s[1]),
           .b(s[0]),
           .c(i[3]),
           .y(w4)
           );
    OR O1(.a(w1),
           .b(w2),
           .c(w3),
           .d(w4),
           .y(y)
           );
    endmodule

    //testbench
    module MUX_tb();
      reg [3:0]i;
      reg [1:0]s;
      wire y;
    
    //instantiation
    MUX M1(i,s,y);

    initial
    repeat(10)
    begin
    i=$random; s=$random;#10;
    end
    initial
    $monitor("i=%b s=%b y=%b Time=%t",i,s,y,$time);
    endmodule
