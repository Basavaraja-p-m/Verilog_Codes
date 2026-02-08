module PISO(
            input clk,rst,mode,
            input [3:0]pin,
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
            temp<=pin;        
        else
           /* sout<=temp[0];
            temp[0]<=temp[1];
            temp[1]<=temp[2];
            temp[2]<=temp[3];*/
            begin
           temp<={1'b0,temp[3:1]};
           sout<=temp[0];
           end
        end

end
endmodule

//testbench
module PISO_tb();
  reg clk,rst,mode;
  reg [3:0]pin;
  wire sout;

//instantiation
PISO PS1(clk,rst,mode,pin,sout);

initial
begin
clk=0;
forever #10 clk=~clk;
end

initial
begin
rst=0;#10;
rst=1;
end
initial
begin
mode=0;#40;
mode=1;
end

initial
begin

pin=4'b1100;
end

initial
#130 $stop;
initial 
$monitor("clk=%b rst=%b mode=%b pin=%b sout=%b Time=%t",clk,rst,mode,pin,sout,$time);
endmodule

