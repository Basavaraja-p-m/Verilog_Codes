`include "MUX_4TO1.v"
`include "DEMUX_4TO1.v"
module PROBLEM( 
               input [3:0]i,
               input [1:0]s,
               output [3:0]g
               );

      MUX_4TO1 M1(.i(i),
                  .s(s),
                  .y(y)
                  );
      DEMUX_4TO1 D1(.y(y),
                    .s(s),
                    .i(g)
                    );
 endmodule

       //testbench
       module PROBLEM_tb();
            integer x;
            reg [3:0]i;
            reg [1:0]s;
            wire [3:0]g;

            //instantiation
            PROBLEM P1(i,s,g);

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
              $monitor("i[0]=%b i[1]=%b i[2]=%b i[3]=%b s=%b g[0]=%b g[1]=%b g[2]=%b g[3]=%b Time=%0t",i[0],i[1],i[2],i[3],s,g[0],g[1],g[2],g[3],$time); 
endmodule

