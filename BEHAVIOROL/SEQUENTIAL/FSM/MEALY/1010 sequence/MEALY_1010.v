module MEALY_1010 #(parameter s0=0,s1=1,s2=2,s3=3)(
        input clk,rst,
        input x,
        output reg y
        );
reg [1:0]cs,ns;
always @(posedge clk or negedge rst)
begin
      if(!rst)
      begin
      y<=0;
      cs<=0;
      end
      else
          cs<=ns;
end

always @(*)
begin
   case(cs)
   s0 : if(x==1)
           begin
           ns<=s1;
           y<=0;
           end
        else
           begin
            ns<=s0;
            y<=0;
            end
    s1 : if(x==0)
           begin
           ns<=s2;
           y<=0;
           end
         else
             begin
             ns<=s1;
             y<=0;
             end
    s2 : if(x==1)
           begin
           ns<=s3;
           y<=0;
           end
         else
             begin
             ns<=s2;
             y<=0;
             end
    s3 : if(x==0)
           begin
           ns<=s2;
           y<=1;
           end
         else
             begin
             ns<=s1;
             y<=0;
             end
    endcase
  end
endmodule

module MEALY_1010_tb();
   reg clk,rst;
   reg x;
   wire y;

//instantiation
MEALY_1010 M2(clk,rst,x,y);

initial
clk=0;
always #5 clk=~clk;

initial
begin
rst=0;
#20 rst=1;
end

initial
begin
x=0;
#30 
repeat(20)
begin
x=$random;#10;
//x=0;#10;
//x=1;#10;
//x=0;#10;
end
end

initial
#200 $stop;

initial
$monitor("clk=%b,rst=%b,x=%b,y=%b,Time=%t",clk,rst,x,y,$time);
endmodule
