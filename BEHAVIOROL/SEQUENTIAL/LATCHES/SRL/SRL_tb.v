`include "SRL.v"
module SRL_tb();
    reg s,r,clk,rst;
    wire q,qbar;
    
    //instantiation
    SRL S1(s,r,clk,rst,q,qbar);

    initial clk=0;
    always #10 clk=~clk;
    initial
    begin
      rst=0;#10;
      rst=1;
    repeat(10)
      begin
      s=$random;r=$random;#10;
      end
    end
      initial 
      #100 $stop;
      initial
      $monitor("s=%b r=%b clk=%b rst=%b q=%b qbar=%b Time=%t",s,r,clk,rst,q,qbar,$time);
      endmodule
