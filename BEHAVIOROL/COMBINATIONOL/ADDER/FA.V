module FA(
          input a,b,cin,
          output reg sum,carry
          );
    
    //BEHAVIORAL MODEL
    always @(a,b,cin)
         begin
         if(a==0 && b==0 && cin==0)
             begin
                sum=0;
                carry=0;
             end
         else if(a==0 && b==0 && cin==1)
             begin
             sum=1;
             carry=0;
             end
         else if(a==0 && b==1 && cin==0)
             begin
             sum=1;
             carry=0;
             end
         else if(a==0 && b==1 && cin==1)
             begin
             sum=0;
             carry=1;
             end
         else if(a==1 && b==0 && cin==0)
             begin
             sum=1;
             carry=0;
             end
         else if(a==1 && b==0 && cin==1)
             begin
             sum=0;
             carry=1;
             end
         else if(a==1 && b==1 && cin==0)
             begin
             sum=0;
             carry=1;
             end
         else
             begin
             sum=1;
             carry=1;
             end
         end
endmodule

    //testebench

    module FA_tb();
      reg a,b,cin;
      wire sum,carry;

      //instantiation
      FA F1(a,b,cin,sum,carry);

      initial 
      repeat(10)
      begin
      a=$random;b=$random;cin=$random;#10;
      end
      initial
      $monitor("a=%b b=%b cin=%b sum=%b carry=%b Time=%t",a,b,cin,sum,carry,$time);
     endmodule

