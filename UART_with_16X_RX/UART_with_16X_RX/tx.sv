module uart_tx(
               input clk,
               input rst_n,
               input tx_start,
               input[7:0] tx_data,
               input baud_tick,
               output reg tx,
               output reg tx_busy
              );

typedef enum logic[1:0]{IDLE , START , DATA , STOP}states;
states state;

//Internal Reg
reg[7:0]shift_reg;
reg[2:0]bit_count;

always @(posedge clk or negedge rst_n)
begin
 if(!rst_n)
   begin
    shift_reg <= 0;
    bit_count <= 0;
    tx <= 1;
    tx_busy <= 0;
    state <= IDLE;
   end
 else
   begin
     case(state)
        IDLE    :   begin
                     tx <= 1;
                     tx_busy <= 0;
                     bit_count <= 0;
                     shift_reg <= 0;
                     if(tx_start)
                       begin
                         shift_reg <= tx_data;
                         tx_busy <= 1;
                         state <= START;
                       end
                    end

        START   :   begin
                      if(baud_tick)
                        begin
                          tx <= 0;    // Start Bit
                          state <= DATA;
                        end
                    end

        DATA    :   begin
                      if(baud_tick)
                        begin
                          tx <= shift_reg[0];
                          shift_reg <= shift_reg >> 1; // left shift if reg is defined as [0:7]
                          if(bit_count == 3'd7)
                             state <= STOP;
                          else
                              bit_count <= bit_count + 1;
                        end
                    end

        STOP    :   begin
                     if(baud_tick)
                       begin
                         tx <= 1;  //Stop Bit
                         state <= IDLE;
                       end
                    end
     endcase
   end
end

endmodule

