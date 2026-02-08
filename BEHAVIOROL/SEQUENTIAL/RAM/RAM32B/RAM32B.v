module RAM32B(
              input clk,rst,
              input [7:0]data_in,
              input [4:0]addr,
              input wr_rd,
              output reg[7:0]data_out
              );
//memory allocation
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
           if(wr_rd)
               mem[addr]<=data_in;
           else
               data_out<=mem[addr];
           end
end
endmodule
      
    
