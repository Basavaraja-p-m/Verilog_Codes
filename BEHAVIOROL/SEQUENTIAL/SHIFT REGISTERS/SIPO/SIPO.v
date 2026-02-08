module SIPO(
            input clk,rst,
            input sin,
            input reg mode,
            output reg [3:0]pout
            );
reg [3:0]temp;

always @(posedge clk or negedge rst)
begin
   if(!rst)
       begin
       pout<=0;
       temp<=0;
       end
       else
           begin
           if(!mode)
               temp<={sin,temp[3:1]};
           else
               pout<=temp;
           end
end
endmodule

//testbench
module SIPO_tb();
   reg clk,rst;
   reg sin;
   reg mode;
   wire [3:0]pout;

   //instantiation
   SIPO S1(clk,rst,sin,mode,pout);

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
#80 mode=1;
   end

   initial
   begin
   sin=1;#15;
   sin=0;#20;
   sin=1;#20;
   sin=1;#20;
   end
   initial
#400 $stop;
   initial
   $monitor("clk=%b rst=%b sin=%b mode=%b pout=%b Time=%t",clk,rst,sin,mode,pout,$time);
   endmodule
 
