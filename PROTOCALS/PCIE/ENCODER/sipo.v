module sipo(
    input clk,
    input rst,
    input sin,
    output reg [9:0] pout
);
  //  reg [3:0]count;
    always @(posedge clk or negedge rst) begin
        if (!rst)
            begin
            pout<=0;
          //  count<=0;
            end
        else
        //    if(count<10)
            begin
            pout <= {sin, pout[9:1]};
          //  count<=count + 1;
            end
      //  else
         //   if(count == 10)
         //   pout<=0;
    end
endmodule

