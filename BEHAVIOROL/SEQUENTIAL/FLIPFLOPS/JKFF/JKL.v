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

//testbench

module JKL_tb();
   reg j,k,clk,rst;
   wire q,qbar;

   //instantiation
   JKL J1(j,k,clk,rst,q,qbar);

   initial
   clk=0;
   always #10 clk=~clk;
   initial
   begin
   rst=0; #10;
   rst=1;
   end
   initial
   begin
   j=0;k=0;#10;
   j=0;k=1;#10;
   j=1;k=0;#10;
   j=1;k=1;#10;
   end
   initial
   #100 $stop;
   initial
   $monitor("clk=%b rst=%b j=%b k=%b q=%b qbar=%b Time=%t",clk,rst,j,k,q,qbar,$time);
   endmodule

