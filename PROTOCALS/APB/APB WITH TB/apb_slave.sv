module apb_slave(
                  input PCLK,
                  input PRESETn,

                  //APB MASTER DRIVEN SIGNOLS
                  input       PSELx,
                  input       PENABLE,
                  input [31:0]PADDR,
                  input       PWRITE,
                  input [31:0]PWDATA,
                  input [3:0] PSTRB,
                  input [2:0] PPROT,
                  input       PNSE,

                  //APB SLAVE DRIVEN SIGNOLS
                  output reg[31:0]PRDATA,
                  output          PREADY,
                  output reg      PSLVERR
                  );

reg [31:0]mem[0:15];
wire[3:0]addr_indx = PADDR[5:2];

assign PREADY = 1;

always @(posedge PCLK or PRESETn)
begin
if(!PRESETn)
    begin
     for(int i=0; i<16; i++)
         mem[i] = 0;
    end
    else
        begin
          if(PSELx && PENABLE && PWRITE && addr_indx < 16)
              begin
                if(PSTRB[0]) mem[addr_indx][7:0] <= PWDATA[7:0];
                if(PSTRB[1]) mem[addr_indx][15:8] <= PWDATA[15:8];
                if(PSTRB[2]) mem[addr_indx][23:16] <= PWDATA[23:16];
                if(PSTRB[3]) mem[addr_indx][31:24] <= PWDATA[31:24];
              end
        end
end

//read logic

always @(*)
begin
   if(PSELx && PENABLE && !PWRITE && addr_indx < 16)
       PRDATA = mem[addr_indx];
   else
       PRDATA = 0;
end

//ERROR LOGIC
always @(*)
begin 
   PSLVERR <= 0;
   if(PSELx && PENABLE && PREADY)
       begin
         if(PADDR[31:6] != 0)
             PSLVERR <= 1;
          else
             PSLVERR <= 0;
       end
   else
       PSLVERR <= 0;
end

always @(*)
begin
if(PSELx && PENABLE && PREADY)
    begin
    if(PNSE)
        PSLVERR <= 1;
    end
end


endmodule


