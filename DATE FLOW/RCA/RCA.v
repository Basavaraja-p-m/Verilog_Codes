module RCA(
           input [3:0]da,db,
           input dcin,
           output [3:0]dsum,
           output dcarry
           );
         
         //dataflow
         assign {dcarry,dsum}=da+db+dcin;

 endmodule

 //testbench
 module RCA_tb();
    reg [3:0]da,db;
    reg dcin;
    wire [3:0]dsum;
    wire dcarry;

    //instantiation
    RCA R1(da,db,dcin,dsum,dcarry);

    initial
    begin
    da=4'b0010;db=4'b1100;dcin=1'b0;#10;
    end
    initial
    $monitor("da=%b db=%b dcin=%b dsum=%b dcarry=%b Time=%t",da,db,dcin,dsum,dcarry,$time);
    endmodule
