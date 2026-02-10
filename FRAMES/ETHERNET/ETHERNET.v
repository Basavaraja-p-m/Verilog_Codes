module ETHERNET(
                input [55:0]preamble,
                input [7:0]sfd,
                input [39:0]sa,
                input [39:0]da,
                input [15:0]type,
                input [365:0]payload,
                input [39:0]crc,
                output [567:0]frame
                );

assign frame={preamble,sfd,sa,da,type,payload,crc};
/*always @(*)
begin 
    frame[567:511]<=preamble;
    frame[510:502]<=sfd;
    frame[501:461]<=sa;
    frame[460:420]<=da;
    frame[419:403]<=type;
    frame[402:37]<=payload;
    frame[36:]<=crc*/

endmodule

//testbench
module ETHERNET_tb();
   reg [55:0]preamble;
   reg [7:0]sfd;
   reg [39:0]sa,da;
   reg [15:0]type;
   reg [365:0]payload;
   reg [39:0]crc;
   wire [567:0]frame;

   //instantiation
   ETHERNET E1(preamble,sfd,sa,da,type,payload,crc,frame);

   initial
   repeat(10)
   begin
   preamble=$random;sfd=8'b10101011;sa=$random;da=$random;type=$random;payload=$random;crc=$random;#10;
   end
   initial
   $monitor("preamble=%b sfd=%b sa=%b da=%b type=%b payloa%b crc=%b frame=%b Time=%t",preamble,sfd,sa,da,type,payload,crc,frame,$time);
   endmodule
                
