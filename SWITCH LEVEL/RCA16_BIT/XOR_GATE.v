module XOR_GATE(a,b,y);
     input a,b;
     output y;

     //internol signols
     wire w1,w2,w3,w4;
     supply1 vdd;
     supply0 gnd;

     //switch primitives
     pmos p1(w1,vdd,~a);
     pmos p2(w1,vdd,b);
     pmos p3(w2,w1,a);
     pmos p4(w2,w1,~b);
     pmos p5(y,vdd,w2);
     nmos n1(w3,gnd,b);
     nmos n2(w2,w3,~a);
     nmos n3(w4,gnd,~b);
     nmos n4(w2,w4,a);
     nmos n5(y,gnd,w2);
endmodule
