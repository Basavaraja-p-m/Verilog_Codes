interface inter(input PCLK,PRESETn);

              logic       PCLK,
              logic       PRESETn,
              logic       transfer,
              logic       write_en,
              logic [31:0]waddr,
              logic [31:0]wdata,
              logic  [3:0]strb,
              logic  [2:0]prot,
              logic       pnse,
                     
              logic        error,
              logic  [31:0]rdata,
              logic        PSELx,
              logic        PENABLE,
              logic  [31:0]PADDR,
              logic        PWRITE,
              logic  [31:0]PWDATA,
              logic   [3:0]PSTRB,
              logic  [31:0]PRDATA,
              logic        PREADY,
              logic        PSLVERR,
              logic   [2:0]PPROT,
              logic        PNSE
           
endinterface

