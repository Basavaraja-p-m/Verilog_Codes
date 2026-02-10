module ENCODER_8TO3(
                    input [7:0]i,
                    output [2:0]y
                    );

     //data flow 
     assign y[0]=i[1]|i[3]|i[5]|i[7];
     assign y[1]=i[2]|i[3]|i[6]|i[7];
     assign y[2]=i[4]|i[5]|i[6]|i[7];
 endmodule

    //testbench
    module ENCODER_8TO3_tb();
        reg [7:0]i;
        wire [2:0]y;

        //instantiation
        ENCODER_8TO3 E8(i,y);

        initial 
        begin
        i[7]=0;i[6]=0;i[5]=0;i[4]=0;i[3]=0;i[2]=0;i[1]=0;i[0]=1;#10;
        i[7]=0;i[6]=0;i[5]=0;i[4]=0;i[3]=0;i[2]=0;i[1]=1;i[0]=0;#10;
        i[7]=0;i[6]=0;i[5]=0;i[4]=0;i[3]=0;i[2]=1;i[1]=0;i[0]=0;#10;
        i[7]=0;i[6]=0;i[5]=0;i[4]=0;i[3]=1;i[2]=0;i[1]=0;i[0]=0;#10;
        i[7]=0;i[6]=0;i[5]=0;i[4]=1;i[3]=0;i[2]=0;i[1]=0;i[0]=0;#10;
        i[7]=0;i[6]=0;i[5]=1;i[4]=0;i[3]=0;i[2]=0;i[1]=0;i[0]=0;#10;
        i[7]=0;i[6]=1;i[5]=0;i[4]=0;i[3]=0;i[2]=0;i[1]=0;i[0]=0;#10;
        i[7]=1;i[6]=0;i[5]=0;i[4]=0;i[3]=0;i[2]=0;i[1]=0;i[0]=0;#10;
        end 
        initial
        $monitor("i=%b y=%b Time=%0t",i,y,$time);
        endmodule


