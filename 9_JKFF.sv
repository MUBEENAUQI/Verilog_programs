//design.sv
// Code your design here
module JK_FF(j,k,clk,q);
  
  input j;
  input k;
  input clk;
  output reg q;
  
  always @(posedge  clk)
  begin
    
  if(j==0 && k==0)
     q<=q;
  else if(j==0 && k==1)
     q <=0;
  else if (j==1 && k==0)
    q <=1;
  else
     q <=~q;
  end
  
endmodule

//testbench.sv
// Code your testbench here
// or browse Examples
module jkff_tb();
  //input clk;
  //output q;
  reg j,k,clk;
  wire q;
  
  JK_FF dut(.j(j), .k(k), .clk(clk),.q(q));
  
  initial
    begin
      $dumpfile("jabcd.vcd");
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
    #20 j=0; k=0;
    #20 j=0; k=1;
    #20 j=1; k=0;
    #20 j=1; k=1;
      #100 $finish;
  end
  
endmodule
          
