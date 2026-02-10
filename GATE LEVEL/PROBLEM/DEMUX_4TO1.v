module DEMUX_4TO1(
        input y,
        input [1:0]s,
        output [3:0]i
        );
    
    //gate primitives
    and a1(i[0],~s[1],~s[0],y);
    and a2(i[1],~s[1],s[0],y);
    and a3(i[2],s[1],~s[0],y);
    and a4(i[3],s[1],s[0],y);

  endmodule

    //testbench
    module DEMUX_4TO1_tb();
        integer x;
        reg y;
        reg [1:0]s;
        wire [3:0]i;

        //instantiton
        DEMUX_4TO1 D1(y,s,i);

        initial 
        repeat(5)
        begin
         y=$random;
         for(x=0;x<4;x=x+1)
             begin
                s=x;#10;
             end
         end
        /* s=0;#10;
         s=1;#10;
         s=2;#10;
         s=3;#10;*/
         initial
          $monitor("y=%b s=%b i[0]=%b i[1]=%b i[2]=%b i[3]=%b Time=%t",y,s,i[0],i[1],i[2],i[3],$time);
      endmodule    


