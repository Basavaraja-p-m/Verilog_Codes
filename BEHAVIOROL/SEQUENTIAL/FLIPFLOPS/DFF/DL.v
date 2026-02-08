module DL(
          input d,clk,rst,
          output reg q,
          output qbar
          );

assign qbar=~q;

//behaviroul model
always @(d,rst,clk)
begin
if(rst==0)
    q<=0;
    else if(clk==1)
        begin
        if(!d)
            q<=d;
        else
            q<=d;
        end
 end
 endmodule

//TESTBENCH

module DL_tb();
   reg d,clk,rst;
   wire q,qbar;

//instantiation
DL D1(d,clk,rst,q,qbar);

initial
clk=0;
always #10 clk=~clk;
initial
begin
rst=0;#10 
rst=1;
end
initial
repeat(10)
begin
d=0;#10;
d=1;#10;
end
initial
#50 $stop;
initial
$monitor("clk=%b rst=%b d=%d q=%b qbar=%b time=%0t",clk,rst,d,q,qbar,$time);
endmodule
