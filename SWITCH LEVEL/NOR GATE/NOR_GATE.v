module NOR_GATE(a,b,y);
     input a,b;
     output y;

     //internal signols
     wire w;
     supply1 vdd;
     supply0 gnd;

     //switch primitives
     pmos p1(w,vdd,a);
     pmos p2(y,w,b);

     nmos n1(y,gnd,a);
     nmos n2(y,gnd,b);
endmodule
