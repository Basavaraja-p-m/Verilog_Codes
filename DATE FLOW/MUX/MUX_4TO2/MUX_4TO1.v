module MUX_4TO1(
               input [3:0]i,
               input [1:0]s,
               output y
               );
      //date flow
      //assign y=~s[0]&~s[1]&i[0] | ~s[0]&s[1]&i[1] | s[0]&~s[1]&i[2] | s[0]&s[1]&i[3];
    // assign y=i[s];
     assign y=(s==3)?i[3]:(s==2)?i[2]:(s==1)?i[1]:i[0];
 endmodule
     
       //tetstbenchy
       module MUX_4TO1_tb();
           reg [3:0]i;
           reg [1:0]s;
           wire y;

           //instantiation
           MUX_4TO1 M1(i,s,y);
             
             initial 
             repeat(5)
             begin
              i=$random;s=$random;#10;
              end
              initial
              $monitor("i[0]=%b i[1]=%b i[2]=%b i[3]=%b s[1]=%b s[0]=%b y=%b Time=%t",i[0],i[1],i[2],i[3],s[1],s[0],y,$time);
          endmodule
          
       
