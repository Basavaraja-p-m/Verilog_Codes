module MUXS(i,s0,s1,y);
   input [3:0]i;
   input s0,s1;
   output y;

  //internol signols
  wire w1,w2,w3,w4;
  supply1 vdd;
  supply0 gnd;

  //switch level
  pmos p1(w1,vdd,~s1);
  pmos p2(w1,vdd,~s0);
  pmos p3(w1,vdd,i[0]);
  pmos p4(w2,w1,~s1);
  pmos p5(w2,w1,s0);
  pmos p6(w2,w1,i[1]);
  pmos p7(w3,w2,s1);
  pmos p8(w3,w2,~s0);
  pmos p9(w3,w2,i[2]);
  pmos p10(w4,w3,s1);
  pmos p11(w4,w3,s0);
  pmos p12(w4,w3,i[3]);
  pmos p13(y,vdd,w4);
  nmos n1(w6,gnd,i[0]);
  nmos n2(w5,w6,~s0);
  nmos n3(w4,w5,~s1);
  nmos n4(w8,gnd,i[1]);
  nmos n5(w7,w8,s0);
  nmos n6(w4,w7,~s1);
  nmos n7(w10,gnd,i[2]);
  nmos n8(w9,w10,~s0);
  nmos n9(w4,w9,s1);
  nmos n10(w12,gnd,i[3]);
  nmos n11(w11,w12,s0);
  nmos n12(w4,w11,s1);
  nmos n13(y,gnd,w4);
endmodule


    //testbench
    module MUXS_tb();
       reg [3:0]i;
       reg s0,s1;
       wire y;

       //instantiation
       MUXS M1(i,s0,s1,y);

       initial 
       begin
       i[0]=0;i[1]=0;i[2]=0;i[3]=0; s1=0;s0=0;#10;
       i[0]=0;i[1]=1;i[2]=0;i[3]=0; s1=0;s0=1;#10;
       i[0]=0;i[1]=0;i[2]=0;i[3]=0; s1=1;s0=0;#10;
       i[0]=0;i[1]=0;i[2]=0;i[3]=1; s1=1;s0=1;#10;
       end 
       initial
       $monitor("i=%b s1=%b s0=%b y=%b Time=%t",i,s1,s0,y,$time);
       endmodule


       
