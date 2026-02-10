module AND(
          input a,b,
          output y
          );

//internol signols
wire w1,w2;
supply1 vdd;
supply0 gnd;

//switch primitives
pmos p1(w2,vdd,a);
pmos p2(w2,vdd,b);
pmos p3(y,vdd,w2);

nmos n1(w1,gnd,b);
nmos n2(w2,w1,a);
nmos n3(y,gnd,w2);

endmodule

module AND_tb();
   reg a,b;
   wire y;

   //instantiation
   AND A1(a,b,y);

   initial
   repeat(10)
   begin
   a=$random; b=$random; #10;
   end

   initial
   $monitor("a=%b,b=%b,y=%b,time=%b",a,b,y,$time);
   endmodule

