module UART(
            input START,
            input [7:0]DATA,
            input PARITY,
            input [1:0]STOP,
            output [11:0]FRAME
            );
function reg[11:0] frame(input START,input [7:0]DATA,input PARITY,input [1:0]STOP);
        // frame={START,DATA,PARITY,STOP};
        frame[11]=START;
        frame[10:3]=DATA;
        frame[2]=PARITY;
        frame[1:0]=STOP;
endfunction

always @(*)
FRAME=frame(START,DATA,PARITY,STOP);

endmodule

//taetsbnech
module UART_tb();
     reg START;
     reg [7:0]DATA;
     reg PARITY;
     reg [1:0]STOP;
     wire [11:0]FRAME;

     //instantiation
     UART U1(START,DATA,PARITY,STOP,FRAME);

     initial
     begin
     START=1;DATA=$random;PARITY=^DATA;STOP=0;#10;
     DATA=$random;PARITY=^DATA;#10;
     DATA=$random;PARITY=^DATA;#10;
     DATA=$random;PARITY=^DATA;#10;
     DATA=$random;PARITY=^DATA;#10;

     end
     initial
     $monitor("START=%B DATA=%B PARITY=%B STOP=%B TIME=%t",START,DATA,PARITY,STOP,$time);
     endmodule
         
