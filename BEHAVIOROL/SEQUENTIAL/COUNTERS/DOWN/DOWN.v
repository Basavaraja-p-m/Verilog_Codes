module DOWN(
            input rst,clk,
            output reg[3:0]count
            );
  
  always @(posedge clk or negedge rst)
  begin
  if(!rst)
      count<=15;
      else
          count<=count-1;
  end
  endmodule

  //testbench
  module DOWN_tb();
     reg rst,clk;
     wire [3:0]count;

     //instantiation
     DOWN D1(rst,clk,count);

     initial
     clk=0;
     always #10 clk=~clk;
     initial
     begin
     rst=0;
#10  rst=1;
     end
     initial
     #100 $stop;
     initial
     $monitor(count);
     endmodule




