`include"baud_gen.sv"
`include"tx.sv"
`include"rx.sv"


module top(
            input clk,
            input rst_n,
            input tx_start,
            input [7:0] tx_data,
            output tx,
            output tx_busy,
            output [7:0] rx_data,
            output rx_valid
          );


baud_gen BG (
              .clk(clk),
              .rst_n(rst_n),
              .en(tx_busy),
              .baud_tick(w1)
            );

uart_tx TX (
            .clk(clk),
            .rst_n(rst_n),
            .tx_start(tx_start),
            .tx_data(tx_data),
            .baud_tick(w1),
            .tx(tx),
            .tx_busy(tx_busy)
           );

uart_rx RX (
                 .clk(clk),
                 .rst_n(rst_n),
                 .rx(tx),            // loopback or external RX pin
                 .rx_data(rx_data),
                 .rx_valid(rx_valid),
                 .rx_error(rx_error)
);

endmodule








