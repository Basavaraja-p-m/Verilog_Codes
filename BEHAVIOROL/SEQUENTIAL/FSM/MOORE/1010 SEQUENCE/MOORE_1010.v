module MOORE_1010 #(parameter s0=0,s1=1,s2=2,s3=3,s4=4)(
      input clk,rst,
      input x,
      output y
      );
reg [2:0]cs,ns;
assign y=(cs==s4)?1:0;

always @(posedge clk or negedge rst)
begin
if(!rst)
   cs<=0;
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
          ns=s1;
   s2 : if(x==1)
          ns<=s3;
        else
          ns<=s0;
   s3 : if(x==0)
          ns<=s4;
        else
          ns<=s1;
   s4 : if(x==0)
          ns<=s0;
        else
          ns<=s3;
    endcase
end
endmodule

module MOORE_1010_tb();
    reg clk,rst;
    reg x;
    wire y;

   //instantiation
   MOORE_1010 M1(clk,rst,x,y);

   initial
   clk=0;
   always #5 clk=~clk;

   initial
   begin
   rst=0;
#20;
   rst=1;
   end

   initial
   begin
   x=0;
#30;
   repeat(20)
   begin
   x=$random;#10;
   end
   end

   initial
   $monitor("clk=%d,rst=%d,x=%d,y=%d,time=%t",clk,rst,x,y,$time);
   endmodule




