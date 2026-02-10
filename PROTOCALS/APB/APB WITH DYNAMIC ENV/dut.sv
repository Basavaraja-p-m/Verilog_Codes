`include "apb_master.sv"
`include "apb_slave.sv"

module top(
              input       PCLK,
              input       PRESETn,
              input       transfer,
              input       write_en,
              input [31:0]waddr,
              input [31:0]wdata,
              input  [3:0]strb,
              input  [2:0]prot,
              input       pnse,
                     
              output        error,
              output  [31:0]rdata,
              output        PSELx,
              output        PENABLE,
              output  [31:0]PADDR,
              output        PWRITE,
              output  [31:0]PWDATA,
              output   [3:0]PSTRB,
              output  [31:0]PRDATA,
              output        PREADY,
              output        PSLVERR,
              output   [2:0]PPROT,
              output        PNSE
           );

apb_master MASTER(
                 .PCLK(PCLK),
                 .PRESETn(PRESETn),
                 .transfer(transfer),
                 .write_en(write_en),
                 .waddr(waddr),
                 .wdata(wdata),
                 .strb(strb),
                 .rdata(rdata),
                 .error(error),
                 .prot(prot),
                 .pnse(pnse),
                 .PSELx(PSELx),
                 .PENABLE(PENABLE),
                 .PADDR(PADDR),
                 .PWRITE(PWRITE),
                 .PWDATA(PWDATA),
                 .PSTRB(PSTRB),
                 .PRDATA(PRDATA),
                 .PREADY(PREADY),
                 .PSLVERR(PSLVERR),
                 .PPROT(PPROT),
                 .PNSE(PNSE)
                 );

apb_slave SLAVE(
                 .PCLK(PCLK),
                 .PRESETn(PRESETn),
                 .PSELx(PSELx),
                 .PENABLE(PENABLE),
                 .PADDR(PADDR),
                 .PWRITE(PWRITE),
                 .PWDATA(PWDATA),
                 .PSTRB(PSTRB),
                 .PRDATA(PRDATA),
                 .PREADY(PREADY),
                 .PSLVERR(PSLVERR),
                 .PPROT(PPROT),
                 .PNSE(PNSE)
                );

endmodule



