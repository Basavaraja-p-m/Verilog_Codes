module MUX_8TO2(
                input [7:0]i,
                input [2:0]s,
                output y
                );
      //dataflow
      assign y=i[s];
 endmodule
      //testbench
      module MUX_8TO2_tb();
          reg [7:0]i;
          reg [2:0]s;
          wire y;

          //instantiation
          MUX_8TO2 M8(i,s,y);

          initial
          repeat(8)
          begin
          i=$random;s=$random;#10;
          end
          initial 
          $monitor("i=%b s=%b y=%b Time=%t",i,s,y,$time);
          endmodule


          
