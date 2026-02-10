module ALU #(parameter IN=8)(
       input [$clog2(IN):0]a,b,
       input [$clog2(IN):0]opcode,
       output [IN-1:0]y
       );
//data flow
assign y=(opcode==3)?a/b:(opcode==2)?a*b:((opcode==3)?a+b:a-b);

endmodule

module ALU_tb #(parameter IN=8)(y,a,b,opcode);
    input [IN-1:0]y;
    output reg[$clog2(IN):0]a,b;
    output reg[$clog2(IN):0]opcode;

    initial
    begin
    a=10;b=5;opcode=2;#10;
    end

    initial
    $monitor("a=%d,b=%d,opcode=%d,y=%d,Time=%d",a,b,opcode,y,$time);
endmodule

module TOP #(parameter IN=2)();

     //internol signols
      wire [$clog2(IN):0]w1,w2;
      wire [$clog2(IN):0]w3;
      wire [IN-1:0]w4;
     
     //instantiation
     ALU A1(w1,w2,w3,w4);
     ALU_tb A2(w4,w1,w2,w3);

     defparam A1.IN=IN;
     defparam A2.IN=IN;

endmodule


