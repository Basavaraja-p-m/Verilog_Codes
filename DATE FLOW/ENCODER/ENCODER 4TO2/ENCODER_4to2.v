module ENCODER_4TO2(
                    input [3:0]i,
                    output [1:0]d
                    );

   //data flow
   assign d[0]=i[1]|i[3];
   assign d[1]=i[2]|i[3];
   endmodule

   //testebench
   module ENCODER_4TO2_tb();
       reg [3:0]i;
       wire [1:0]d;

       //instantiation
       ENCODER_4TO2 E4(i,d);

       initial
       begin
       i[3]=0;i[2]=0;i[1]=0;i[0]=1;#10;
       i[3]=0;i[2]=0;i[1]=1;i[0]=0;#10;
       i[3]=0;i[2]=1;i[1]=0;i[0]=0;#10;
       i[3]=1;i[2]=0;i[1]=0;i[0]=0;#10;
       end
       initial
       $monitor("i=%b d=%b Time=%0t",i,d,$time);
       endmodule


