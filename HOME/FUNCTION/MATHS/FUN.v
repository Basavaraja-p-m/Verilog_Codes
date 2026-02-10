module FUN();
    reg add;
    reg sub;
    reg mul;

//function
function reg[15:0] addition(input [15:0]a,b);
      begin
      // reg [15:0]y;
       addition=a+b;
       $display("a=%d,b=%d,addition=%d,time=%t",a,b,addition,$time);
      end
endfunction

function reg[15:0] subtraction(input [15:0]a,b);
      begin
      //  reg [15:0]y;
        subtraction=a-b;   
        $display("a=%d,b=%d,subtraction=%d,time=%t",a,b,subtraction,$time);
        end
endfunction

function reg[15:0] multiply(input [15:0]a,b);
       begin
    //   reg[15:0]y;
       multiply=a*b;
       $display("a=%d,b=%d,multiply=%d,time=%t",a,b,multiply,$time);
       end
endfunction

initial
begin
add=addition(5,5);
sub=subtraction(10,5);
mul=multiply(2,3);
end
endmodule
          
