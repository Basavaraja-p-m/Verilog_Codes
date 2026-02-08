module ENCODER(a,y);
   parameter IN=4;
   input [IN-1:0]a;
   output [$clog2(IN)-1:0]y;

   assign y[0]=a[1]+a[3];
   assign y[1]=a[2]+a[3];

endmodule

   //testbench
   module ENCODER_tb(y,a);
      parameter IN=4;
      input wire[$clog2(IN)-1:0]y;
      output reg [IN-1:0]a;
      
      initial 
      begin
      a[3]=0;a[2]=0;a[1]=0;a[0]=1;#10;
      a[3]=0;a[2]=0;a[1]=1;a[0]=0;#10;
      a[3]=0;a[2]=1;a[1]=0;a[0]=0;#10;
      a[3]=1;a[2]=0;a[1]=0;a[0]=0;#10;
      end
      initial 
      $monitor("a=%b y=%b Time=%t",a,y,$time);
      endmodule

      //top model
      module TOP();

      parameter IN=4;
      wire [IN-1:0]w1;
      wire [$clog2(IN)-1:0]w2;

      //instantiation
      ENCODER E1(w1,w2);
      ENCODER_tb E2(w2,w1);

       endmodule
