// testbench.sv

module dl_tb();
  //input clk;
  //output q;
  reg d,rstn,en;
  wire q;
  
  DLatch dut(.d(d), .rstn(rstn),.en(en), .q(q));
  
  initial
    begin
      $dumpfile("dabcd.vcd");
    $dumpvars(1);
    $monitor($time, " %b",q);
      #100 $finish;
  end

  
  initial 
    begin
      d=1;
      en=1;
      rstn=0;
  end    
      
     always #10 d=~d;
     always #5 en=~en;
     always #20 rstn=~rstn;
     
       
  
  
endmodule

//desig.sv

module DLatch(d,rstn,en,q);
  
  input d;
  
  input rstn,en;
  output reg q;
  
  always @(rstn or en or d)
  
    begin
      if(!rstn)
      q<=0;
      else begin
        if(en)
          q<=d;
      end
   end
  
  
endmodule
