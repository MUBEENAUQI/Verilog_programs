//design.sv
// Code your design here
module DFF(d,clk,q);
  
  input d;
  //input k
  input clk;
  output reg q;
  
  always @(posedge  clk)
  begin
   q<=d;

  end
  
endmodule

//testbench.sv
// Code your testbench here
// or browse Examples
module d_tb();
  //input clk;
  //output q;
  reg d,clk;
  wire q;
  
  DFF dut(.d(d), .clk(clk),.q(q));
  
  initial
    begin
      $dumpfile("dabcd.vcd");
    $dumpvars(1);
    $monitor($time, " %b",q);
  end
  
  initial 
    begin
      clk=0;
      forever #5 clk=~clk;
      
    end
  
  initial 
    begin
      d=0;
      repeat (10)
     #10 d=~d;
      #100 $finish;
  end
  
endmodule
          
