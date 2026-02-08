module DL(
          input d,clk,rst,
          output reg q,
          output qbar
          );

assign qbar=~q;

//behaviroul model
always @(d,rst,clk)
begin
if(rst==0)
    q<=0;
    else if(clk==1)
        begin
        if(!d)
            q<=d;
        else
            q<=d;
        end
 end
 endmodule

