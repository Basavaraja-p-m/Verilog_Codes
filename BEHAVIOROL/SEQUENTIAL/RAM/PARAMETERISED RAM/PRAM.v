module PRAM #(parameter DEPTH=32 ,WIDTH=8)(
            input clk,rst,
            input [WIDTH-1:0]data_in,
            input [$clog2(DEPTH)-1:0]addr,
            input wr_rd,
            output reg[WIDTH-1:0]data_out
            );
integer i;
//memeory allocation
reg [WIDTH-1:0] mem[DEPTH-1:0];
always @(posedge clk or negedge rst)
begin
if(!rst)
    begin
    data_out<=0;
    for(i=0;i<DEPTH;i=i+1)
        mem[i]<=0;
    end
    else
        begin
        if(wr_rd)
            mem[addr]<=data_in;
        end
            data_out<=mem[addr];
end
endmodule

//testbench

module PRAM_tb #(parameter DEPTH=32,WIDTH=8)();
    reg clk,rst;
    reg [WIDTH-1:0]data_in;
    reg [$clog2(DEPTH)-1:0]addr;
    reg wr_rd;
    wire [WIDTH-1:0]data_out;
    integer i;
    reg finish;
 //instansiation
 PRAM P2(.*);

    defparam P2.DEPTH=DEPTH;
    defparam P2.WIDTH=WIDTH;

//CLOCK GENERATION
initial
clk=0;
always #5 clk=~clk;

//rset generarion
initial
begin
rst=0;
#20; rst=1;
end

task WRITE();
    begin
    wr_rd=1;
   // for(i=0;i<DEPTH;i=i+1)
        begin 
      // wait(rst==1);
        addr=12;
        data_in=$random;
        #10;
        end
    end
endtask

task READ();
    begin
    wr_rd=0;
    //for(i=0;i<DEPTH;i=i+1)
        begin
      // wait(rst==1);
        addr=12;
        //data_in=$random;
        #10;
        end
    finish=1;
    end
endtask

//task call
initial
begin
wait(rst==1);
WRITE();
READ();
end

//delay 
initial
begin
wait(finish==1);
$stop;
end

initial
$monitor("clk=%d rst=%d data_in=%d addr=%d wr_rd=%d data_out=%d Time=%t",clk,rst,data_in,addr,wr_rd,data_out,$time);
endmodule

