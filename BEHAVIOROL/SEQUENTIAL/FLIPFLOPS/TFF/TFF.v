`include "TL.v"
module TFF(
           input t,clk,rst,
           output Q,Qbar
           );

//instantiation
TL T1(t,clk,rst,q,qbar);
TL T2(q,~clk,rst,Q,Qbar);

endmodule

//testbench

module TFF_tb();
  reg t,clk,rst;
  wire Q,Qbar;

  //instantiation

  TFF T3(t,clk,rst,Q,Qbar);
  initial
  clk=0;
  always #10 clk=~clk;
  initial
  begin
  rst=0;#5;
  rst=1;
  repeat(20)
  begin
#3;
  t=$random;#10;
  end
  end
  initial
#100 $stop;
  initial
  $monitor("clk=%b t=%b Q=%b Qbar=%b rst=%b Time=%t",clk,t,Q,Qbar,rst,$time);
  endmodule
