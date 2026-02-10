`include "BTOG.v"
`include "GTOB.v"
module PROBLEM_3(
                 input [3:0]b,
                 output [3:0]y
                 );
       wire [3:0]w;
       // instantiation
       BTOG B1(.b(b),
               .g(w)
               );
       GTOB G1(.g(w),
               .b(y)
               );
 endmodule

      //testbench
      module PROBLEM_3_tb();
        reg [3:0]b;
        wire [3:0]y;

        //instantiation
        PROBLEM_3 P3(b,y);

        initial 
        repeat(5)
        begin
         b=$random % 16;#10;
         end
         initial
         $monitor("b=%b y=%b Time=%0t",b,y,$time);
      endmodule
        
