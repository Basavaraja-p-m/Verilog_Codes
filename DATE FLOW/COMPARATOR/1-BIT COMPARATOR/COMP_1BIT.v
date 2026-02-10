module COMP_1BIT(
                input a,b,
                output l,g,e
                );
    
    //data flow
    assign l=~a&b;
    assign g=a&~b;
    assign e=a&b;
 endmodule
  

     //testbench
     module COMP_1BIT_tb();
          reg a,b;
          wire l,g,e;

          //instantiation
          COMP_1BIT C1(a,b,l,g,e);

          initial
          repeat(5)
          begin
          a=$random;b=$random;#10;
          end
          initial
          $monitor("a=%b b=%b l=%b g=%b e=%b Time=%0t",a,b,l,g,e,$time);
          endmodule

