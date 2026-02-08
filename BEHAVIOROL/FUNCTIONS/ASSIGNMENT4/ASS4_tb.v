`include "RCAF.v"
`include "RCA.v"
module ASS4_tb();
  reg [3:0]a,b;
  reg cin;
  wire [3:0]sum;
  wire carry;

  reg [3:0]da,db;
  reg dcin;
  wire [3:0]dsum;
  wire dcarry;

  //instantiation of RCAF
  RCAF R1(a,b,cin,sum,carry);

  //instantiation of RCA
  RCA R2(da,db,dcin,dsum,dcarry);

  initial
  begin 
  a=4'b0011;b=4'b0001;cin=4'b1;
  da=4'b0011;db=4'b0001;dcin=4'b1;
  end
  initial
  begin
  $monitor("a=%b b=%b cin=%b sum=%b carry=%b",a,b,cin,sum,carry);
#10;
  $monitor("da=%b db=%b dcin=%b dsum=%b dcarry=%b",da,db,dcin,dsum,dcarry);
  end
  initial
  begin
#20;
  if(sum==dsum && carry==dcarry)
     $display("RCA IS MATCHED");
     else
         $display("RCA IS NOT MATCHED");
  end
  endmodule
