module EPG(a,b,c,pg);
    input a,b,c;
    output pg;

    //data flow
    assign pg=a^b^c;

 endmodule

   //testbench
   module EPG_tb();
     reg a,b,c;
     wire pg;

     //instantiation
     EPG E1(a,b,c,pg);

     initial
     repeat(10)
     begin
     a=$random;b=$random;c=$random;#10;
     end
     initial
     $monitor("a=%b b=%b c=%b pg=%b Time=%0t",a,b,c,pg,$time);
     endmodule

