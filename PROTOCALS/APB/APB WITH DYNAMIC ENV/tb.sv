`include "env.sv" 
program tb(inter i);
   env e1;

   initial
   begin
     e1=new(i);
     e1.env();
   end
   
endprogram

   
