`include "RCA.V"
module RCA16_BIT(
                 input [15:0]a,b,
                 input cin,

                 output [15:0]s,
                 output cout
                 );

              //internol signols
              wire w1,w2,w3;
              
              //instantiation
              RCA RC1(.a(a[3:0]),
                      .b(b[3:0]),
                      .cin(cin),
                      .s(s[3:0]),
                      .cout(w1)
                      );
               RCA RC2(.a(a[7:4]),
                      .b(b[7:4]),
                      .cin(w1),
                      .s(s[7:4]),
                      .cout(w2)
                      );
                RCA RC3(.a(a[11:8]),
                      .b(b[11:8]),
                      .cin(w2),
                      .s(s[11:8]),
                      .cout(w3)
                      );
                 RCA RC4(.a(a[15:12]),
                      .b(b[15:12]),
                      .cin(w3),
                      .s(s[15:12]),
                      .cout(cout)
                      );
endmodule

          //testbench code
          module RCA16_BIT_tb();
              reg [15:0]tb_a,tb_b;
              reg tb_cin;

              wire [15:0]tb_s;
              wire tb_cout;

          // instantiation
           RCA16_BIT RCA6(.a(tb_a),
                          .b(tb_b),
                          .cin(tb_cin),
                          .s(tb_s),
                          .cout(tb_cout)
                          );
           initial begin
                 tb_a=15; tb_b=12; tb_cin=0; #10;
            end
            initial
               $monitor("tb_a=%b tb_b=%b tb_cin=%b tb_s=%b tb_cout=%b Time=%t", tb_a,tb_b,tb_cin,tb_s,tb_cout,$time);
             endmodule
            
                




