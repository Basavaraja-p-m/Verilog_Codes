module DEMUX(
            input i,
            input [1:0]s,
            output reg [3:0]y
            );

//behavioural model
always @(i,s)
begin
y=0;
    if(s==0)
     y[0]=i;
    else if(s==1)
     y[1]=i;
    else if(s==2)
     y[2]=i;
    else 
     y[3]=i;
end
endmodule

//testbench

module DEMUX_tb();
  reg i;
  reg [1:0]s;
  wire [3:0]y;

//instantiation

DEMUX D1(i,s,y);

initial
repeat(10)
begin
i=$random;s=$random;#10;
end
initial
$monitor("i=%b s=%b y=%b Time=%t",i,s,y,$time);
endmodule


