module DEMUX_1TO2(
                  input y,
                  input s,
                  output [1:0]i
                  );
     
     //data flow
     assign i[0]=~s&y;
     assign i[1]=s&y;
 endmodule
   
   //testbench
   module DEMUX_1TO2_tb();
       reg y;
       reg s;
       wire [1:0]i;

       //instantiation
       DEMUX_1TO2 D1(y,s,i);

       initial 
       repeat(5)
       begin
       y=$random;s=$random;#10;
       end 
       initial
       $monitor("y=%b s=%b i[0]=%b i[1]=%b Time=%0t",y,s,i[0],i[1],$time);
       endmodule
