module SRL(
          input s,r,clk,rst,
          output reg q,
          output qbar
          );

 assign qbar=~q;

 //behevioural
  always @(s,r,clk,rst)
  begin
       if(rst==0)
           q<=0;
       else 
           begin
           if(clk==0)
               begin
               if(s==0 && r==0)
                   q<=q;
               else if(s==0 && r==1)
                   q<=0;
               else if(s==1 && r==0)
                   q<=1;
               else 
                   q<=1'bx;
               end
           end
    end
endmodule

//testbench
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





