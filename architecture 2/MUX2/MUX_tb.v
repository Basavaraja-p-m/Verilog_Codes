module MUX_tb(tb_y,tb_s,tb_i);
    parameter IN=8;
    input tb_y;
    output reg [$clog2(IN)-1:0]tb_s;
    output reg [IN-1:0]tb_i;

    integer x;
    initial
    begin
     tb_i=$random;
     for(x=0;x<IN;x=x+1)
         begin
         tb_s=x;#10;
         end
     end
     initial
     $monitor("i=%b s=%b y=%b Time=%t",tb_i,tb_s,tb_y,$time);
     endmodule
