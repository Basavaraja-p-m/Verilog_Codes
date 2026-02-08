module uart_rx #(
                 parameter integer CLK_FREQ = 50_000_000,
                 parameter integer BAUD     =115200
                )(
                  input clk,
                  input rst_n,
                  input rx,
                  output reg[7:0]rx_data,
                  output reg rx_valid,
                  output reg rx_error
                );

localparam integer SAMPLE_DIV = CLK_FREQ / (BAUD * 16);

// Synchronizer

reg ff1,ff2;
always @(posedge clk)
begin
 ff1 <= rx;
 ff2 <= ff1;
end
wire rx_sync = ff2;

//Sample tick
reg[$clog2(SAMPLE_DIV)-1:0]sample_tick_count;
wire sample_tick = (sample_tick_count == SAMPLE_DIV-1);

always @(posedge clk or negedge rst_n)
begin
if(!rst_n)
  sample_tick_count <= 0;
else if(sample_tick)
  sample_tick_count <= 0;
else
  sample_tick_count <= sample_tick_count + 1;
end

typedef enum logic[1:0]{IDLE , START , DATA , STOP}states;
states state;

//Internal Reg
reg[3:0]sample_count;
reg[2:0]bit_count;
reg[7:0]shift_reg;

// FSM

always @(posedge clk or negedge rst_n)
begin
 if(!rst_n)
   begin
    state <= IDLE;
    bit_count <= 0;
    sample_count <= 0;
    shift_reg <= 0;
    rx_valid <= 0;
    rx_error <= 0;
   end
 else
   if(sample_tick)
     begin
       rx_valid <= 0;
       rx_error <= 0;

       case(state)
          IDLE  :   begin
                      sample_count <= 0;
                      bit_count    <= 0;
                      if(rx_sync==0)      //Detecting Start
                         state <= START;
                    end

          START :   begin
                       sample_count <= sample_count + 1;
                       if(sample_count == 7)
                         begin
                           if(rx_sync == 0)
                             begin
                               sample_count <= 0;
                               state <= DATA;
                             end
                           else
                             state <= IDLE;
                         end
                    end

          DATA  :   begin
                      sample_count <= sample_count + 1;
                      if(sample_count == 15)
                        begin
                         shift_reg <= {rx_sync,shift_reg[7:1]};
                         sample_count <= 0;
                         if(bit_count == 7)
                           state <= STOP;
                         else 
                            bit_count <= bit_count + 1;
                        end
                    end

         STOP   :   begin
                      sample_count <= sample_count + 1;
                      if(sample_count == 15)
                         begin
                          if(rx_sync)        //Detecting stop
                             begin
                                rx_data  <= shift_reg;
                                rx_valid <= 1;
                             end
                           else
                             rx_error <= 1;

                         state    <= IDLE;
                         end
                    end
       endcase
     end
end

endmodule
