module RCAF(
            input [3:0]a,b,
            input cin,
            output reg[3:0]sum,
            output reg cout
            );
    reg [1:0]rca;
    reg carry;
   function  reg[1:0] FA(input a,b,input cin);
           reg carry;
           reg sum;
           begin
           carry=(a&b)|(b&cin)|(cin&a);
           sum=a^b^cin;
           FA={carry,sum};
           end
     endfunction

   always @(*)
   begin 
  rca=FA(a[0],b[0],cin);
   sum[0]=rca[0];
   carry=rca[1];
  
  rca=FA(a[1],b[1],carry);
   sum[1]=rca[0];
   carry=rca[1];
  
  rca=FA(a[2],b[2],carry);
   sum[2]=rca[0];
   carry=rca[1];
  
  rca=FA(a[3],b[3],carry);
   sum[3]=rca[0];
   cout=rca[1];
   end
   endmodule

   //testbench
   module RCAF_tb();
       reg [3:0]a,b;
       reg cin;
       wire [3:0]sum;
       wire cout;

       //instantiation
       RCAF R1(a,b,cin,sum,cout);

       initial
       begin
       a=4'b0010;b=4'b0011;cin=1'b1;#10;
       end
       initial
       $monitor("a=%b b=%b cin=%b sum=%b cout=%b Time=%t",a,b,cin,sum,cout,$time);
       endmodule
