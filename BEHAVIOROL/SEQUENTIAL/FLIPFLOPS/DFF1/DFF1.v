module DFF1(
           input d,clk,rst,
           output reg q,
           output qbar
           );

assign qbar=~q;
//behavioural
always @(posedge clk)
begin
 if(rst==0)
     q<=0;
     else
         begin
         case (d)
         0 : q<=d;
         default : q<=d;
         endcase
         end
end
endmodule

//testbench
module DFF1_tb();
   reg d,clk,rst;
   wire q,qbar;

   //instantition
   DFF1 D1(d,clk,rst,q,qbar);

//generate signol
   initial
   clk=0;
   always #10 clk=~clk;
   initial
   begin
   rst=0;#8;
   rst=1;
   repeat(10)
   begin
   d=$random;#10;
   end
   end
   initial
#100 $stop;
   initial
   $monitor("d=%b clk=%b rst=%b q=%b qbar=%b Time=%t",d,clk,rst,q,qbar,$time);
   endmodule
