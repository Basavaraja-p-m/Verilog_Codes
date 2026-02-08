`include "MUX.v"
`include "MUX_tb.v"
module TOP2();
     parameter IN=16;
     wire [IN-1:0]w1;
     wire [$clog2(IN)-1:0]w2;
     wire w3;

     //instantiation
     MUX M1(w1,w2,w3);//#(.IN(16)) 
     MUX_tb M2(w3,w2,w1);// #(.IN(16)) 
     
    defparam M1.IN=IN;
    defparam M2.IN=IN;

 endmodule

   
