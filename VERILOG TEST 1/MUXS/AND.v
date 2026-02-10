module AND(a,b,c,y);
   input a,b,c;
   output y;

   and a1(y,a,b,c);

endmodule

    //testbench
    module AND_tb();
      reg a,b,c;
      wire y;

      //instantiation
      AND A1(a,b,c,y);

      initial
      begin
      a=1;b=1;c=1;#10;
      a=1;b=0;c=1;#10;
      end
      initial
      $monitor("a=%b b=%b c=%b y=%b Time=%t",a,b,c,y,$time);
      endmodule
