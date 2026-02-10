module PROBLEM(a,b,c,y);
    input a,b,c;
    output y;

    //internal signols
    wire w1,w2,w3,w4,w5,w6;
    supply1 vdd;
    supply0 gnd;

    //switch primitives
    pmos p1(w1,vdd,a);
    pmos p2(w6,w1,b);
    pmos p3(w1,vdd,b);
    pmos p4(w6,w1,c);
    pmos p5(w2,w1,a);
    pmos p6(w6,w2,b);
    pmos p7(y,vdd,w6);
    pulldown n1(y);

 endmodule

    //testbench
    module PROBLEM_tb();
        reg a,b,c;
        wire y;

        //instantiation
        PROBLEM P1(a,b,c,y);
        
        initial
        repeat(10)
        begin
        a=$random; b=$random; c=$random;#10;
        end
        initial
        $monitor("a=%b b=%b c=%b y=%b Time=%0t",a,b,c,y,$time);
       endmodule
