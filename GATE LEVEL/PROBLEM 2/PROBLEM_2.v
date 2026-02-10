`include "ENCODER_4TO2.v"
`include "DECODER_4TO2.v"
module PROBLEM_2(
                input [3:0]d,
                output[3:0]g
                );
wire [1:0]w;
   // instantiation
   ENCODER_4TO2 E1(.d(d),
                   .y(w)
                  );
   DECODER_4TO2 D1(.y(w),
                   .d(g)
                   );

 endmodule

      module PROBLEM_2_tb();
          reg [3:0]d;
          wire[3:0]g;

          //instantiation
          PROBLEM_2 P2(.d(d),
                       .g(g)
                      );

          initial 
          begin
           d[0]=1;d[1]=0;d[2]=0;d[3]=0;#10;
           d[0]=0;d[1]=1;d[2]=0;d[3]=0;#10;
           d[0]=0;d[1]=0;d[2]=1;d[3]=0;#10;
           d[0]=0;d[1]=0;d[2]=0;d[3]=1;#10;
           end
           initial
           $monitor("d[0]=%b d[1]=%b d[2]=%b d[3]=%b g[3]=%b g[2]=%b g[1]=%b g[0]=%b Time=%0t",d[0],d[1],d[2],d[3],g[3],g[2],g[1],g[0],$time);
      endmodule
