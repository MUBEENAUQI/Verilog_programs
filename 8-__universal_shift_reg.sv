//design - error indu - not solved
module uni_shift_reg(
  input clk,      //clock pulse
  input rst,        //reset pulse
  input [1:0]s,      //condition bit for function
  input [3:0]din,    //input data
  input sin,          //shifting bit
  output reg [3:0]q);  //output data
  
  always @ (posedge clk, posedge rst)
    begin
      if(rst)
        q <= 4'b0000;
      else
        case(s)
          2'b01:
            q <= {sin,[3:1]din} ;
          2'b10:
            q <= {[2:0]din, sin};
          2'b11:
            q <= din;
          default:
            q <= q ;
        endcase
    end
endmodule

//testbench

module test;
  
  reg clk;      //clock pulse
  reg rst;        //reset pulse
  reg [1:0]s;      //condition bit for function
  reg [3:0]din;    //input data
  reg sin;         //shifting bit
  wire [3:0]q;
  
  uni_shift_reg dut( clk, rst, s, din, sin, q);
  
  initial 
    begin
      clk=0;
      forever #5 clk = ~ clk;
    end
  
  initial 
    begin
    #20 s=00;
    #15 s=01;
      
    #20 s=10
    #15 s=11;
    end
  
 initial
    begin
      
      $dumpfile("mux.vcd"); //used to dump the waveforms
      $dumpvars(1);
      $monitor($time, " %d %d %d %d %d %d",clk, rst, s, din, sin, q);
    end
endmodule

  
