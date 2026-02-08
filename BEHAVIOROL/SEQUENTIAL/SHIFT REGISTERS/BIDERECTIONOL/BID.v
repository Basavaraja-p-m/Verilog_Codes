module BID(
           input clk,rst,mode,
           input sin,
           output reg sout
           );
reg [3:0]temp;
always @(posedge clk or negedge rst)
begin
if(!rst)
    begin
    sout<=0;
    temp<=0;
    end
    else
        begin
        if(!mode)
            begin
            sout<=temp[0];

            temp[3]<=sin;
            temp[2]<=temp[3];
            temp[1]<=temp[2];
            temp[0]<=temp[1];
            end
        else
            begin
            sout<=temp[3];

            temp[0]<=sin;
            temp[1]<=temp[0];
            temp[2]<=temp[1];
            temp[3]<=temp[2];
            end
        end
 end
endmodule

//testbench
module BID_tb();
   reg clk,rst,mode;
   reg sin;
   wire sout;

//instantiation
BID B1(clk,rst,mode,sin,sout);

initial
clk=0;
always #10 clk=~clk;

initial
begin
rst=0;
#10 rst=1;
end

initial
begin
mode=0;
sin=0;#15;
sin=1;#20;
sin=0;#20;
sin=1;#20;
#100;
mode=1;#5;
sin=1;#15;
sin=0;#20;
sin=1;#20;
sin=1;#20;
end

initial
#500 $stop;

initial
$monitor("clk=%b rst=%b mode=%b sin=%b sout=%b Time=%t",clk,rst,mode,sin,sout,$time);
endmodule
