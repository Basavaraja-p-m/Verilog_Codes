`include "JKL.v"
module JKFF(
            input j,k,clk,rst,
            output Q,Qbar
            );

//instantiation
JKL J1(j,k,clk,rst,q,qbar);
JKL J2(q,qbar,~clk,rst,Q,Qbar);

endmodule

//testbench

module JKFF_tb();
   reg j,k,clk,rst;
   wire Q,Qbar;

   //instantiation
   JKFF J3(j,k,clk,rst,Q,Qbar);
   initial
   clk=0;
   always #10 clk=~clk;
   initial
   begin
   rst=0; #10;
   rst=1;
   repeat(20)
   begin
#3;
   j=$random; k=$random;#10;
   end
   end
   initial
   begin
   #100 $stop;
   end
   initial
   $monitor("clk=%b j=%b k=%b Q=%b Qbar=%b rst=%b Time=%t",clk,j,k,Q,Qbar,rst,$time);
   endmodule

 
