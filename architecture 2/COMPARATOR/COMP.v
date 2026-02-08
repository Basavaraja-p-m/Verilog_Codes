module COMP(a,b,g,l,e);
     parameter IN=16;
     input [IN-1:0]a,b;
     output g,l,e;

     assign {g,l,e}={a>b,a<b,a==b};

 endmodule

     //testbench
     module COMP_tb(g,l,e,a,b);
         parameter IN=16;
         input g,l,e;
         output reg [IN-1:0]a,b;
          
      initial 
      repeat(15)
      begin
       a=$random;b=$random;#10;
       end
       initial
       $monitor("a=%b b=%b g=%b l=%b e=%b Time=%0t",a,b,g,l,e,$time);
       endmodule
