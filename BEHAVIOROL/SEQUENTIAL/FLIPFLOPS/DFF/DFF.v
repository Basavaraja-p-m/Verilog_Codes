`include "DL.v"
module DFF(
           input d,clk,rst,
           output Q,Qbar
           );

//instatitaion
DL D1(d,clk,rst,q,qbar);
DL D2(q,~clk,rst,Q,Qbar);

endmodule

//testbench

module DFF_tb();
  reg d,clk,rst;
  wire Q,Qbar;

  //instantuation

 DFF D3(d,clk,rst,Q,Qbar);
initial
clk=0;
always #10 clk=~clk;
initial
begin
rst=0;#7;
rst=1;
 repeat(20)
 begin
#2;
 d=$random;
 end
 end
 initial
 #100 $stop;
 initial
 $monitor("clk=%b d=%b Q=%b Qbar=%b rst=%b Time=%t",clk,d,Q,Qbar,rst,$time);
 endmodule


