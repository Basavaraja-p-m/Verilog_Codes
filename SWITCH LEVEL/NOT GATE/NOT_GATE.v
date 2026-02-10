module NOT_GATE(a,y);
     input a;
     output y;

     //internol signols
     supply1 vdd;
     supply0 gnd;

     //switch primitives
     pmos p(y,vdd,a);
     nmos n(y,gnd,a);
endmodule
