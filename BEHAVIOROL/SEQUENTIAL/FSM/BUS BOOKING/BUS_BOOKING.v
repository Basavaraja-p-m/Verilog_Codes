module BUS_BOOKING #(parameter ideal=0,open_app=1,location=2,filter=3,select_bus=4,select_seat=5,boarding=6,coupen=7,payment=8,done=9)(
       input clk,rst,
       input x,
       output y
       );
reg [3:0]cs,ns;
assign y=(cs==done)?1:0;

always @(posedge clk or negedge rst)
begin
if(!rst)
   // y<=0;
    cs<=0;
    else
        cs<=ns;
end

always @(*)
begin
     case(cs)
     ideal : if(x==1)
                ns<=open_app;
             else
                ns<=ideal;
     open_app : if(x==1)
                   ns<=location;
                else
                   ns<=open_app;
     location : if(x==1)
                   ns<=filter;
                else
                   ns<=location;
     filter : if(x==1)
                   ns<=select_bus;
              else
                   ns<=filter;
     select_bus : if(x==1)
                       ns<=select_seat;
                  else
                       ns<=select_bus;
     select_seat : if(x==1)
                       ns<=boarding;
                   else
                       ns<=select_seat;
     boarding : if(x==1)
                       ns<=coupen;
                   else
                       ns<=boarding;
     coupen : if(x==1)
                   ns<=payment;
              else
                   ns<=coupen;
     payment : if(x==1)
                   ns<=done;
               else
                   ns<=payment;
     done :  begin
             ns<=done;
             //y<=1;
             end
     endcase
end
endmodule
  
module tb();
    reg clk,rst;
    reg x;
    wire y;

    //instantiation
    BUS_BOOKING BB(clk,rst,x,y);

    initial
    clk=0;
    always #5 clk=~clk;

    initial
    begin
    rst=0;
#20;
    rst=1;
    end

    initial
    begin
    x=0;
#30;
    repeat(10)
    x=1;#10;
    end

  //  always @(y)
   // if(y==1)
    //    $display("TICKET BOOKED");

    always @(BB.cs)
    begin
        case(BB.cs)
        0 : $display("IDEAL");
        1 : $display("APP OPENED");
        2 : $display("CHOOSE LOCATION");
        3 : $display("SELECT FILTER");
        4 : $display("SELECT BUS");
        5 : $display("SELECT SEAT");
        6 : $display("CHOOSE BOARDING POINT");
        7 : $display("APPLY COUPEN");
        8 : $display("SELECT PAYMENT MODE");
        9 : $display("TICKET BOOKED");
        endcase
    end


    initial
    //wait(y==1)
   #120 $stop;

    initial
    $monitor("clk=%d,rst=%d,x=%d,y=%d,Time=%t",clk,rst,x,y,$time);
    endmodule


                    

