module SISO(
            input clk,rst,
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
        temp[3]<=sin;
        temp[2]<=temp[3];
        temp[1]<=temp[2];
        temp[0]<=temp[1];
        
        sout<=temp[0];
        temp[0]<=temp[1];
        temp[1]<=temp[2];
        temp[2]<=temp[3];
        end
end
endmodule

module SISO_tb();
    reg clk,rst;
    reg sin;
    wire sout;

    //instantiation
    SISO S1(clk,rst,sin,sout);

    initial
    clk=0;
    always #10 clk=~clk;

    initial
    begin
    rst=0;
#5;
    rst=1;
    end

    initial
    begin
    sin=1;#15;
    sin=0;#20;
    sin=1;#20;
    sin=0;#20;
    end

    initial
    $monitor("clk=%d,rst=%d,sin=%d,sout=%d,TIme=%t",clk,rst,sin,sout,$time);
    endmodule

