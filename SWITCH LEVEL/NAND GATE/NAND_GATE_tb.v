module nand_gate_tb();
     reg tb_a, tb_b;
     wire tb_y;

     //INSTANSATION

     nand_gate GATE(
                  .a(tb_a),
                  .b(tb_b),
                  .y(tb_y)
);
     initial begin
           tb_a=0; tb_b=0; #10;
           tb_a=0; tb_b=1; #10;
           tb_a=1; tb_b=0; #10;
           tb_a=1; tb_b=1; #10;
     end
     initial 
           $monitor("tb_a=%b tb_b=%b tb_y=%b Time=%t",tb_a,tb_b,tb_y,$time);
endmodule
