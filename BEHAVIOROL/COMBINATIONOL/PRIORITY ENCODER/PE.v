module PE(
          input [3:0]i,
          output reg [1:0]y
          );

always @(*)
begin
        casez(i)
        4'b0001 : y<=2'b00;
        4'b001x : y<=2'b01;
        4'b01xx : y<=2'b10;
        4'b1xxx : y<=2'b11;
        endcase
end
endmodule

//testbench
module PE_tb();
   reg [3:0]i;
   wire [1:0]y;

   //instantiation
   PE P1(i,y);

   initial
   begin
   i=4'b01xx;
   end
   initial
   $monitor("i=%b y=%b Time=%t",i,y,$time);
   endmodule




