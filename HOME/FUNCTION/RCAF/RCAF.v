module RCAF(
            input [3:0]a,b,
            input cin,
            output reg[3:0]sum,
            output cout
            );
reg [1:0] res;
reg carry;
function reg[1:0] FA(input a,b,cin);
       reg carry;
       reg sum;
       begin
       carry=(a&b) | (b&cin) | (cin&a) ;
       sum=a^b^cin;
       FA={carry,sum};
       end
endfunction

always @(*)
begin
res=FA(a[0],b[0],cin);
sum[0]=res[0];
carry=res[1];

res=FA(a[1],b[1],carry);
sum[1]=res[0];
carry=res[1];

res=FA(a[2],b[2],carry);
sum[2]=res[0];
carry=res[1];

res=FA(a[3],b[3],carry);
sum[3]=res[0];
carry=res[1];

end
endmodule

module RCAF_tb();
    reg [3:0]a,b;
    reg cin;
    wire [3:0]sum;
    wire cout;

    //instantiation
    RCAF R1(a,b,cin,sum,cout);

    initial
    begin
    a=$random;b=$random;cin=1;#10;
    end
    
    initial
    $monitor("a=%d,b=%d,cin=%d,sum=%d,cout=%d,Time=%t",a,b,cin,sum,cout,$time);
    endmodule
    
