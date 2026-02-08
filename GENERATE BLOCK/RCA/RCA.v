module FA(
          input a,b,cin,
          output sum,carry
          );

assign sum=a^b^cin;
assign carry=a&b | b&cin | cin&a ;

endmodule

module RCA #(parameter WIDTH=32)(
                                 input [WIDTH-1:0]a,b,
                                 input cin,
                                 output [WIDTH-1:0]sum,
                                 output carry
                                 );
//Internol signols
wire [WIDTH:0]c;

//generate block
genvar i;

assign c[0]=cin;
assign carry=c[WIDTH];
generate 
     for(i=0;i<WIDTH;i=i+1)
        FA F1(a[i],b[i],c[i],sum[i],c[i+1]);
endgenerate

endmodule

//testbench

module RCA_tb #(parameter WIDTH=32)();
 //   parameter WIDTH=32;
    reg [WIDTH-1:0]a,b;
    reg cin;
    wire [WIDTH-1:0]sum;
    wire carry;

    //instantiation
    RCA #(.WIDTH(32)) R1 (a,b,cin,sum,carry);

   // defparam R1.WIDTH=WIDTH; 

    initial
    begin
    a=$urandom_range(0,150);b=$urandom_range(0,150);cin=$random;
    end
    initial
    $monitor("a=%0d b=%0d cin=%0d sum=%0d carry=%0d time=%0d",a,b,cin,sum,carry,$time);
endmodule
      
