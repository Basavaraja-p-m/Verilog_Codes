module FULL_SUB(a,b,cin,diff,barrow);
    input a,b,cin;
    output diff,barrow;
    
    //gate primitives
    wire w1,w2,w3;
    xor x1(w1,a,b);
    xor x2(diff,w1,cin);
    and a1(w2,~a,b);
    and a2(w3,~w1,cin);
    or o1(barrow,w3,w2);
 endmodule

     //testbench 

      module FULL_SUB_tb();
          reg a,b,cin;
          wire diff,barrow;

          //instantiation
          FULL_SUB FS1(a,b,cin,diff,barrow);

          initial begin
          repeat(5)
          begin
          a=$random; b=$random; cin=0;#10;
          end
          end
          initial
           $monitor("a=%d b=%d cin=%d diff=%d barrow=%d Time=%0t",a,b,cin,diff,barrow,$time);
       endmodule
