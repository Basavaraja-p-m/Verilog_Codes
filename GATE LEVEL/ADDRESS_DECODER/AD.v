module AD(
          input [31:0]add,
          output [3:0]slave
          );

      and a1(slave[0],~add[18],~add[17],add[16]);
      and a2(slave[1],~add[18],add[17],~add[16]);
      and a3(slave[2],~add[18],add[17],add[16]);
      and a4(slave[3],add[18],~add[17],~add[16]);
endmodule

      //testbench
      module AD_tb();
          reg [31:0]add;
          wire [3:0]slave;

          //instantiation
          AD a1(add,slave);
          initial 
          begin
          add[31:0]=0;add[16]=1;#10; //add[18:16]=1;
          add[31:0]=0;add[17]=1;#10; //add[18:16]=2;
          add[31:0]=0;add[16]=1;add[17]=1;#10;//add[18:16]=3;
          add[31:0]=0;add[18]=1;#10;//add[18:16]=4;
          end 
          initial
          $monitor("add=%b slave=%b Time=%0t",add,slave,$time);
        endmodule


