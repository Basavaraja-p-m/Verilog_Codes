module MUX_2to1(i0,i1,s,y);
    input i0,i1,s;
    output y;

    //gate primitives
     wire w1,w2;
     and a1(w1,i0,~s);
     and a2(w2,i1,s);
     or o1(y,w1,w2);
 endmodule

    //testbench 

    module MUX_2to1_tb();
       reg i0,i1,s;
       wire y;

       //instantiation
       MUX_2to1 M1(i0,i1,s,y);
          
        initial begin
        repeat(5)
        begin
        i0=$random; i1=$random; s=1; #10;
        end
        end
        initial
          $monitor("i0=%d i1=%d s=%d y=%d Time=%0t",i0,i1,s,y,$time);
     endmodule
       

