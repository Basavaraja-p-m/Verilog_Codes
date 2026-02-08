module JKL(
           input j,k,clk,rst,
           output reg q,
           output qbar
           );

 assign qbar=~q;
 //behavioural model
 always @(j,k,clk,rst)
    begin
    if(rst==0)
        q<=0;
        else 
            begin
            if(clk==0)
                begin
                if(!j && !k)
                    q<=q;
                else if(j==0 && k==1)
                    q<=0;
                else if(j==1 && k==0)
                    q<=1;
                else if(j==1 && k==1)
                    q<=~q;
                end
            end
     end    
 endmodule



