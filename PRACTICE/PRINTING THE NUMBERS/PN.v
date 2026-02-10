//PRINT THE ODD NUMBERS 
/*module PN();
    integer i;

   initial
   begin
   for(i=0;i<=20;i=i+1)
       if(i % 2 != 0)
           $display(i,"is odd number");
   end
endmodule*/

//PRINT THE NUMBERS
/*module PN();
    integer i;

    initial
    begin
    for(i=0;i<=10;i=i+1)
        $display(i);
    end
    endmodule
  */
 
//CHECK NUMBR IS EVEN OR ODD
 /*module PN();
     integer i=4;

     initial
     begin
     if(i % 2 == 0)
         $display("even number");
     else
         $display("odd number");
     end
  endmodule*/

//SWAP THE NUMBERS
/*module PN();
   integer a=1;
   integer b=2;
   reg temp;
   
   initial
   begin
     temp=a;
     a=b;
     b=temp;
   $display("a: is",a ,"b: is",b);
   end
   endmodule*/

  //FIND THE LARGEST NUMBER
 /* module PN();
    integer a=2;
    integer b=4;
    integer c=5;
    initial
    begin
    if(a>=b && a>=c)
        $display(a,"is largest number");
    else if(b>=a && b>=c)
        $display(b,"is largest number");
    else 
        $display(c,"is largest number");
    end
   endmodule*/

   //FACTORIAL OF A NUMBER
  /* module PN();
     integer i;
     integer result;

     initial
     begin
     result=1;
     for(i=1;i<=5;i=i+1)
        result=result * i;
     end
     initial
     $display("the factorial of a number 5 is",result);
     endmodule */

     //SUM OF NUMBERS
    /* module PN();
         integer i;
         integer sum;

         initial
         begin
         sum=0;
         for(i=0;i<=10;i=i+1)
             sum=sum + i;
         end
         initial
         $display("the sum of num 10 is",sum);
         endmodule*/

       //MULTIPLICATION TABLE
       /*module PN();
          integer n;
          integer i;

          initial
          begin
          n=5;
          for(i=1;i<=10;i=i+1)
          $display(n,"*",i,"=",n*i);
          end
          endmodule*/

       
          


