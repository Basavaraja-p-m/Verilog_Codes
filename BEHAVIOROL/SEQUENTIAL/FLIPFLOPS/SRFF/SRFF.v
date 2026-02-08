`include "SRL.v"
module SRFF(
            input S,R,Clk,Rst,
            output  Q,
            output Qbar
            );
  //behavioural model
  SRL S1(.s(S),
         .r(R),
         .clk(Clk),
         .rst(Rst),
         .q(q),
         .qbar(qbar)
         );
  SRL S2(.s(q),
         .r(qbar),
         .clk(~Clk),
         .rst(Rst),
         .q(Q),
         .qbar(Qbar)
         );
endmodule

//testbench

module SRFF_tb();
   reg S,R,Clk,Rst;
   wire Q,Qbar;

   //instantiation
   SRFF S1(S,R,Clk,Rst,Q,Qbar);

    initial 
    Clk=0;
    always #10 Clk=~Clk ;
    initial
    begin
    Rst=0;#6;
    Rst=1;
    repeat(17)
    begin
#1;
    S=$random;R=$random;#10;
    end
    end
    initial
    begin
    #100 $stop();
    end
    initial
    $monitor("Clk=%b S=%b R=%b Q=%b Qbar=%b Rst=%b Time=%t",Clk,S,R,Q,Qbar,Rst,$time);
    endmodule

