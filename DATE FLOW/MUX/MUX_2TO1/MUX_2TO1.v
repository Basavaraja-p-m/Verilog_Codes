m:odule MUX_2TO1(
               input [1:0]i,
               input s,
               output y
               );
     //data flow
     assign y=(s==0)?i[0]:i[1];
endmodule

    //testbench
    module MUX_2TO1_tb();
        reg [1:0]i;
        reg s;
        wire y;

        //instantiation
        MUX_2TO1 M0(i,s,y);

        initial
        repeat(5)
        begin
        i=$random;s=$random;#10;
        end
        initial
        $monitor("i=%b s=%b y=%b Time=%t",i,s,y,$time);
        endmodule


