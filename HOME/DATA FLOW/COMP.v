module COMP(
            input [4:0]a,b,
            output l,e,g
            );
//data flow
assign l=a<b;
assign e=a==b;
assign g=a>b;

endmodule

module COMP_tb();
    reg [4:0]a,b;
    wire l,e,g;

    //instantiation
    COMP C1(a,b,l,e,g);

    initial
    repeat(10)
    begin
    a=$random;b=$random;#10;
    end

    initial
    $monitor("a=%d,b=%d,l=%d,e=%d,g=%d,time=%d",a,b,l,e,g,$time);
    endmodule

