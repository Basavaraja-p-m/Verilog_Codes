module MUX_4TO1(
               input [3:0]i,
               input [1:0]s,
               output y
               );

     //gate pimitives

       wire[3:0]w;
       and a1(w[0],~s[1],~s[0],i[0]);
       and a2(w[1],~s[1],s[0],i[1]);
       and a3(w[2],s[1],~s[0],i[2]);
       and a4(w[3],s[1],s[0],i[3]);
       or o(y,w[0],w[1],w[2],w[3]);
 endmodule

      //testbench

      module MUX_4TO1_tb();
          integer x;
          reg [3:0]i;
          reg [1:0]s;
          wire y;

          //instantiation
          MUX_4TO1 M4(i,s,y);

          initial
          repeat(5)
          begin 
             i=$random;
             for(x=0;x<4;x=x+1)
                 begin
                 s=x;#10;
                 end
             /*s=0;#10;
             s=1;#10;
             s=2;#10;
             s=3;#10;*/
          end
          initial
            $monitor("i=%b s=%b y=%b Time=%0t",i,s,y,$time);
        endmodule
         

