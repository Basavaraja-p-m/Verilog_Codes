module PE(
          input [3:0]i,
          output reg [1:0]y
          );

always @(*)
begin
   casex(i)
   4'b0001 : y=2'b00;
   4'b001x : y=2'b01;
   4'b01xx : y=2'b10;
   4'b1xxx : y=2'b11;
   endcase
end
endmodule

module PE_tb();
   reg [3:0]i;
   wire [1:0]y;

   //instantiation
   PE P1(i,y);

   initial
   //repeat(10)
   begin
   i=4'b001x;#10;
   end

   initial
   $monitor("i=%d,y=%d,time=%t",i,y,$time);
   endmodule
