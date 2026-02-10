module FS(a,b,cin,diff,barrow);
     input a,b,cin;
     output diff,barrow;

     //date flow
     assign diff=a^b^cin;
     assign barrow=~a&b|cin&(a~^b);
 endmodule

   //testebench
   module FS_tb();
       reg a,b,cin;
       wire diff,barrow;

       //instantiation
       FS F2(a,b,cin,diff,barrow);

       initial
       repeat(8)
       begin
          a=$random;b=$random;cin=$random;#10;
        end
        initial
        $monitor("a=%b b=%b cin=%b diff=%b barrow=%b Time=%t",a,b,cin,diff,barrow,$time);
      endmodule

