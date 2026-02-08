module FA_FH(
              input a,b,cin,
              output sum,carry
              );

assign sum=a^b^cin;
assign carry=a&b | b&cin | cin&a;

endmodule

module RCA_FH #(parameter WIDTH=32)(
                                    input [WIDTH-1:0]a,b,
                                    input cin,
                                    output [WIDTH-1:0]sum,
                                    output carry
                                   );
wire [WIDTH:0]c;
//generate block
genvar i;
assign c[0]=cin;
assign carry=c[WIDTH];
generate
     for(i=0;i<WIDTH;i=i+1)
         FA_FH F1(a[i],b[i],c[i],sum[i],c[i+1]);
endgenerate

endmodule

//testbench
module RCA_FH_tb();
    parameter WIDTH=32;
    reg [WIDTH-1:0]a,b;
    reg cin;
    wire [WIDTH-1:0]sum;
    wire carry;
    integer file1,file2;
    //instantiation
    RCA_FH RH(a,b,cin,sum,carry);

    initial
    begin
    file1=$fopen("input.txt");
    file2=$fopen("output.txt");
   
    repeat(10)
    begin
    a=$urandom_range(0,100);b=$urandom_range(0,100);cin=$random;
    
    $fdisplay(file1,"a=[%0d] b=[%0d] cin=[%0d]",a,b,cin);#1;
    $fdisplay(file2,"sum=[%0d] carry=[%0d] Time=[%0t]",sum,carry,$time);
#10;
    end

  
    $fclose(file1);
    $fclose(file2);
    end
    endmodule




