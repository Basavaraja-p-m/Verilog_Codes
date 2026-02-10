module DEMUX_1TO4(
                 input y,
                 input [1:0]s,
                 output [3:0]i
                 );

      //data flow
      assign i[0]=~s[1]&~s[0]&y;
      assign i[1]=~s[1]&s[0]&y;
      assign i[2]=s[1]&~s[0]&y;
      assign i[3]=s[1]&s[0]&y;
 endmodule

     //testbench
     module DEMUX_1TO4_tb();
          reg y;
          reg [1:0]s;
          wire [3:0]i;

          //instantiation
          DEMUX_1TO4 D2(y,s,i);

          initial 
          repeat(8)
          begin
          y=$random;s=$random;#10;
          end 
          initial
          $monitor("i[0]=%b i[1]=%b i[2]=%b i[3]=%b s=%b y=%b Time=%t",i[0],i[1],i[2],i[3],s,y,$time);
          endmodule
      
