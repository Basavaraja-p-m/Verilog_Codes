module SISOL(
             input clk,rst,
             input sin,
             output reg sout
             );
reg [3:0]temp;
always @(posedge clk or negedge rst)
if(!rst)
    begin
    sout<=0;
    temp<=0;
    end
    else
        begin
       /* sout<=temp[3];
        temp[3]<=temp[2];
        temp[2]<=temp[1];
        temp[1]<=temp[0];*/
       sout<=temp[3];

      /*  temp[0]<=sin;
        temp[1]<=temp[0];
        temp[2]<=temp[1];
        temp[3]<=temp[2];*/
       temp<={temp[2:0],sin};
        end
endmodule

//testbench
module SISOL_tb();
  reg clk,rst;
  reg sin;
  wire sout;

  //instantiation
  SISOL SS(clk,rst,sin,sout);
  initial
  clk=0;
  always #10 clk=~clk;
  
  initial
  begin
  rst=0;#10
  rst=1;
  end

  initial
  begin
  sin=1;#15;
  sin=0;#20;
  sin=1;#20;
  sin=1;#20;
  end
  initial
#200 $stop;
  initial
  $monitor("clk=%b rst=%b sin=%b scout=%b Time=%t",clk,rst,sin,sout,$time);
  endmodule
