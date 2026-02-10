module RAM(
           input clk,rst,
           input rd_wr,
           input [7:0]data_in,
           input [4:0]addr,
           output reg [7:0]data_out
           );

reg [7:0] mem[31:0];
integer i;

always @(posedge clk or negedge rst)
begin
if(!rst)
    begin
    data_out<=0;
    for(i=0;i<32;i=i+1)
        mem[i]<=0;
    end
    else
        begin
        if(rd_wr)
            mem[addr]<=data_in;
        else
            data_out<=mem[addr];
        end
    
end
endmodule

module RAM_tb();
      reg clk,rst;
      reg rd_wr;
      reg [7:0]data_in;
      reg [4:0]addr;
      wire [7:0]data_out;
      integer i;
      reg finish;
      
      //instantiation
      RAM R1(clk,rst,rd_wr,data_in,addr,data_out);

      initial
      clk=0;
      always #5 clk=~clk;

      initial
      begin
      rst=0;
#20;
      rst=1;
      end

      task WRITE();
      begin
         rd_wr=1;
         for(i=0;i<32;i=i+1)
             begin
             addr=i;
             data_in=$random;
#10;
             end
      end
      endtask

      task READ();
      begin
         rd_wr=0;
         for(i=0;i<32;i=i+1)
             begin
             addr=i;#10;
             end
         finish=1;
      end
      endtask

      
      initial
      begin
      WRITE();
      READ();
      end

      initial
      begin
      wait(finish==1);
      $stop;
      end

      initial
      $monitor("clk=%d,rst=%d,rd_wr=%d,data_in=%d,addr=%d,data_out=%d,Time=%t",clk,rst,rd_wr,data_in,addr,data_out,$time);
      endmodule


