module rom_4x8 (
    output reg [7:0] r2_o,r3_o,r4_o,r8_o
               );
    initial begin
        r2_o = 8'b00001111; 
        r3_o = 8'b10101010;
        r4_o = 8'b11001100;
        r8_o = 8'b11110000;
    end
endmodule

// 4:1 MUX
module mux4x1 (
    input [1:0]sel,
    input [7:0]i0,i1,i2,i3,
    output reg [7:0]y
               );
    always @(*) begin
        case(sel)
            2'b00: y = i0;
            2'b01: y = i1;
            2'b10: y = i2;
            2'b11: y = i3;
            default: y = 8'b0;
        endcase
    end
endmodule

// 8-bit PISO 
module piso_8bit (
    input clk,
    input rst,
    input load,
    input [7:0]pi,
    output reg so  
);
    reg [7:0]tmp;
    reg [2:0]count;
    always @(posedge clk or posedge rst) begin
        if (rst) begin
            tmp <= 8'd0;
            count <= 3'd0;
            so <= 1'b0;
        end else if (load) begin
            tmp <= pi;
            count <= 3'd0;
            so <= pi[7]; 
        end
        end
endmodule


module wom_8bit (
    input clk,
    input si,
    output reg [7:0] reg_out
);
    always @(posedge clk) begin
        reg_out <= {reg_out[6:0], si};
    end
endmodule

module top(
    input clk,
    input rst,
    input load,
    input [1:0] mux_sel,
    output [7:0] wom_out
           );
    wire [7:0] r2_o, r3_o, r4_o, r8_o;
    wire [7:0] mux_out;
    wire piso_so;


    //instantiation
    rom_4x8 R1(r2_o,r3_o,r4_o,r8_o);
    mux4x1 M1(sel,r2_o,r3_o,r4_o,r8_o,y);
    piso_8bit P1(clk,rst,load,y,so);
    wom_8bit W1(clk,s0,reg_out);

    endmodule
    
    module tb();
    reg clk;
    reg rst;
    reg load;
    wire [7:0] wom_out;

     //instanntiation
     top t1(clk,rst,load,wom_out);


    initial
    clk=0;
    always #10 clk=~clk;

    initial
    begin
    rst=0;
#20 rst=1;
    end

    initial
    repeat(20)
    begin
    load=1;
#40;
    load=0;
    end

    initial
    $monitor("clk=%b,rst=%b,load=%b,wom_out=%b,Time=%t",clk,rst,load,wom_out,$time);
    endmodule
           
        
