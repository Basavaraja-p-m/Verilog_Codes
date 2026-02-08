`include "JKL.v"
module JKL_tb();
   reg j,k,clk,rst;
   wire q,qbar;

   //instantiation
   JKL J1(j,k,clk,rst,q,qbar);

   initial
   clk=0;
   always #10 clk=~clk;
   initial
   begin
   rst=0; #10;
   rst=1;
   end
   initial
   begin
   j=0;k=0;#10;
   j=0;k=1;#10;
   j=1;k=0;#10;
   j=1;k=1;#10;
   end
   initial
   #100 $stop;
   initial
   $monitor("clk=%b rst=%b j=%b k=%b q=%b qbar=%b Time=%t",clk,rst,j,k,q,qbar,$time);
   endmodule


