module SRL(
          input s,r,clk,rst,
          output reg q,
          output qbar
          );

 assign qbar=~q;

 //behevioural
  always @(clk,rst,s,r)
  begin
       if(rst==0)
           q<=0;
       else 
           begin
           if(clk==0)
               begin
               if(s==0 && r==0)
                   q<=q;
               else if(s==0 && r==1)
                   q<=0;
               else if(s==1 && r==0)
                   q<=1;
               else 
                   q<=1'bx;
               end
           end
    end
endmodule







