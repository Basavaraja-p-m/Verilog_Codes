module FIFO #(parameter WIDTH=8,DEPTH=8)(
            input clk,rst,
            input [WIDTH-1:0]data_in,
            input wr,rd,
            output reg[WIDTH-1:0]data_out,
            output empty,full
            );
//internol signols
reg [$clog2(WIDTH):0]wr_ptr;
reg [$clog2(WIDTH):0]rd_ptr;
integer i;
//memory allocation
reg [WIDTH-1:0] mem[DEPTH-1:0];
assign empty=(wr_ptr==rd_ptr);
assign full={!wr_ptr[$clog2(WIDTH)],wr_ptr[$clog2(WIDTH)-1:0]}==rd_ptr;

always @(posedge clk or negedge rst)
begin
 if(!rst)
     begin
     data_out<=0;
     wr_ptr<=0;
     rd_ptr<=0;
     for(i=0;i<DEPTH;i=i+1)
         mem[i]<=0;
     end
     else
         begin
         if(wr && !rd && !full)
            begin
            mem[wr_ptr]<=data_in;
            wr_ptr<=wr_ptr+1;
            end
         else if(!wr && rd && !empty)
             begin 
             data_out<=mem[rd_ptr];
             rd_ptr<=rd_ptr+1;
             end
         else if(wr && rd && !full && !empty)
             begin 
             mem[wr_ptr]<=data_in;
             wr_ptr<=wr_ptr+1;
             data_out<=mem[rd_ptr];
             rd_ptr<=rd_ptr+1;
             end
         end
end
endmodule

//testbench
module FIFO_tb #(parameter WIDTH=8,DEPTH=8)();
     reg clk,rst;
     reg [WIDTH-1:0]data_in;
     reg wr,rd;
     wire [WIDTH-1:0]data_out;
     wire empty,full;
     reg finish;
   
    //instantiation
    FIFO F1(.*);

    //defparam F1.WIDTH=WIDTH;
    //defparam F1.DEPTH=DEPTH;

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
           repeat(8)
           begin
         //  wr_ptr && !rd_ptr && !full 
           wr=1;
           rd=0;     
           data_in=$random;
           #10;           
           end
    endtask

    task READ();
           
           begin
           wr=0;
           rd=1; 
           
            //   finish=1;
           end              
    endtask

    task WR_RD();
          repeat(8)
          begin
          wr=1;
          rd=1;
         // if(wr)
          data_in=$random;
       //   else
       //   data_in=0;
          #10;
          end
       // finish=1;
         
    endtask

    initial
    begin
    wait(rst==1);
   // WRITE();
    //READ();
    WR_RD();
    end

    initial
    begin
   // wait(finish==1);
  #190 $stop;
    end

    initial
    $monitor("clk=%d rst=%d data_in=%d data_out=%d wr=%d rd=%d empty=%d full=%d Time=%t",clk,rst,data_in,data_out,wr,rd,empty,full,$time);
    endmodule

  



        


            

