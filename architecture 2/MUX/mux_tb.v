module mux_tb#(parameter IN=4)(input wire tb_y,output reg [$clog2(IN)-1:0]tb_s ,[IN-1:0]tb_i);
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
    $monitor("tb_i=%b tb_s=%b tb_y=%b Time=%t",tb_i,tb_s,tb_y,$time);
    endmodule

