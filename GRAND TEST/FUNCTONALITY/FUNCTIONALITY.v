`include "CMOS.v"
`include "GATE.v"
module FUNCTIONALITY();
    reg a,b,c;
    wire y1,y2;

    //insantiation
    CMOS C1(a,b,c,y1);
    GATE G1(a,b,c,y2);

    initial
    begin
    a=1;b=1;c=1;#10;
    end

    initial
    $monitor("a=%b,b=%b,c=%b,y1=%b,y2=%b,time=%t",a,b,c,y1,y2,$time);
    endmodule

/*    initial
    begin
#20;
    if(y1==y2)
        $display("FUNCTIONALITY EQUIVALENT");
        else
            $display("FUNCTIONALITY NOT EQUIVALENT");
    end
endmodule*/

