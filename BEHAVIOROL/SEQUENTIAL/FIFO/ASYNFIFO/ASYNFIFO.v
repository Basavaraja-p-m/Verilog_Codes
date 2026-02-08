module ASYNFIFO #(parameter DEPTH=8,WIDTH=8)(
        input wr_clk,rd_clk,rst,
        input [WIDTH-1:0]data_in,
        input wr,rd,
        output reg [WIDTH-1:0]data_out,
        output reg empty,full
        );
reg [$clog2(DEPTH)-1:0]wr_ptr_bin,rd_ptr_bin;
reg [$clog2(DEPTH)-1:0]wr_ptr_gray,rd_ptr_gray;
integer count;
//memory allocation
reg [WIDTH-1:0] mem[DEPTH-1:0];

always @(posedge wr_clk or negedge rst)
begin 
if(!rst)
    begin
    data_out<=0;
    wr_ptr_bin<=0;
    rd_ptr_gray<=0;
    count<=0;
    end
    else
        if(wr && !full)
            begin
            mem[wr_ptr_bin]<=data_in;
            wr_ptr_bin<=wr_ptr_bin + 1;
            wr_ptr_gray<=(wr_ptr_bin >> 1) ^ wr_ptr_bin;
            count = count + 1;
            end
 end
 always @(posedge rd_clk or negedge rst)
 begin
    if(!rst)
        begin
        data_out<=0;
        rd_ptr_bin<=0;
        wr_ptr_gray<=0;
        end
        else
            if(rd && !empty)
                begin
                data_out<=mem[rd_ptr_bin];
                rd_ptr_bin<=rd_ptr_bin + 1;
                rd_ptr_gray<=(rd_ptr_bin >> 1) ^ rd_ptr_bin;
                count<=count - 1;
                end
end

//syncronization

reg [$clog2(WIDTH)-1:0]wr_ptr_gray_syn1,wr_ptr_gray_syn2;
always @(posedge rd_clk or negedge rst)
begin
if(!rst)
    begin
    wr_ptr_gray_syn1<=0;
    wr_ptr_gray_syn2<=0;
    end
     else
         begin
         wr_ptr_gray_syn1<=wr_ptr_gray;
         wr_ptr_gray_syn2<=wr_ptr_gray_syn1;
         end
end

reg [$clog2(WIDTH)-1:0]rd_ptr_gray_syn1,rd_ptr_gray_syn2;
always @(posedge wr_clk or negedge rst)
begin
if(!rst)
    begin
    rd_ptr_gray_syn1<=0;
    rd_ptr_gray_syn2<=0;
    end
    else
       begin
       rd_ptr_gray_syn1<=rd_ptr_gray;//1ST FF
       rd_ptr_gray_syn2<=rd_ptr_gray_syn1;//2ND FF
       end
end

wire [$clog2(DEPTH)-1:0]wr_ptr_gray_nxt = ((wr_ptr_bin + 1) >> 1) ^ (wr_ptr_bin + 1);
always @(*)
begin
//full = (wr_ptr_gray_nxt == {~rd_ptr_gray_syn2[2], rd_ptr_gray_syn2[1:0]});
//empty = (rd_ptr_gray == wr_ptr_gray_syn2);
full = (count == DEPTH);
empty = (count == 0);
end

endmodule

module tb #(parameter DEPTH=8,WIDTH=8)();
  reg wr_clk,rd_clk,rst;
  reg [WIDTH-1:0]data_in;
  reg rd,wr;
  wire [WIDTH-1:0]data_out;
  wire empty,full;

integer i;
  //instantiation
  ASYNFIFO AF(.*);

  initial
  wr_clk=0;
  always #5 wr_clk=~wr_clk;

  initial
  rd_clk=0;
  always #7 rd_clk=~rd_clk;

  initial
  begin
  rst=0;
#20 rst=1;
  end

  task WRITE;
      begin
      wr=0;
      rd=0;
      data_in=0;
#20;
      wr=1;
      rd=0;
      for(i=0;i<=DEPTH;i=i+1)
          begin
          data_in=$random;
#10;
          end
      end
   endtask

  task READ;
       begin
       wr=0;
       data_in=0;
       rd=1;
       end
  endtask
  
  initial
  begin
  WRITE();
  READ();
  end

  initial
  #400 $stop();

  initial
  $monitor("wr_clk=%b,rd_clk=%b,rst=%b,wr=%b,rd=%b,data_in=%d,data_out=%d,empty=%b,full=%b,time=%0t",wr_clk,rd_clk,rst,wr,rd,data_in,data_out,empty,full,$time);

  endmodule



