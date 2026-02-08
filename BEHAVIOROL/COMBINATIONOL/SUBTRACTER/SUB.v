module SUB(
          input a,b,bin,
          output reg diff,barr
          );

 //behavioural model

 always @(a,b,bin)
   begin
      if(a==0 && b==0 && bin==0)
         begin
         diff=0;barr=0;
         end
      else if(a==0 && b==0 && bin==1)
         begin
         diff=1;barr=1;
         end
      else if(a==0 && b==1 && bin==0)
         begin
         diff=0;barr=1;
         end
      else if(a==0 && b==1 && bin==1)
         begin
         diff=0;barr=1;
         end
      else if(a==1 && b==0 && bin==0)
         begin
         diff=1;barr=0;
         end
      else if(a==1 && b==0 && bin==1)
         begin
         diff=0;barr=0;
         end
      else if(a==1 && b==1 && bin==0)
         begin
         diff=0;barr=0;
         end
      else
         begin
         diff=1;barr=1;
         end
    end
endmodule
     
//testbench

module SUB_tb();
   reg a,b,bin;
   wire diff,barr;

   //instantiation
   SUB S1(a,b,bin,diff,barr);

   initial
   repeat(10)
   begin
   a=$random;b=$random;bin=$random;#10;
   end
   initial
   $monitor("a=%b b=%b bin=%b diff=%b barr=%b Time=%t",a,b,bin,diff,barr,$time);
   endmodule







         
