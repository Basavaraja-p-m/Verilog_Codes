module SRFF1(
            input s,r,clk,rst,
            output reg q,
            output qbar
            );

assign qbar=~q;
//behavioural

always @(posedge clk)
   begin
    if(rst==0)                    
        q<=0;
    else
        begin                          
      /* if(s==0 && r==0)              // case ({s,r})
            q<=q;                       //   0 : q<=q;
        else if(s==0 && r==1)             // 1 : q<=0;
            q<=0;                          //2 : q<=1;
        else if(s==1 && r==0)         // default : q<=1'bx;
            q<=1;                     // endcase
        else 
            q<=1'bx;
        end */
        case ({s,r})
           0 : q<=q;
           1 : q<=0;
           2 : q<=1;
        default : q<=1'bx;
        endcase
        end
        
    end
endmodule

//testbench
module SRFF1_tb();
   reg s,r,clk,rst;
   wire q,qbar;

   //instantiation
    SRFF1 S1(s,r,clk,rst,q,qbar);
    
    //generate clk signol
   
   initial
   clk=0;
   always  
#10 clk=~clk;

   //generate rst signol
  
  initial
  begin
   rst=0;#5;
   rst=1;
  repeat(10)
  begin
#3;
   s=$random;r=$random;#10;
   end
   end
   initial
   #100 $stop;
   initial
   $monitor("s=%b r=%b clk=%b rst=%b q=%b qbar=%b Time=%t",s,r,clk,rst,q,qbar,$time);
   endmodule

