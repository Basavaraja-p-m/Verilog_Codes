module OR_GATE(a,b,y);
     input a,b;
     output y;

     //internol signols
     wire w1,w2;
     supply1 vdd;
     supply0 gnd;

     //switch primitives
     pmos p1(w1,vdd,a);
     pmos p2(w2,w1,b);
     pmos p3(y,vdd,w2);

     nmos n1(w2,gnd,a);
     nmos n2(w2,gnd,b);
     nmos n3(y,gnd,w2);
endmodule
