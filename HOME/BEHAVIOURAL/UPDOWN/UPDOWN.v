module UPDOWN(
              input clk,rst,
              input mode,
              output reg [3:0]count
              );

always @(posedge clk or negedge rst)
begin
if(!rst)
    count<=0;
    else
        begin
        if(mode)
            count<=count+1;
        else
            count<=count-1;
        end
end
endmodule

module UPDOWN_tb();
    reg clk,rst;
    reg mode;
    wire [3:0]count;

    //instantiation
    UPDOWN UP(clk,rst,mode,count);

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
    mode=1;#80;
    mode=0;
    end

    initial
    $monitor(count);
    endmodule
