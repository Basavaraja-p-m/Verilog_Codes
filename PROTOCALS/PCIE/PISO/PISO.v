module PISO(
            input clk,rst,mode,
            input [9:0]pin,
            output reg sout
            );
reg [9:0]temp;
always @(posedge clk or negedge rst)
begin
if(!rst)
    begin
    temp<=0;
    sout<=0;
    end
    else
        if(!mode)
            temp<=pin;
        else
            begin
            sout<=temp[0];
            temp[0]<=temp[1];
            temp[1]<=temp[2];
            temp[2]<=temp[3];
            temp[3]<=temp[4];
            temp[4]<=temp[5];
            temp[5]<=temp[6];
            temp[6]<=temp[7];
            temp[7]<=temp[8];
            temp[8]<=temp[9];
            temp[9]<=pin;
            end
end
endmodule



