module NOT_GATE_tb();
    reg  tb_a;
    wire tb_y;
  
    //instantiation  
      NOT_GATE GATE(.a(tb_a),
                   .y(tb_y)
);
     initial begin
        tb_a=0; #10;
        tb_a=1; #10;
     end
     initial
        $monitor("tb_a=%b tb_y=%b Time=%t",tb_a,tb_y,$time);
endmodule

       
