/*module SNIPPET();
  reg [3:0]a;
  initial begin
   $display("a=%d",a);
   $strobe("a=%d",a);
   a=5;
   a=7;
   #10
   a<=5;
   $display("a=%d",a);
   a=9;
   $display("a=%d",a);
   $monitor("a=%d",a);
   end
endmodule*/

/*module SNIPPET();
  reg a,b;
  initial begin
    a=0;
    b=0;
    a=1;
    $display("a=%d b=%d",a,b);
    #0 b=1;
    #0 a=0;
    $display("a=%d b=%d",a,b);
    a<=1;
    b<=0;
    $strobe("a=%d b=%d",a,b);
    $monitor("a=%d b=%d",a,b);
    end
 endmodule*/

/*module SNIPPET();
  reg [3:0] a, b;

  initial begin
    a = 1; b = 2;
    $monitor("t=%0t a=%0d b=%0d", $time, a, b);

    a = b;       // blocking → a=2 immediately
    b <= a + 1;  // non-blocking → b update scheduled
    $display("After assign: a=%0d b=%0d", a, b);

    #1; // wait for non-blocking
    $display("After #1: a=%0d b=%0d", a, b);
  end
endmodule*/


 
/*module SNIPPET();
  reg [3:0] a, b, c;

  initial begin
    a = 1; b = 2; c = 3;

    $monitor("t=%0t MONITOR: a=%0d b=%0d c=%0d", $time, a, b, c);
    a = b;      
    b <= c;       
    c = a + 1;  
    $display("t=%0t DISPLAY: a=%0d b=%0d c=%0d", $time, a, b, c);
    $strobe ("t=%0t STROBE : a=%0d b=%0d c=%0d", $time, a, b, c);

    #1;
    $display("t=%0t DISPLAY after #1: a=%0d b=%0d c=%0d", $time, a, b, c);
  end
endmodule*/

/*module SNIPPET();
  reg [3:0] a, b, c;

  initial begin
    a = 5; b = 10; c = 15;

    $monitor("t=%0t MONITOR: a=%0d b=%0d c=%0d", $time, a, b, c);

    b <= a;       
    a = c;         
    c <= b + 1;    

    $display("t=%0t DISPLAY: a=%0d b=%0d c=%0d", $time, a, b, c);
    $strobe ("t=%0t STROBE : a=%0d b=%0d c=%0d", $time, a, b, c);

    #1;
    $display("t=%0t DISPLAY after #1: a=%0d b=%0d c=%0d", $time, a, b, c);
  end
endmodule*/

module SNIPPET();
  reg [3:0]a;
  initial begin
   $display("a=%d",a);
   $strobe("a=%d",a);
   a=5;
   a=7;
   #10
   a<=5;
   $display("a=%d",a);
   a=9;
   $display("a=%d",a);
   $monitor("a=%d",a);
   end
endmodule




    
