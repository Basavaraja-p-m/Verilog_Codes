module APB #(parameter idle=0,setup=1,access=2)(
         input clk,rst,
         input transfer,pready,pwrite,
         output reg pselx,penable
         );
reg[1:0]cs,ns;

always @(posedge clk or negedge rst)
begin
if(!rst)
    begin
    cs<=0;
    {pselx,penable}=2'b00;
    end
    else
        cs<=ns;
end

always @(*)
begin
    case(cs)
    idle : if(transfer==1)
             begin
             ns<=setup;
             pselx<=1;
             penable<=0;
             end
           else
             begin
             ns<=idle;
             {pselx,penable}=2'b00;
             end
     setup : if(transfer==1)
               begin
               ns<=access;
               {pselx,penable}<=2'b11;
               end
             else
               begin
               ns<=setup;
               pselx<=0;
               penable<=0;
               end
      access : if(pready==0)
                 begin
                 ns<=access;
                 {pselx,penable}<=2'b11;
                 end
               else
                   begin
                   if(transfer==1)
                       begin
                       ns<=setup;
                       pselx<=1;
                       penable<=0;
                       end
                   else
                       begin
                       ns<=idle;
                       pselx<=0;
                       penable<=0;
                       end
                   end
       endcase
end
endmodule

module APB_tb();
     reg clk,rst;
     reg transfer,pready,pwrite;
     wire pselx,penable;

//instantiation
    APB A1(clk,rst,transfer,pready,pwrite,pselx,penable);

    initial
    clk=0;
    always #5 clk=~clk;

    initial
    begin
    rst=0;
#20;
    rst=1;
    end

    initial
    begin
    transfer=0;
#20;
   // repeat(20)
   // {transfer,pready}=$random;#10;
    transfer=1;#10;
    //pready=0;#10;
   // pready=1;
    transfer=1;#10;
    pready=0;//pready=0;
    transfer=0;
    pwrite=1;#10;
    //transfer=0;#10;
    end
    
    always @(A1.cs)
    begin
       case(A1.cs)
       0 : $display("IDLE");
       1 : $display("SETUP");
       2 : $display("ACCESS");
       endcase
    end
    
    always @(posedge clk)
    begin
       if(A1.cs==A1.access && penable==1 && pwrite==1)
       $display("HI");
       else
           if(A1.cs==A1.access && penable==1 && pwrite==0)
           $display("BYE");
    end
    
    initial
    $monitor("clk=%d,rst=%d,transfer=%d,pready=%d,pselx=%d,penable=%d,Time=%t,pwrite=%d",clk,rst,transfer,pready,pselx,penable,$time,pwrite);
    endmodule
   
                  
              

