module EPC(a,b,c,pb,pc);
    input a,b,c,pb;
    output pc;

    //data flow
    assign pc=((c^pb)&(a~^b))+((c~^pb)&(a^b));
 endmodule

   //testbench
   module EPC_tb();
      reg a,b,c,pb;
      wire pc;
    
    //instantiation
      EPC E1(a,b,c,pb,pc);
      initial 
      repeat(10)
      begin
      a=$random;b=$random;c=$random;pb=$random;#10;
      end
      initial
      $monitor("a=%b b=%b c=%b pb=%b pc=%b Time=%t",a,b,c,pb,pc,$time);
      endmodule
