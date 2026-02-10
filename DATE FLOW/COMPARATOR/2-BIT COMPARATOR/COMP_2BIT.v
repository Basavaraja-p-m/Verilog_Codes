module COMP_2BIT(
                input [1:0]a,b,
                output l,g,e
                );
//data flow
 assign g=a[1]&~b[1]|a[0]&~b[0]&(a[1]~^b[1]);
 assign l=~a[1]&b[1]|~a[0]&b[0]&(a[1]~^b[1]);
 assign e=(a[0]~^b[0])&(a[1]~^b[1]);

 endmodule
     
     //testbench
     module COMP_2BIT_tb();
         reg [1:0]a,b;
         wire l,g,e;

         //instantiation
         COMP_2BIT C2(a,b,l,g,e);

         initial
         repeat(15)
         begin
         a=$random;b=$random;#10;
         end
         initial
         $monitor("a=%b b=%b l=%b g=%b e=%b time=%t",a,b,l,g,e,$time);
         endmodule

