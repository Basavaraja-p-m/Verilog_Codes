`include "packet.sv"
`include "gen.sv"
`include "driver.sv"
`include "monitor.sv"

class env;
   packet p4;
   gen  g1;
   driver  d1;
   monitor m1;

   mailbox #(packet) g2d,g2c;
   virtual inter i;
   int num;
   string op="write";

   function new(virtual inter i);
   this.i=i;
   endfunction

   task build();
      g2d=new;
      g2c=new;
   endtask

   task env();
      build();
      g1=new(g2d,g2c,i,5,op);
      d1=new(g2d,i);
      m1=new(i);
      
      fork 
      g1.gen();
      d1.dri();
      m1.mon();
      join
      
   endtask
endclass



