`include "RAM32B.v"
module RAM32B_tb();
  reg clk,rst;
  reg [7:0]data_in;
  reg [4:0]addr;
  reg wr_rd;
  wire [7:0]data_out;
  reg finish;
  integer i;
  //instnatiation

  RAM32B R1(.*);

  initial
  clk=0;
  always #5 clk=~clk;

  initial
  begin
  rst=0;
  #10;
  rst=1;
  end

  task WRITE();    
  begin
      wr_rd=1;
      for(i=0;i<32;i=i+1)
          begin
          wait(rst==1);
          addr=i;
          data_in=$urandom_range(10,100);  
          #10;
          end
  end
  endtask
  task READ();
  begin
     wr_rd=0;
     for(i=0;i<32;i=i+1)
         begin
         addr=i;    
      //   data_in=$random;
         #10;
         end
     finish=1;
  end
  endtask

//call task
initial
  begin
  WRITE();
  READ();
  end

//delay 
 initial
  begin
  wait (finish==1);
  $stop;
  end

  initial
  $monitor("clk=%b rst=%b data_in=%d addr=%d wr_rd=%b data_out=%d Time=%t",clk,rst,data_in,addr,wr_rd,data_out,$time);
  endmodule
 

