module GATE(
            input a,b,c,
            output y
            );

wire w1;
or o1(w1,~a,~b);
and a1(y,w1,~c);

endmodule

module GATE_tb();
    reg a,b,c;
    wire y;

    GATE G1(a,b,c,y);

    initial
    begin
    a=1;b=1;c=1;
    end

    initial
    $monitor("a=%b,b=%b,c=%b,y=%b,Time=%t",a,b,c,y,$time);

endmodule
