module DEMUX_1TO8(
                  input y,
                  input [2:0]s,
                  output [7:0]i
                  );

         //data flow
         assign i[0]=~s[2]&~s[1]&~s[0]&y;
         assign i[1]=~s[2]&~s[1]&s[0]&y;
         assign i[2]=~s[2]&s[1]&~s[0]&y;
         assign i[3]=~s[2]&s[1]&s[0]&y;
         assign i[4]=s[2]&~s[1]&~s[0]&y;
         assign i[5]=s[2]&~s[1]&s[0]&y;
         assign i[6]=s[2]&s[1]&~s[0]&y;
         assign i[7]=s[2]&s[1]&s[0]&y;
endmodule
 
        //tetstbench
        module DEMUX_1TO8_tb();
             reg y;
             reg [2:0]s;
             wire [7:0]i;

             //instantiaton
             DEMUX_1TO8 D3(y,s,i);

             initial
             repeat(8)
             begin
             y=$random;s=$random;#10;
             end
             initial
             $monitor("y=%b s=%b i[0]=%b i[1]=%b i[2]=%b i[3]=%b i[4]=%b i[5]=%b i[6]=%b i[7]=%b Time=%t",y,s,i[0],i[1],i[2],i[3],i[4],i[5],i[6],i[7],$time);
             endmodule
