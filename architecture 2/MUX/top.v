`include "mux.v"
`include "mux_tb.v"

module top();

  parameter IN=4;
  wire [IN-1:0]w_i;
  wire [$clog2(IN):0]w_s;
  wire w_y;

  mux M1(.i(w_i),
         .s(w_s),
         .y(w_y)
         );
  mux_tb M2(.tb_i(w_i),
            .tb_s(w_s),
            .tb_y(w_y)
            );

endmodule
