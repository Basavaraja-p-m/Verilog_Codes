module apb_master(
                  input PCLK,
                  input PRESETn,

                  //CPU DRIVEN SIGNOLS
                  input           transfer,
                  input           write_en,
                  input     [31:0]waddr,
                  input     [31:0]wdata,
                  output reg[31:0]rdata,
                  output reg      error,
                  input      [3:0]strb,
                  input      [2:0]prot,
                  input           pnse,

                  //APB MASTER DRIVEN SIGNOLS
                  output reg      PSELx,
                  output reg      PENABLE,
                  output reg[31:0]PADDR,
                  output reg      PWRITE,
                  output reg[31:0]PWDATA,
                  output reg [3:0]PSTRB,
                  output reg [2:0]PPROT,
                  output reg      PNSE,

                  //APB SLAVE DRIVEN SIGNOLS
                  input [31:0]PRDATA,
                  input       PREADY,
                  input       PSLVERR
                  );

typedef enum logic[2:0]{IDLE, SETUP, ACCESS}states;
states cs,ns;

reg access_hold;

//current state
always @(posedge PCLK or negedge PRESETn)
begin
if(!PRESETn)
    cs <= IDLE;
    else
        cs <= ns;
end

//next state
always @(*)
begin
   ns = cs;
   case(cs)
   IDLE    :    if(transfer) ns=SETUP;
   SETUP   :    ns = ACCESS;
   ACCESS  :    if(PREADY && access_hold)
                      ns <= IDLE;
                else
                      ns <= ACCESS;
   default :    ns <= IDLE;
   endcase
end

//fsm logic
always @(posedge PCLK or negedge PRESETn)
begin
if(!PRESETn)
    begin
    PSELx   <= 0;
    PENABLE <= 0;
    PWRITE  <= 0;
    PADDR   <= 0;
    PWDATA  <= 0;
    PSTRB   <= 0;
    rdata   <= 0;
    end
    else
        begin
           case(cs)
           IDLE : begin
                    PSELx    <= 0;
                    PENABLE <= 0;
                    access_hold <= 0;
                  end
           SETUP : begin
                     PSELx    <= 1;
                     PENABLE <= 0;
                     PADDR <= waddr;
                     PWDATA <= wdata;
                     PWRITE <= write_en;
                     PSTRB <= write_en ? strb : 4'b0000;
                     PPROT <= prot;
                     PNSE  <= pnse;
                   end
           ACCESS : begin
                      PSELx   <= 1;
                      PENABLE <= 1;
                      error <= PSLVERR;
                      if(!access_hold)
                          begin
                             access_hold <= 1;
                             PWRITE <= PWRITE;
                          end
                      else
                          begin
                             PWRITE <= 0;
                             if(!PWRITE && !PSLVERR)
                                 rdata <= PRDATA;
                             else
                                 rdata <= 0;
                          end
                     end
            endcase
        end
end

endmodule






