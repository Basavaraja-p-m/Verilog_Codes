module JKFF1(
             input j,k,clk,rst,
             output reg q,
             output qbar
             );

assign qbar=~q;
//bevarioural model
always @(posedge clk)
begin
if(rst==0)
    q<=0;
    else
        begin
        if(j==0 && k==0)
            q<=q;
        else if(j==0 && k==1)
            q<=0;
        else if(j==1 && k==0)
            q<=1;
        else 
            q<=~q;
        end
end
endmodule

//testbench
module JKFF1_tb();
    reg j,k,clk,rst;
    wire q,qbar;

    //instantiation
    JKFF1 J1(j,k,clk,rst,q,qbar);
    
    //generate the clk
    initial
    clk=0;
    always #10 clk=~clk;

    //generate the rst
    initial
    begin
    rst=0;#14;
    rst=1;
    repeat(10)
    begin
#3;
    j=1;k=1;#10;
    j=0;k=0;#10;
    j=1;k=1;#10;
    j=0;k=0;#10;
    j=1;k=1;#10;
    end
    end
    initial
#100 $stop;
    initial
    $monitor("j=%b k=%b clk=%b rst=%b q=%b qbar=%b Time=%t",j,k,clk,rst,q,qbar,$time);
    endmodule
