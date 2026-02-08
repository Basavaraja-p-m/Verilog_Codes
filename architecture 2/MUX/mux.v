module mux(i,s,y);
    parameter IN=4;
    input [IN-1:0]i;
    input [$clog2(IN)-1:0]s;
    output y;

   assign y=i[s];

endmodule

