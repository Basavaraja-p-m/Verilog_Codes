module UPDOWN(
              input clk,rst,mode,
              output reg[3:0]count
              );

always @(posedge clk or negedge rst)
begin
  if(!rst)
      count<=0;
      else
          begin
          if(mode)
              count<=count+1;
          else
              count<=count-1;
          end
end
endmodule

//testebench
 module UPDOWN_tb();
   reg clk,rst,mode;
   wire [3:0]count;

   //instantiation
   UPDOWN UD1(clk,rst,mode,count);

   initial
   begin
   clk=0;
   forever #10 clk=~clk;
   end
   initial
   begin
   rst=0;
#10 rst=1;
   end
   initial
   begin
   mode=0;
#30 mode=1;
   end
   initial
#100 $stop;
   initial
   $monitor(count);
endmodule



