`include "full_adder.v"
 module RCA(
         input [3:0]a,b,
         input cin,
         output [3:0]s,
         output cout
         );
     //internal signols
     wire w1,w2,w3;

     //instantitaion
     full_adder FA1(.a(a[0]),
                    .b(b[0]),
                    .c(cin),
                    .sum(s[0]),
                    .carry(w1)
                    );
     full_adder FA2(.a(a[1]),
                    .b(b[1]),
                    .c(w1),
                    .sum(s[1]),
                    .carry(w2)
                    );
     full_adder FA3(.a(a[2]),
                    .b(b[2]),
                    .c(w2),
                    .sum(s[2]),
                    .carry(w3)
                    );
     full_adder FA4(.a(a[3]),
                    .b(b[3]),
                    .c(w3),
                    .sum(s[3]),
                    .carry(cout)
                    );
   endmodule


     // testbench code
     module RCA_tb();
         reg [3:0]tb_a,tb_b;
         reg tb_cin;
         wire [3:0]tb_s;
         wire tb_cout;

         //instantiation
         RCA GATE5(.a(tb_a),
                   .b(tb_b),
                   .cin(tb_cin),
                   .s(tb_s),
                   .cout(tb_cout)
                   );
          initial begin
                   tb_a=4'b1011;tb_b=4'b0100; tb_cin=0; #10;
           end
           initial
             $monitor("tb_a=%b tb_b=%b tb_cin=%b tb_s=%b tb_cout=%b Time=%0t", tb_a,tb_b,tb_cin,tb_s,tb_cout,$time);
        endmodule


 
