module HA(a,b,sum,carry);
     input a,b;
     output sum,carry;

    //data flow modeling
    assign sum=a^b;
    assign carry=a&b;
 endmodule

    //testbench
    module HA_tb();
         reg a,b;
         wire sum,carry;

         //instantiation
         HA H1(a,b,sum,carry);

         initial 
          begin
           a=0;b=0;#10;
           a=0;b=1;#10;
           a=1;b=0;#10;
           a=1;b=1;#10;
          end
          initial
          $monitor("a=%b b=%b sum=%b carry=%b Time=%t",a,b,sum,carry,$time);
      endmodule
