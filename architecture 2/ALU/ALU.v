module ALU(a,b,opcode,y);
     parameter op=8;
     input [$clog2(op):0]a,b;
     input [$clog2(op)-1:0]opcode;
     output [op-1:0]y;

     //data flow
     assign y=(opcode==7)?{a,b}:(opcode==6)?&a:(opcode==5)?a&b:(opcode==4)?a&&b:(opcode==3)?a/b:(opcode==2)?a*b:((opcode==1)?a-b:a+b);

endmodule

    module ALU_tb(y,a,b,opcode);
        parameter op=8;
        input [op-1:0]y;
        output reg [$clog2(op):0]a,b;
        output reg [$clog2(op)-1:0]opcode;
        integer x;
        initial 
        begin
        a=$random; b=$random;
        for(x=0;x<=7;x=x+1)
            begin
            opcode=x;#10;
            end
        end 
        initial
        $monitor("a=%b b=%b opcode=%b y=%b Time=%t",a,b,opcode,y,$time);
        endmodule


     //top module
     module TOP();
        parameter op=8;
        
        wire [$clog2(op):0]w1,w2;
        wire [$clog2(op)-1:0]w3;
        wire [op-1:0]w4;

        //instantiation
        ALU A1(w1,w2,w3,w4);
        ALU_tb A2(w4,w1,w2,w3);

      //  defparam A1.op=op;
      //  defparam A2.op=op;

 endmodule







