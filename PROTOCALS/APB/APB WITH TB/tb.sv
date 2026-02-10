`include "top.sv"
module tb();
    
    reg PCLK=0;
    always #5 PCLK=~PCLK;

              reg       PRESETn;
              reg       transfer;
              reg       write_en;
              reg [31:0]waddr;
              reg [31:0]wdata;
              reg  [3:0]strb;
              reg  [2:0]prot;
              reg       pnse;
              
              wire       error;
              wire [31:0]rdata;
              wire       PSELx;
              wire       PENABLE;
              wire [31:0]PADDR;
              wire       PWRITE;
              wire [31:0]PWDATA;
              wire  [3:0]PSTRB;
              wire [31:0]PRDATA;
              wire       PREADY;
              wire       PSLVERR;
              wire  [2:0]PPROT;
              wire       PNSE;

top TOP(.*);

initial
begin
    //reset
    PRESETn = 0;
    repeat(3) @(posedge PCLK);
    PRESETn =1;
end

    task write(input bit w,input[31:0]a,input[31:0]d,input[3:0]s,input[2:0]p=3'b000,input pn=0);
        write_en = w;
        waddr = a;
        wdata = d;
        strb = s;
        prot = p;
        pnse = pn;
        transfer = 1;
        @(posedge PCLK);
        transfer = 0;
        repeat(3) @(posedge PCLK);
        $display("WRITE:addr=%0h data=%h strb=%b prot=%b pnse=%b",waddr,wdata,strb,prot,pnse);
        protection();
        $display("-----------------------------------------------------------------------------");
     endtask

     task read(input bit w,input[31:0]a,input[2:0]p=3'b010,input pn=0);
        write_en = w;
        waddr = a;
        transfer = 1;
        prot = p;
        pnse = pn;
        @(posedge PCLK);
        transfer = 0;
        repeat(4) @(posedge PCLK);
        $display("READ[%0h] : %h error=%d pprot=%b pnse=%b",waddr,rdata,error,prot,pnse);
        protection();
        $display("------------------------------------------------------------------------------");
     endtask

     task protection;
         begin
         if(PPROT[0])
             $display("PREVILIGED  ACCESS");
             else
                 $display("NORMAL  ACCESS");

         if(PPROT[1] && !PNSE)
             $display("NON-SECURE  ACCESS");
             else
                 $display("SECURE  ACCESS");

         if(PPROT[2])
             $display("INSTRUCTION  ACCESS");
             else
                 $display("DATA ACCESS");

         if(PPROT[1] && PNSE)
             $display("REALM  ACCESS");
             else
                 $display("ROOT ACCESS");
         end
      endtask



     initial
     begin
     wait (PRESETn == 1)
        write(1,32'h0,32'hDEAD_BEEF,4'b1111);
        write(1,32'h4,32'hABCD_ABCD,4'b0101);
        write(1,32'h8,32'h1234_5678,4'b1010);

        read(0,32'h0,3'b111,1);
        read(0,32'h4,3'b101,0);
        read(0,32'h8);
    
#20 $finish;
    end

endmodule


        

 
/*    //write 0
    write_en = 1;
    waddr = 32'h0;
    wdata = 32'hDEAD_BEEF; 
    strb = 4'b1111;
    transfer = 1;
    @(posedge PCLK);
    transfer = 0;
    repeat(3) @(posedge PCLK);
    $display("WRITE:addr=%0h data=%h strb=%b",waddr,wdata,strb);

    //write 4
 //   write_en = 1;
    waddr = 32'h4;
    wdata = 32'hABCD_ABCD; 
    strb = 4'b0101;
    transfer = 1;
    @(posedge PCLK);
    transfer = 0;
    repeat(3) @(posedge PCLK);
    $display("WRITE:addr=%0h data=%h strb=%b",waddr,wdata,strb);

    //write 8
 //   write_en = 1;
    waddr = 32'h8;
    wdata = 32'h1234_5678; 
    strb = 4'b1010;
    transfer = 1;
    @(posedge PCLK);
    transfer = 0;
    repeat(3) @(posedge PCLK);
    $display("WRITE:addr=%0h data=%h strb=%b",waddr,wdata,strb);

    //read 0
    write_en = 0;
    waddr = 32'h0;
    transfer = 1;
    @(posedge PCLK);
    transfer = 0;
    repeat(4) @(posedge PCLK);
    $display("READ[%0h] : %h",waddr,PRDATA);

    //read 4
 //   write_en = 0;
    waddr = 32'h4;
    transfer = 1;
    @(posedge PCLK);
    transfer = 0;
    repeat(4) @(posedge PCLK);
    $display("READ[%0h] : %h",waddr,rdata);

    //read 8
  //  write_en = 0;
    waddr = 32'h8;
    transfer = 1;
    @(posedge PCLK);
    transfer = 0;
    repeat(4) @(posedge PCLK);
    $display("READ[%0h] : %h",waddr,rdata);

#20 $finish;
 
end
endmodule   */
