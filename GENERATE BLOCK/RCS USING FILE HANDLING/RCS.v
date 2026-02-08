module FA_FH(
              input a,b,cin,
              output sum,carry
              );

assign sum=a^b^cin;
assign carry=a&b | b&cin | cin&a;

endmodule

module RCS_FH #(parameter WIDTH=32)(
                                    input [WIDTH-1:0]a,b,
                                    input bin,
                                    output [WIDTH-1:0]diff,
                                    output barrow
                                   );
wire [WIDTH:0]c;
//generate block
genvar i;
assign c[0]=bin;
assign barrow=c[WIDTH];
generate
     for(i=0;i<WIDTH;i=i+1)
         FA_FH F1(a[i],~b[i],c[i],diff[i],c[i+1]);
endgenerate

endmodule

//testbench
module RCS_FH_tb();
    parameter WIDTH=32;
    reg [WIDTH-1:0]a,b;
    reg bin;
    wire [WIDTH-1:0]diff;
    wire barrow;
    integer file1,file2;
    //instantiation
    RCS_FH RH(a,b,bin,diff,barrow);

    initial
    begin
    file1=$fopen("input.txt");
    file2=$fopen("output.txt");
   
    repeat(10)
    begin
    a=$urandom_range(20,100);b=$urandom_range(0,20);bin=1;
    
    $fdisplay(file1,"a=[%0d] b=[%0d] bin=[%0d]",a,b,bin);#1;
    $fdisplay(file2,"diff=[%0d] barrow=[%0d] Time=[%0t]",diff,barrow,$time);
#10;
    end

  
    $fclose(file1);
    $fclose(file2);
    end
    endmodule



