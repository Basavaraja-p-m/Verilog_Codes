`include "FULL_ADDER1.v"
module RCS(
           input [3:0]a,b,
           input bin,
           output [3:0]diff,
           output bout
           );

       wire [2:0]w;
       //instantiation
       FULL_ADDER1 FS1(.a(a[0]),
                    .b(~b[0]),
                    .cin(bin),
                    .sum(diff[0]),
                    .carry(w[0])
                    );
       FULL_ADDER1 FS2(.a(a[1]),
                    .b(~b[1]),
                    .cin(w[0]),
                    .sum(diff[1]),
                    .carry(w[1])
                    );
       FULL_ADDER1 FS3(.a(a[2]),
                    .b(~b[2]),
                    .cin(w[1]),
                    .sum(diff[2]),
                    .carry(w[2])
                    );
       FULL_ADDER1 FS4(.a(a[3]),
                    .b(~b[3]),
                    .cin(w[2]),
                    .sum(diff[3]),
                    .carry(bout)
                    );
 endmodule
        
        //testbench
        module RCS_tb();
           reg [3:0]a,b;
           reg bin;
           wire [3:0]diff;
           wire bout;

           //instantiation
           RCS R1(a,b,bin,diff,bout);

           initial 
           repeat(5)
           begin
            a=$random % 16;b=$random % 16;bin=1;#10;
           end
           initial
           $monitor("a=%b b=%b bin=%b diff=%b bout=%b Time=%0d",a,b,bin,diff,bout,$time);
         endmodule

       

         

