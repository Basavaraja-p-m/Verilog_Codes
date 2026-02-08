module PIPO(
            input clk,rst,mode,
            input [3:0]pin,
            output reg [3:0]pout
            );
reg [3:0]temp;
always @(posedge clk or negedge rst)
begin
if(!rst)
    begin
    pout<=0;
    temp<=0;
    end
    else
        begin
        if(!mode)
            temp<=pin;
        else
            pout<=temp;
        end
end
endmodule

//testbench
module PIPO_tb();
     reg clk,rst,mode;
     reg [3:0]pin;
     wire [3:0]pout;

 //instantiatiomn
 PIPO PP1(clk,rst,mode,pin,pout);
 initial
 clk=0;
 always #10 clk=~clk;

 initial
 begin
 rst=0;
#10;rst=1;
 end

 initial
 begin 
 mode=0;#20;
 mode=1;
 end

 initial
 begin
 pin=4'b1011;
 end

 initial
#100 $stop;
 initial
 $monitor("clk=%b rst=%b mode=%b pin=%b pout=%b Time=%t",clk,rst,mode,pin,pout,$time);
 endmodule


