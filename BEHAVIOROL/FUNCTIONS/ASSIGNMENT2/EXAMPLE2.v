module EXAMPLE2();
     reg add;
     reg my;
     reg ey;
     reg cy;

   
   //function
   function reg[1:0] adder(input [16:0]a,b,input cin);
          //internol signol
          reg [16:0]sum;
          reg carry;
          begin
          sum=a^b^cin;
          carry=a&b|b&cin|cin&a;
          adder={carry,sum};
          $display("a=%0d b=%0d cin=%0d carry=%0d sum=%0d",a,b,cin,carry,sum);
          end
   endfunction
   function mux(input [3:0]i,input[1:0]s);
          begin
          mux=i[s];
          $display("i=%0b s=%0b mux=%0b",i,s,mux);
          end
   endfunction
   function reg[1:0] encoder(input [3:0]d);
          reg y;
          begin
          case (d)
           4'b0001 : encoder=2'b00;
           4'b0010 : encoder=2'b01;
           4'b0100 : encoder=2'b10;
           4'b1000 : encoder=2'b11;
           endcase
          $display("d=%0b encoder=%0b",d,encoder);
          
          end
    endfunction
    function reg[2:0] comparator(input [5:0]a,b);
          reg g,l,e;
          begin
          g=a>b;
          l=a<b;
          e=a==b;
          comparator={g,l,e};
          $display("a=%0b b=%0b g=%0b l=%0b e=%0b",a,b,g,l,e);
          end
    endfunction

    initial
    begin
    add=adder(1,1,1);
    my=mux(2,1);
    ey=encoder(4'b0010);
    cy=comparator(15,15);
    my=mux(3,0);
    add=adder(0,1,1);
    ey=encoder(4'b1000);
    cy=comparator(12,1);
    my=mux(1,0);
    my=mux(3,1);
    my=mux(0,1);
    add=adder(0,0,1);
    end
endmodule

        
