class gen;
     packet p1;
     mailbox #(packet) g2d,g2c;
     virtual inter i;
     int num;
     string op;

     function new(mailbox #(packet) g2d,g2c,virtual inter i,int num,string op);
        this.g2d=g2d;
        this.g2c=g2c;
        this.i=i;
        this.num=num;
        this.op=op;
     endfunction

    task write();
         p1.transfer = 1;
         p1.write_en = 1;
         p1.wdata = $random;
         assert(p1.randomize());       
         g2d.put(p1);
         g2c.put(p1);
         p1.display("=====================from generator========================");                  
    endtask
    
    task read();
         p1.write_en = 0;
         assert(p1.randomize());
         g2d.put(p1);
         g2c.put(p1);
         p1.display("=====================from generator=========================");
    endtask

    task gen();
       p1=new();
       wait(i.PRESETn==1)
       @(posedge i.PCLK)
           begin
           case(op)
           "write"  : begin
                        repeat(num)
                           begin
                           write();
                           end
                      end

            "read"  : begin
                        repeat(num)
                           begin
                           read();
                           end
                      end

            "wr_rd" : begin
                         repeat(num)
                            begin
                            write();
                            read();
                            end
                       end
           endcase
           end
     endtask  

endclass

    
