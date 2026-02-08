module MUX_tb(
              output reg [1:0]i,
              output reg s,
              input y
              );

reg Out;

//generating the stimulus
task gen();
   begin
   {i,s}=$random;
   end
endtask

task bfm();
   begin
   Out=i[s];
   end
endtask

task sb();
   begin
     if(y==Out)
         begin
         $display("i=%b,s=%b,y=%b",i,s,y);
         $info("TEST PASSED");
       //  $warning("ok");
       //  $error("no");
      //   $fatal("yes");
         end
     else
         begin
         $display("i=%b,s=%b,y=%b",i,s,y);
         $info("TEST FAILED");
         end
   end
endtask

initial
repeat(10)
begin
gen();
bfm();#10;
sb();
end

endmodule

 

