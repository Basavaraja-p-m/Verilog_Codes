module COMP_4BIT(
                 input [3:0]a,b,
                 output g,l,e
                 );
//data flow
assign g=(a[3]&~b[3])|((a[3]~^b[3])&(a[2]&~b[2]))|((a[3]~^b[3])&(a[2]~^b[2])&(a[1]&~b[1]))|((a[3]~^b[3])&(a[2]~^b[2])&(a[1]~^b[1])&(a[0]&~b[0]));
assign l=(~a[3]&b[3])|((a[3]~^b[3])&(~a[2]&b[2]))|((a[3]~^b[3])&(a[2]~^b[2])&(~a[1]&b[1]))|((a[3]~^b[3])&(a[2]~^b[2])&(a[1]~^b[1])&(~a[0]&b[0]));
assign e=(a[3]~^b[3])&(a[2]~^b[2])&(a[1]~^b[1])&(a[0]~^b[0]);
endmodule
 //testbench
 module COMP_4BIT_tb();
    reg [3:0]a,b;
    wire g,l,e;

    //instantiation
    COMP_4BIT C4(a,b,g,l,e);

    initial
    repeat(8)
    begin
    a=$random;b=$random;#10;
    end
    initial
    $monitor("a=%b b=%b g=%b l=%b e=%b Time=%t",a,b,g,l,e,$time);
    endmodule
