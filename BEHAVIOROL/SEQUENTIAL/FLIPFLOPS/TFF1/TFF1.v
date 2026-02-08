module TFF1(
          input t,clk,rst,
          output reg q,
          output qbar
          );

assign qbar=~q;
//bevarioul
always @(posedge clk)
begin
if(rst==0)
    q<=0;
    else
        begin
        case (t)
        0 : q<=q;
        default : q<=~q;
        endcase
        end
end
endmodule

//testbench

module TFF1_tb();
   reg t,clk,rst;
   wire q,qbar;

   //instantiation
   TFF1 T1(t,clk,rst,q,qbar);

//generate the sg
   initial
   clk=0;
   always #10 clk=~clk;
   initial
   begin
   rst=0;#15;
   rst=1; 
   repeat(10)
   begin
   t=$random;#10;
   end
   end
   initial
#100 $stop;
   initial
   $monitor("t=%b clk=$b rst=%b q=%b qbar=%b Time=%t",t,clk,rst,q,qbar,$time);
   endmodule
