module FA(a,b,cin,sum,carry);
    input a,b,cin;
    output sum,carry;

    //data flow
    assign sum=a^b^cin;
    assign carry=a&b|cin&(a^b);
endmodule

    //testebench
    module FA_tb();
         reg a,b,cin;
         wire sum,carry;

         //instantiation
         FA F1(a,b,cin,sum,carry);

         initial 
         begin
          a=0;b=0;cin=0;#10;
          a=0;b=0;cin=1;#10;
          a=0;b=1;cin=0;#10;
          a=0;b=1;cin=1;#10;
          a=1;b=0;cin=0;#10;
          a=1;b=0;cin=1;#10;
          a=1;b=1;cin=0;#10;
          a=1;b=1;cin=1;#10;
          end
          initial
          $monitor("a=%b b=%b cin=%b sum=%b carry=%b Time=%t",a,b,cin,sum,carry,$time);
       endmodule


