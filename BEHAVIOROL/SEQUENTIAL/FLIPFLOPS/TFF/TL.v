module TL(
         input t,clk,rst,
         output reg q,
         output qbar
         );
 
 assign qbar=~q;
 //baherioul
 always @(t,clk,rst)
 begin
 if(rst==0)
     q<=0;
     else
         begin
         if(clk==0)
             begin
             if(!t)
                 q<=q;
             else
                 q<=~q;
              end
         end
end
endmodule

//testbench
module TL_tb();
    reg t,clk,rst;
    wire q,qbar;

    //instantiation
    TL T1(t,clk,rst,q,qbar);
    initial
    clk=0;
    always #10 clk=~clk;
    initial
    begin
    rst=0; #10;
    rst=1;
    repeat(50)
    begin
    t=$random;#10;
    end
    end
    initial 
    #100 $stop;
    initial
    $monitor("clk=%b t=%b q=%b qbar=%b rst=%b",clk,t,q,qbar,rst,$time);
    endmodule

             
