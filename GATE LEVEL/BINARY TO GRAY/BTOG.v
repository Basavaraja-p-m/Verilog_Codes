module BTOG(
           input [3:0]b,
           output [3:0]g
           );
      //gate primitives
      buf b1(g[3],b[3]);
      xor x1(g[2],b[3],b[2]);
      xor x2(g[1],b[2],b[1]);
      xor x3(g[0],b[0],b[1]);

 endmodule

      module BTOG_tb();
          reg [3:0]b;
          wire [3:0]g;

         //instantiation
         BTOG B1(b,g);

         initial 
          repeat(5)
         begin
            b=$random % 16; #10;
          end
          initial
          $monitor("b[3]=%b b[2]=%b b[1]=%b b[0]=%b g[3]=%b g[2]%b g[1]=%b g[0]=%b Tim=%0t",b[3],b[2],b[1],b[0],g[3],g[2],g[1],g[0],$time);
  endmodule


