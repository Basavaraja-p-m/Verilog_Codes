module RAM #(parameter WIDTH=8,DEPTH=32)(
    input clk,rst,wr_rd,
    input [WIDTH-1:0]data_in,
    input [$clog2(DEPTH)-1:0]addr,
    output empty,full,
    output reg[WIDTH-1:0]data_out
    );
integer i;
reg [$clog2(DEPTH):0]count;
//memory allocation
reg [WIDTH-1:0] mem[DEPTH-1:0];


   assign empty=(count==0);
   assign full=(count==DEPTH);
          

always @(posedge clk or negedge rst)
begin
if(!rst)
    begin
    data_out<=0;
  //  empty<=1;
  //  full<=0;
    count<=0;
    for(i=0;i<DEPTH;i=i+1)
        mem[i]<=0;
    end
    else
       
           if(wr_rd)
               begin
                  mem[addr]<=data_in;
                  if(count<DEPTH)
                     count<=count+1;
               end
           else
               begin
                  data_out<=mem[addr];
                  if(count>0)
                      count<=count-1;
               end
       
     
  end 
endmodule

//testbench

module RAM_tb #(parameter WIDTH=8,DEPTH=32)();
    reg clk,rst,wr_rd;
    reg [WIDTH-1:0]data_in;
    reg [$clog2(DEPTH)-1:0]addr;
    wire empty,full;
    wire [WIDTH-1:0]data_out;
    integer i;
    reg finish;
    //instantiation
    RAM R1(.*);

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
        wr_rd=1;
        for(i=0;i<DEPTH;i=i+1)
            begin
            addr=i;
            data_in=$random;
            #10;
            end
        end
    endtask

    task READ();
         begin
         wr_rd=0;
         for(i=0;i<DEPTH;i=i+1)
             begin
             addr=i;
             #10;
             end
           finish=1;
         end
    endtask

    //task call
    initial
    begin
    wait (rst==1);
    WRITE();
    READ();
    end  

    initial
    begin
    wait(finish==1);
     $stop;
    end

    initial
    $monitor("clk=%d rst=%d wr_rd=%d data_in=%d addr=%d data_out=%d full=%d empty=%d Time=%t",clk,rst,wr_rd,data_in,addr,data_out,full,empty,$time);
    endmodule



