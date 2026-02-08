module EXAMPLE();
    reg add,sub,mul,div;

    //function 
    
    function reg[15:0] addition(input [15:0]a,b);
           begin
           addition=a+b;
           $display("a=%0d b=%0d addition=%0d Time=%0t",a,b,addition,$time);
           end
    endfunction
    function reg[15:0] subtraction(input [15:0]a,b);
           begin
           subtraction=a-b;
           $display("a=%0d b=%0d subtraction=%0d Time=%0t",a,b,subtraction,$time);
           end
    endfunction
    function reg[16:0] multiply(input [15:0]a,b);
           begin
           multiply=a*b;
           $display("a=%0d b=%0d multiply=%0d Time=%0t",a,b,multiply,$time);
           end
    endfunction
    function reg[16:0] division(input [15:0]a,b);
           begin
           division=a/b;
           $display("a=%0d b=%0d division=%0d Time=%0t",a,b,division,$time);
           end
    endfunction
initial
begin
add=addition(5,5);
sub=subtraction(25,10);
mul=multiply(5,5);
div=division(10,2);
end

endmodule
