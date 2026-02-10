class packet;
   
          bit       transfer;
          bit       write_en;
     rand bit [31:0]waddr;
          bit [31:0]wdata;
     rand bit  [3:0]strb;
     rand bit  [2:0]prot;
     rand bit       pnse;

              
          bit        error;
          bit  [31:0]rdata;
          bit        PSELx;
          bit        PENABLE;
          bit  [31:0]PADDR;
          bit        PWRITE;
          bit  [31:0]PWDATA;
          bit   [3:0]PSTRB;
          bit  [31:0]PRDATA;
          bit        PREADY;
          bit        PSLVERR;
          bit   [2:0]PPROT;
          bit        PNSE;

    function void display(string name="");
        $display("transfer=%b write_en=%b waddr=%h wdata=%h strb=%b prot=%b pnse=%b",transfer,write_en,waddr,wdata,strb,prot,pnse);
        $display("error=%b rdata=%h",error,rdata);
        $display("PSELX=%b PENABLE=%b PADDR=%h PWRITE=%b PWDATA=%h PSTRB=%b",PSELx,PENABLE,PADDR,PWRITE,PWDATA,PSTRB);
        $display("PRDATA=%h PREADY=%b PSLVERR=%b",prdata,pready,pslverr);
    endfunction
   
endclass
