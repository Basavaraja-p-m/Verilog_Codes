`include "COMP.v"
module top();
   parameter IN=4;
   wire [IN-1:0]w1,w2;
   wire w3,w4,w5;

   //instantiation
   COMP C1(w1,w2,w3,w4,w5);
   COMP_tb C2(w3,w4,w5,w1,w2);

   defparam C1.IN=IN;
   defparam C2.IN=IN;

endmodule
