module UART(
            input START,
            input [7:0]DATA,
            input PARITY,
            input [1:0]STOP,
            output [11:0]FRAME
            );

assign FRAME={START,DATA,PARITY,STOP};

/*
always @(*)
begin
     FRAME[11]<=START;
     FRAME[10:3]<=DATA;
     FRAME[2]<=PARITY;
     FRAME[1:0]<=STOP;
end
*/
endmodule

//testbench
module UART_tb();
    reg START;
    reg [7:0]DATA;
    reg PARITY;  
    reg [1:0]STOP;
    wire [11:0]FRAME;

    //instantiation
    UART U1(START,DATA,PARITY,STOP,FRAME);

   initial
   repeat(10)
   begin
   START=1;DATA=$random;PARITY=^DATA;STOP=0;#10;
   end
   initial
   $monitor("START=%b DATA=%b PARITY=%b STOP=%b FRAME=%b Time=%t",START,DATA,PARITY,STOP,FRAME,$time);
   endmodule
