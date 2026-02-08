module UNIVERSOL(
                 input clk,rst,
                 input [1:0]opcode,
                 input [3:0]in,
                 output reg [3:0]out
                 );
reg [3:0]temp;

always @(posedge clk or negedge rst)
begin
if(!rst)
    begin
    out<=0;
    temp<=0;
    end
    else
        begin
        case(opcode)
        0:out<=out;
        1:begin
          out<=temp[0];

          temp[3]<=in;
          temp[2]<=temp[3];
          temp[1]<=temp[2];
          temp[0]<=temp[1];
          end
        2:begin
          out<=temp[3];

          temp[0]<=in;
          temp[1]<=temp[0];
          temp[2]<=temp[1];
          temp[3]<=temp[2];
          end
        3:out<=in;
        endcase
        end
end
endmodule

//testbench
module UNIVERSOL_tb();
  reg clk,rst;
  reg [1:0]opcode;
  reg [3:0]in;
  wire [3:0]out;

//instantiation
UNIVERSOL U1(clk,rst,opcode,in,out);

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
opcode=0;
in=4'b1011;
#50;
opcode=1;
in=1;#15;
in=0;#25;
in=1;#20;
in=1;#20;
#100;
opcode=2;
in=1;#15;
in=0;#20;
in=1;#20;
in=1;#20;
#100;
opcode=3;
in=4'b1011;
end
initial
#500 $stop;
initial
$monitor("clk=%b rst=%b opcode=%b in=%b out=%b time=%t",clk,rst,opcode,in,out,$time);
endmodule

