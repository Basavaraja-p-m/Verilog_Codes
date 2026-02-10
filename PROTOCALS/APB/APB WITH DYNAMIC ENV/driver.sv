class driver;
     packet p2;
     mailbox #(packet) g2d;
     virtual inter i; 

     function new(mailbox #(packet) g2d,virtual inter i);
     this.g2d=g2d;
     this.i=i;
     endfunction

//idle
     task reset();
         i.transfer <= 0;
         i.write_en <= 0;
         i.waddr <= 0;
         i.wdata <= 0;
         i.strb <= 0;
         i.pnse <= 0;
         @(posedge i.PCLK);
     endtask

//setup 
     task dri();
     //packet to pin
     i.transfer <= p2.transfer;
     i.write_en <= p2.write_en;
     i.waddr <= p2.waddr;
     i.wdata <= p2.wdata;
     i.strb <= p2.strb;
     i.pnse <= p2.pnse;
     i.transfer <= 1; //transfer started

     //access phase
     @(posedge i.PCLK)
     i.transfer <= 0;

     //wait for slave response
     wait(i.PENABLE && i.PREADY)
     
     //CAPTURE RESPONSE
       p2.error = i.PSLVERR;
       if(!p2.write && !p2.error)
           p2.rdata <= p2.PRDATA;
           
     endtask

     task driver();         
           p2=new;
           reset();
           forever begin
              dri();
           end
     endtask

endclass

