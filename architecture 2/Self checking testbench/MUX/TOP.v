`include "MUX.v"
`include "MUX_tb.v"

module TOP();

wire [1:0]w1;
wire w2,w3;

//connection between top and design
MUX dut(.i(w1),
        .s(w2),
        .y(w3)
        );

//connection between top and tb
MUX_tb tb(.i(w1),
          .s(w2),
          .y(w3)
          );

endmodule
