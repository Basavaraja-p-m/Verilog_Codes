module HS(a,b,diff,barrow);
     input a,b;
     output diff,barrow;

     //data flow
     assign diff=a^b;
     assign barrow=~a&b;
endmodule

   //testebench
   module HS_tb();
       reg a,b;
       wire diff,barrow;

       //instantiation
       HS H2(a,b,diff,barrow);

       initial 
       begin
        a=0;b=0;#10;
        a=0;b=1;#10;
        a=1;b=0;#10;
        a=1;b=1;#10;
        end
        initial
        $monitor("a=%b b=%b diff=%b barrow=%b Time=%t",a,b,diff,barrow,$time);
      endmodule
  
