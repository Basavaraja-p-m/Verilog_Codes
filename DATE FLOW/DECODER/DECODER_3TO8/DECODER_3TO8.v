module DECODER_3TO8(
                    input [2:0]i,
                    output [7:0]y
                    );
   
   //data flow
   assign y[0]=~i[2]&~i[1]&~i[0];
   assign y[1]=~i[2]&~i[1]&i[0];
   assign y[2]=~i[2]&i[1]&~i[0];
   assign y[3]=~i[2]&i[1]&i[0];
   assign y[4]=i[2]&~i[1]&~i[0];
   assign y[5]=i[2]&~i[1]&i[0];
   assign y[6]=i[2]&i[1]&~i[0];
   assign y[7]=i[2]&i[1]&i[0];
 endmodule

    //testbench
    module DECODER_3TO8_tb();
        reg [2:0]i;
        wire [7:0]y;

        //instantiation
        DECODER_3TO8 D3(i,y);

        initial 
        begin
        i[2]=0;i[1]=0;i[0]=0;#10;
        i[2]=0;i[1]=0;i[0]=1;#10;
        i[2]=0;i[1]=1;i[0]=0;#10;
        i[2]=0;i[1]=1;i[0]=1;#10;
        i[2]=1;i[1]=0;i[0]=0;#10;
        i[2]=1;i[1]=0;i[0]=1;#10;
        i[2]=1;i[1]=1;i[0]=0;#10;
        i[2]=1;i[1]=1;i[0]=1;#10;
        end
        initial 
        $monitor("t=%b y=%b Time=%t",i,y,$time);
        endmodule
