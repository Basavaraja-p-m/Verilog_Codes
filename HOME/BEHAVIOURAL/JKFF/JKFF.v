module JKFF(
            input clk,rst,
            input j,k,
            output reg q,
            output qbar
            );

assign qbar=~q;

always @(posedge clk)
begin
if(!rst)
    q<=0;
    else
        begin
        case({j,k})
        0 : q<=q;
        1 : q<=0;
        2 : q<=1;
        3 : q<=~q;
        endcase
        end
end
endmodule

module JKFF_tb();
    reg clk,rst;
    reg j,k;
    wire q,qbar;

    //instantiation
    JKFF J1(clk,rst,j,k,q,qbar);

    initial
    clk=0;
    always #5 clk=~clk;

    initial
    begin
    rst=0;
#20; rst=1;
    end

    initial
    begin
    {j,k}=2'b00;#10;
    {j,k}=2'b01;#10;
    {j,k}=2'b10;#10;
    {j,k}=2'b11;#10;
    end

    initial
    $monitor("clk=%d,rst=%d,j=%d,k=%d,q=%d,qbar=%d,Time=%t",clk,rst,j,k,q,qbar,$time);
    endmodule
