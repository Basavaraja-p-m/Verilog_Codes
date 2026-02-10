module DECODER_4TO2(
                   input [1:0]y,
                   output [3:0]d
                   );
      //gate primitives
      and a1(d[0],~y[1],~y[0]);
      and a2(d[1],~y[1],y[0]);
      and a3(d[2],y[1],~y[0]);
      and a4(d[3],y[1],y[0]);
endmodule

    //testbench
     module DECODER_4TO2_tb();
         reg [1:0]y;
         wire [3:0]d;

         //instantiation
         DECODER_4TO2 D1(y,d);

         initial
         begin
           y[0]=0;y[1]=0;#10;
           y[0]=0;y[1]=1;#10;
           y[0]=1;y[1]=0;#10;
           y[0]=1;y[1]=1;#10;

         end
           initial
           $monitor("y[1]=%b y[0]=%b d[3]=%b d[2]=%b d[1]=%b d[0]=%b Time=%0t",y[1],y[0],d[3],d[2],d[1],d[0],$time);
  endmodule
