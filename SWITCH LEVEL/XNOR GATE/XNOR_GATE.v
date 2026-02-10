module XNOR_GATE(a,b,y);
     input a,b;
     output y;

     //internol signols
     wire w1,w2,w3;
     supply1 vdd;
     supply0 gnd;

     //switch primitives
     pmos p1(w1,vdd,~a);
     pmos p2(w1,vdd,b);
     pmos p3(y,w1,a);
     pmos p4(y,w1,~b);
     nmos n1(w3,gnd,b);
     nmos n2(y,w3,~a);
     nmos n3(w4,gnd,~b);
     nmos n4(y,w4,a);
endmodule
