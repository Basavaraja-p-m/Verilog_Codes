module nand_gate(a,b,y);
     //directions
     input a;
     input b;
     output y;
     
     //internal signols
     wire W;
     supply1 VDD;
     supply0 GND;

     pmos p1(y,VDD,a);
     pmos p2(y,VDD,b);

     nmos n1(y,w,b);
     nmos n2(w,GND,a);
endmodule
