module FC #(parameter DEPTH=8,WIDTH=8)(
      input clk,rst,
      input [WIDTH-1:0]data_in,
      input rd,wr,
      output reg[WIDTH-1:0]data_out,
      output empty,full
      );
//internol signols
reg [$clog2(WIDTH)-1:0]wr_ptr;
reg [$clog2(DEPTH)-1:0]rd_ptr;
integer count,i;
//memeory  alllocation
reg [WIDTH-1:0] mem[DEPTH-1:0];

assign empty=(count==0);
assign full=(count==DEPTH);

always @(posedge clk or negedge rst)
begin
if(!rst)
    begin
    data_out<=0;
    wr_ptr<=0;
    rd_ptr<=0;
    count<=0;
    for(i=0;i<DEPTH;i=i+1)
        mem[i]<=0;
    end
    else
        if(wr && !rd && !full)
            begin
            mem[wr_ptr]<=data_in;
            wr_ptr<=wr_ptr+1;
            count=count+1;
            end
        else if(!wr && rd && !empty)
            begin
            data_out<=mem[rd_ptr];
            rd_ptr<=rd_ptr+1;
            count=count-1;
            end
 end
 endmodule

module FC_tb #(parameter DEPTH=8,WIDTH=8)();
      reg clk,rst;
      reg [WIDTH-1:0]data_in;
      reg rd,wr;
      wire [WIDTH-1:0]data_out;
      wire empty,full;

      //instantiation
      FC F1(clk,rst,data_in,rd,wr,data_out,empty,full);

      initial
      clk=0;
      always #5 clk=~clk;

      initial
      begin
      rst=0;#20;
      rst=1;
      end

      task WRITE();
      begin
      wait(rst==1)
      wr=1;
      rd=0;
      repeat(8)
      begin
      data_in=$random;#10;
      end
      end
      endtask

      task READ();
      begin
      wr=0;
      rd=1;
     // data_in=$random;#10;
      end
      endtask

      initial
      begin
      WRITE();
      READ();
      end

      initial
      $monitor("clk=%d,rst=%d,data_in=%d,wr=%d,rd=%d,data_out=%d,empty=%d,full=%d,Time=%t",clk,rst,data_in,wr,rd,data_out,empty,full,$time);
      endmodule









