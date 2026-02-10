module OR(a,b,c,d,y);
   input a,b,c,d;
   output y;

   or o1(y,a,b,c,d);

endmodule

    //testbench
    module AND_tb();
      reg a,b,c,d;
      wire y;

      //instantiation
      OR A1(a,b,c,d,y);

      initial
      begin
      a=1;b=1;c=1;d=1;#10;
      a=1;b=0;c=1;d=0;#10;
      end
      initial
      $monitor("a=%b b=%b c=%b d=%b y=%b Time=%t",a,b,c,d,y,$time);
      endmodule
