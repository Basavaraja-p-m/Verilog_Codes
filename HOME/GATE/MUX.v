module MUX(
           input [3:0]i,
           input [1:0]s,
           output y
           );
//internol signols
wire w1,w2,w3,w4;

//gate primitives
and a1(w1,~s[1],~s[0],i[0]);
and a2(w2,~s[1],s[0],i[1]);
and a3(w3,s[1],~s[0],i[2]);
and a4(w4,s[1],s[0],i[3]);
or o1(y,w1,w2,w3,w4);

endmodule

module MUX_tb();
    reg [3:0]i;
    reg [1:0]s;
    wire y;
    integer x;
    //instantiation
    MUX M1(i,s,y);

    initial
    repeat(10)
    begin
    i=$urandom_range(0,4);
    for(x=0;x<4;x=x+1)
        begin
        s=x;#10;
        end
    end

    initial
    $monitor("i=%d,s=%d,y=%d,time=%t",i,s,y,$time);
    endmodule
  

