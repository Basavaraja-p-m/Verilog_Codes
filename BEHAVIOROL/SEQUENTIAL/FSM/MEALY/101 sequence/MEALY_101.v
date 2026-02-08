module MEALY_101 #(parameter s0=0,s1=1,s2=2)(
             input clk,rst,
             input x,
             output reg y
             );
reg[1:0] cs,ns;
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
      s0 : begin
               if(x==1)
                   begin
                   ns=s1;
                   y=0;
                   end
               else
                   begin
                   ns=s0;
                   y=0;
                   end
            end
       s1 : begin 
                if(x==0)
                    begin
                    ns=s2;
                    y=0;
                    end
                else
                    begin
                    ns=s1;
                    y=0;
                    end
            end
       s2 : begin
                if(x==1)
                    begin
                    ns=s1;//overlapping
                    ns=s0;//non overlaping
                    y=1;
                    end
                else
                    begin
                    ns=s0;
                    y=0;
                    end
            end
     endcase
 end
endmodule

module MEALY_101_tb();
    reg clk,rst;
    reg x;
    wire y;

 //instantiation
 MEALY_101 M1(clk,rst,x,y);

 initial
 clk=0;
 always #5 clk=~clk;
 initial
 begin
 rst=0;
#20;rst=1;
 end
 initial
 begin
 x=0;
#30;
 x=1;#10;
 x=0;#10;
 x=1;#10;
 end
 initial
#100 $stop;
 initial
 $monitor("clk=%b,rst=%b,x=%b,y=%b,time=%t,clk,rst,x",clk,rst,x,y,$time);
 endmodule


