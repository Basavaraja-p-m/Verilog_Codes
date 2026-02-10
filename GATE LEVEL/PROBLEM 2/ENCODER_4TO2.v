module ENCODER_4TO2(
                    input [3:0]d,
                    output [1:0]y
                    );
      
     or o1(y[1],d[2],d[3]);
     or o2(y[0],d[1],d[3]);

endmodule

    //testbench
    module ENCODER_4TO2_tb();
        reg [3:0]d;
        wire [1:0]y;

     //instantiation
     ENCODER_4TO2 E1(d,y);

     initial
        begin
        d[3]=1;d[2]=0;d[1]=0;d[0]=0;#10;
        d[3]=0;d[2]=1;d[1]=0;d[0]=0;#10;
        d[3]=0;d[2]=0;d[1]=1;d[0]=0;#10;
        d[3]=0;d[2]=0;d[1]=0;d[0]=1;#10;
        end
        initial
        $monitor("d[3]=%b d[2]=%b d[1]=%d d[0]=%b y[1]=%b y[0]=%b Time=%0t",d[3],d[2],d[1],d[0],y[1],y[0],$time);
       endmodule
