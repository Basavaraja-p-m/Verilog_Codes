`include "tb.sv"

module top();

     initial
     PCLK=0;
     always #5 PCLK=~PCLK;

     initial
         begin
         PRESETn=0;
    #20  PRESETn=1;
         end

inter i(.PCLK(PCLK),
        .PRESETn(PRESETn)
        );

dut DUT(
         .PCLK(i.PCLK),
         .PRESETn(i.PRESETn),
         .transfer(i.transfer),
         .write_en(i.write_en),
         .waddr(i.waddr),
         .wdata(i.wdata),
         .strb(i.strb),
         .rdata(i.rdata),
         .error(i.error),
         .prot(i.prot),
         .pnse(i.pnse),
         .PSELx(i.PSELx),
         .PENABLE(i.PENABLE),
         .PADDR(i.PADDR),
         .PWRITE(i.PWRITE),
         .PWDATA(i.PWDATA),
         .PSTRB(i.PSTRB),
         .PRDATA(i.PRDATA),
         .PREADY(i.PREADY),
         .PSLVERR(i.PSLVERR),
         .PPROT(i.PPROT),
         .PNSE(i.PNSE)
         );
tb TB(i); 

initial
#200 $finish

endmodule



      

