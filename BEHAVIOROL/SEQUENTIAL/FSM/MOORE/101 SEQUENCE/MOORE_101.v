module MOORE_101 #(parameter s0=0,s1=1,s2=2,s3=3)(
          input clk,rst,
          input x,
          output y
          );
reg [1:0]cs,ns;
assign y=(cs==s3)?1:0;
always @(posedge clk or negedge rst)
begin
if(!rst)
    begin
   // y<=0;
    cs<=0;
    end
    else
        cs<=ns;
end

always @(*)
begin
     case(cs)
     s0 : if(x==1)
            ns<=s1;
          else
            ns<=s0;
     s1 : if(x==0)
            ns<=s2;
          else
             ns<=s1;
     s2 : if(x==1)
            ns<=s3;
          else
            ns<=s2;
     s3 : if(x==1)
            ns<=s1;
          else
            ns<=s2;
    endcase
end
endmodule

module MOORE_101_tb();
    reg clk,rst;
    reg x;
    wire y;

    MOORE_101 M3(clk,rst,x,y);

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
    #30;
    repeat(20)
    begin
    x=$random;
    #10;
    end
    end

    initial
    $monitor("clk=%b,rst=%b,x=%b,y=%b,Time=%t",clk,rst,x,y,$time);
    endmodule
   








