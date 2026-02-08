`include "DFF1.v"
module SISO(
            input d,
            input clk,rst,
            output Q
            );
//instantiation
wire w1,w2,w3;
DFF1 D1(d,clk,rst,w1);
DFF1 D2(w1,clk,rst,w2);
DFF1 D3(w2,clk,rst,w3);
DFF1 D4(w3,clk,rst,Q);

endmodule

//testbench

module SISO_tb();
   reg d;
   reg clk,rst;
   wire Q;

   //instantiation
   SISO S1(d,clk,rst,Q);

   //generate signol
   initial
   clk=1;
   always #10 clk=~clk;
   initial
   begin
   rst=0;
   #10; rst=1;
   d=1;#15;
   d=0;#20;
   d=1;#20;
   d=0;
   end
   
   
   initial
#180 $stop;
   initial
   $monitor("d=%b clk=%b rst=%b Q=%b Time=%t",d,clk,rst,Q,$time);
   endmodule
