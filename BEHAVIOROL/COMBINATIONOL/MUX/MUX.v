module MUX(
           input [3:0]i,
           input [1:0]s,
           output reg y
           );

    //behavioural model
    always @(i,s)
        begin
        if(s==0)
            y=i[0];
        else if(s==1)
            y=i[1];
        else if(s==2)
            y=i[2];
        else 
            y=i[3];
        end
 endmodule

 


