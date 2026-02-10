module CMOS(
            input a,b,c,
            output y
            );
wire n1;
supply1 vdd;
supply0 gnd;

pmos p1(y,vdd,a);
pmos p2(y,vdd,b);
pmos p3(y,vdd,c);

nmos m1(y,n1,a);
nmos m2(n1,gnd,b);
nmos m3(y,gnd,c);

endmodule

module CMOS_tb();
    reg a,b,c;
    wire y;

    //instantiation
    CMOS C1(a,b,c,y);

    initial
    begin
    a=1;b=1;c=1;
    end

    initial
    $monitor("a=%b,b=%b,c=%b,y=%b,Time=%t",a,b,c,y,$time);
endmodule

