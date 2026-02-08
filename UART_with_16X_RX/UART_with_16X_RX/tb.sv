`include"top.sv"

module tb;

reg clk = 0, rst_n = 0;
reg tx_start;
reg [7:0] tx_data;
wire tx;
wire tx_busy;
wire [7:0] rx_data;
wire rx_valid;

top TOP(.*);

always #10 clk = ~clk;   // 50 MH

integer timeout;

initial
 begin
  rst_n = 0;
  tx_start = 0;
  tx_data = 0;
  #100 rst_n = 1;

  repeat(11)
   begin

    // wait until TX idle
    wait (tx_busy == 0);

    @(posedge clk);
    tx_data  =$random;
    tx_start = 1;
    @(posedge clk);
    tx_start = 0;

    // wait for rx_valid EDGE (not level)
    while (rx_valid)
      @(posedge clk);

    timeout = 0;

    while (!rx_valid && timeout < 200000)
     begin
      @(posedge clk);
      timeout = timeout + 1;
     end

    if (timeout == 200000)
      $display("TIMEOUT");
    else if (tx_data === rx_data)
      $display("PASS : TX=%d RX=%d", tx_data, rx_data);
    else
      $display("FAIL : TX=%d RX=%d", tx_data, rx_data);
  end

  $finish;
end

endmodule

