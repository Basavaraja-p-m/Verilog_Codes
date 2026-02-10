module PISO(
            input clk,rst,mode,
            input [9:0]pin,
            output reg sout
            );
reg [9:0]temp;
//reg [3:0]count;
always @(posedge clk or negedge rst)
begin
if(!rst)
    begin
    temp<=0;
    sout<=0;
  //  count<=0;
    end
    else
        if(!mode)
            begin
            temp<=pin;
         //   count<=0;
            end
        else
         //   if(mode==1 && count<10)
            begin
            sout<=temp[0];
            temp<={1'b0, temp[9:1]};  // shift right
           //   sout <= temp[9];           // send MSB first
           //   temp <= {temp[8:0], 1'b0}; 
           //    count<=count + 1; 
            end
     //   else
       //     if(count == 10)
        //    sout<=sout;
end
endmodule


