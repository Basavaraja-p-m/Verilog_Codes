//TX
module FIFO(
            input clk,rst,
            input rd,wr,
            input [7:0]data_in,
            output reg [7:0]data_out
            );
reg [7:0]mem;
always @(posedge clk or negedge rst)
begin
if(!rst)
    begin
    data_out<=0;
    mem<=0;
    end
    else
        if(wr && !rd)
            mem<=data_in;
        else
            data_out<=mem; 
end
endmodule

module PISO(
            input clk,rst,
            input mode,
            input [7:0]pi,
            output reg so
            );
reg [7:0]temp;
always @(posedge clk or negedge rst)
begin
if(!rst)
    begin
    so<=0;
    temp<=0;
    end
    else
        if(mode)
            temp<=pi;
            else
                begin
                so<=temp[0];
                temp[0]<=temp[1];
                temp[1]<=temp[2];
                temp[2]<=temp[3];
                temp[3]<=temp[4];
                temp[4]<=temp[5];
                temp[5]<=temp[6];
                temp[6]<=temp[7];
                temp[7]<=pi;
                //temp<={1'b0,temp[7:1]};
                end
end
endmodule

//RX
module SIPO(
            input clk,rst,
            input mode,
            input si,
            output reg [7:0]po
            );
reg [7:0]temp;

always @(posedge clk or negedge rst)
begin
if(!rst)
    begin
    po<=0;
    temp<=0;
    end
    else
        if(!mode)
            begin
            temp[7]<=si;
            temp[6]<=temp[7];
            temp[5]<=temp[6];
            temp[4]<=temp[5];
            temp[3]<=temp[4];
            temp[2]<=temp[3];
            temp[1]<=temp[2];
            temp[0]<=temp[1];
            end
            else
                po<=temp;
end
endmodule

module TX_RX(
             input clk,rst,mode,rd,wr,
             input [7:0]data_in,
             output [7:0]y
             );
wire [7:0]w1;
wire w2;
wire [7:0]w3;

//instantiation
FIFO F1(clk,rst,rd,wr,data_in,w1);
PISO P1(clk,rst,mode,w1,w2);
SIPO S1(clk,rst,mode,w2,w3);
FIFO F2(clk,rst,rd,wr,w3,y);

endmodule

module tb();
     reg clk,rst,mode,rd,wr;
     reg [7:0]data_in;
     wire [7:0]data_out;

     //instantitaion
     TX_RX T1(clk,rst,mode,rd,wr,data_in,data_out);

     initial
     clk=0;
     always #5 clk=~clk;

     initial
     begin
     rst=0;
#20; rst=1;
     end

     initial
     begin
     wait(rst==1)
     data_in=18;
     wr=1;rd=0;#20;
     wr=0;rd=1;#20;
     mode=1;#20;
     mode=0;#90;
     mode=1;#20;
     wr=1;rd=0;#20;
     wr=0;rd=1;#20;
     end

     initial
#350 $stop;

     initial
     $monitor("clk=%d,rst=%d,mode=%d,rd=%d,wr=%d,data_in=%d,data_out=%d,Time=%t",clk,rst,mode,rd,wr,data_in,data_out,$time);
     endmodule



            


