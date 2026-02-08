module SNIPPET();
   reg [31:0]a;
   reg [31:0]b;
   reg [31:0]c=1;
   reg [1:0]i;
   reg s;
   reg y;
   reg [31:0]sum;
   reg [31:0]carry;
   reg g,l,e;
   
   initial
   begin
   //adder
   a=5;
   b=5;
   c=1;
   {carry,sum}=a^b^c;
   $display("sum=%d carry=%d",sum,carry);
   end
   initial
   begin
   i=$random;s=$random;
   //mux
   y=i[s];
   $display("i=%b s=%b y=%b",i,s,y);
   end
   initial
   begin
   //encoder
   if(a==1 && b==0)
       y<=0;
       else
           y<=1;
    $monitor("y=%b",y);
    end
    initial
    begin
    a=5;
    b=2;
    //comparator
    g=a>b;
    l=a<b;
    e=a==b;
    $display("g=%b l=%b e=%b",g,l,e);
   end
endmodule
