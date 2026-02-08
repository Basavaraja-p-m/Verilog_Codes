module UP(
          input clk,rst,
          output reg[4:0]count
          );
   integer i;
   always @(posedge clk or negedge rst)
    begin
    if (!rst)
        count<=18;
        else
           count<=count+1;
           if(count==27)
               $stop;
    end
    endmodule

    //testbench
    module UP_tb();
      reg clk,rst;
      wire [4:0]count;

      //instantiation
      UP U1(clk,rst,count);

      initial
      clk=0;
      always #10 clk=~clk;
      initial
      begin
       rst=0;#10;
       rst=1;
      end
      
      initial
      #1000 $stop;
      initial 
     $monitor(count);
    endmodule








