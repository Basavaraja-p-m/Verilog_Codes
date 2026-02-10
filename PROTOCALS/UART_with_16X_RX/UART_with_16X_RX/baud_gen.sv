module baud_gen #(
                  parameter integer CLK_FREQ = 50_000_000,
                  parameter integer BAUD     = 115200
                  )(
                  input clk,
                  input rst_n,
                  input en,
                  output reg baud_tick
                  );

localparam integer BAUD_DIV = CLK_FREQ/BAUD;

reg[$clog2(BAUD_DIV)-1:0]baud_count;

always @(posedge clk or negedge rst_n)
 begin
  if(!rst_n)
   begin
    baud_count <= 0;
    baud_tick  <= 0;
   end
  else
   if(en)
    begin
     if(baud_count == BAUD_DIV-1)
        begin
          baud_count <= 0;
          baud_tick  <= 1;
        end
     else
       begin
         baud_count <= baud_count + 1;
         baud_tick  <= 0;
       end
    end
   else
    begin
     baud_count <= 0;
     baud_tick  <= 0;
    end
 end

 endmodule





