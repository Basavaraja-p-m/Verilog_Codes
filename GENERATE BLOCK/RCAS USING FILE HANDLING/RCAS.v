module FA(
          input a,b,cin,
          output sum,carry
          );

assign sum=a^b^cin;
assign carry=a&b | b&cin | cin&a;

endmodule

module RCAS #(parameter WIDTH=32,MODE=1)(
            input [WIDTH-1:0]a,b,
            input cin,
            output [WIDTH-1:0]sum,
            output carry
            );
wire [WIDTH:0]w;
//generate block
genvar i;
assign w[0]=cin;
assign carry=w[WIDTH];

generate
begin
   for(i=0;i<WIDTH;i=i+1)
      if(MODE)   
      FA F1(a[i],b[i],w[i],sum[i],w[i+1]);
      else
      FA F2(a[i],~b[i],w[i],sum[i],w[i+1]);
end
endgenerate
endmodule

//testbench
module RCAS_tb #(parameter WIDTH=32,MODE=1)();
   reg [WIDTH-1:0]a,b;
   reg cin;
   wire [WIDTH-1:0]sum;
   wire carry;
   integer file1,file2;
   //instantiation
   RCAS R1(a,b,cin,sum,carry);

   defparam R1.WIDTH=WIDTH;
   initial
   begin
   file1=$fopen("adder.txt");
   file2=$fopen("subtracter.txt");
   repeat(10)
   begin
   if(MODE)
       begin  
       a=$urandom_range(0,100);b=$urandom_range(0,100);cin=$random;#1;
       $fdisplay(file1,"a=%d b=%d cin=%d sum=%d carry=%d Time=%t",a,b,cin,sum,carry,$time);
       end
   else
       begin
       a=$urandom_range(40,100);b=$urandom_range(0,30);cin=1;#1;
       $fdisplay(file2,"a=%d b=%d bin=%d diff=%d barrow=%d Time=%t",a,b,cin,sum,carry,$time);
       end
#10;
   end
   $fclose(file1);
   $fclose(file2);
   end
endmodule





    
  
            
