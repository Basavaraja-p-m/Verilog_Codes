class monitor;
     packet p3;
     virtual inter i;

     function new(virtual inter i);
     this.i=i;
     endfunction

     task mon();
     p3=new;
       forever begin
       @(posedge i.PCLK)

       if(i.PSELx && i.PENABLE && i.PREADY)
           begin
              //pin to packet
              p3.write_en <= i.PWRITE;
              p3.addr   <= i.PADDR;
              p3.strb   <= i.PSTRB;
              p3.prot   <= i.PPROT;
              p3.pnse   <= i.PNSE;

             if(!i.PWRITE)
                 p3.rdata <= i.RDATA;
                 else
                     p3.wdata <= i.WDATA;

             p3.display("==========================FROM MONITOR======================= ");
           end
        end
       endtask

endclass
              



     
