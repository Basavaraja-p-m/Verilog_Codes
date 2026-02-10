module EXERCISE(a,b,cin,s,c);
    input a,b,cin;
    output s,c;

    //gate primitive
    wire w1,w2,w3,w4,w5,w6,w7;
    nand n1(w1,a,b);
    nand n2(w2,a,w1);
    nand n3(w3,w1,b);
    nand n4(w4,w2,w3);
    nand n5(w5,w4,cin);
    nand n6(w6,w4,w5);
    nand n7(w7,w5,cin);
    nand n8(s,w6,w7);
    nand n9(c,w1,w5);
endmodule
 
    //testebench
    module EXERCISE_tb();
      reg a,b,cin;
      wire s,c;

      //instantuiation
      EXERCISE E1(a,b,cin,s,c);

      initial
      repeat(10)
      begin
      a=$random; b=$random; cin=1;#10;
      end 
      initial
      $monitor("a=%b b=%b cin=%b s=%b c=%b",a,b,cin,s,c,$time);
      endmodule
