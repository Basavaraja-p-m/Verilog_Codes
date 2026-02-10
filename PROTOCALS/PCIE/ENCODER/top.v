`include "encoder_8b10b.v"
`include "PISO.v"
`include "sipo.v"

 module top(
           input clk,rst,rd,k,mode,
           input [7:0]data_in,
           output [9:0]encoded_out,
           output [9:0]y
           );
// Internal signals
    wire [9:0] data_out;   // Output of encoder_8b10b
    wire sout; 
    wire [9:0] pin;
    wire sin;
    wire [9:0] pout;

//to see encoded output
 assign encoded_out = data_out;

//instantiation
encoder_8b10b e1( 
                 .data_in(data_in),
                 .rd(rd),
                 .k(k),
                 .data_out(data_out)
                 );
PISO p1(
        .clk(clk),
        .rst(rst),
        .mode(mode),
        .pin(data_out),
        .sout(sout)
        );
sipo s1(
        .clk(clk),
        .rst(rst),
        .sin(sout),
        .pout(y)
        );
endmodule

//testbench
module tb();
      reg clk,rst,rd,k,mode;
      reg [7:0]data_in;
      wire [9:0]encoded_out;
      wire [9:0]y;

      //instantiation
      top dut(clk,rst,rd,k,mode,data_in,encoded_out,y);

      initial
      clk=0;
      always #5 clk=~clk;

      initial
      begin
      rst=0;
#20;  rst=1;
      end

      initial
      begin
   //   rd=0;
   //   k=0;
      mode=0;
      data_in=0;
#25;
      data_in=8'h4c;
      mode=0;
      rd=0;
      k=0;      
#20;
      mode=1;#100;
      end
      
      initial
#150 $stop();
      
      initial
      $monitor("clk=%d rst=%d rd=%b k=%b mode=%d data_in=%h encoded_out=%b y=%b time=%0t",clk,rst,rd,k,mode,data_in,encoded_out,y,$time);
      endmodule









