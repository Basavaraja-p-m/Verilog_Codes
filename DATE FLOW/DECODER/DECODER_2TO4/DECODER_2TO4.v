module DECODER_2TO4(
                   input [1:0]i,
                   output [3:0]y
                   );

        //data flow
        assign y[0]=~i[1]&~i[0];
        assign y[1]=~i[1]&i[0];
        assign y[2]=i[1]&~i[0];
        assign y[3]=i[1]&i[0];
 endmodule

        //testbench
        module DECODER_2TO4_tb();
          reg [1:0]i;
          wire [3:0]y;

          //instantiation
          DECODER_2TO4 D2(i,y);

          initial 
          begin
          i[1]=0;i[0]=0;#10;
          i[1]=0;i[0]=1;#10;
          i[1]=1;i[0]=0;#10;
          i[1]=1;i[0]=1;#10;
          end
          initial 
          $monitor("i=%b y=%b Time=%0t",i,y,$time);
          endmodule
