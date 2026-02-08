module MUX_tb();
    reg [3:0]i;
    reg [1:0]s;
    wire y;

    //instantiation
    MUX M1(i,s,y);

    initial
    repeat(5)
    begin
    i=$random;s=$random;#10;
    end
    initial
    $monitor("i=%b s=%b y=%b Time=%t",i,s,y,$time);
 endmodule
