//this has testbench as 8 but design as 4.....hence it can be changed accroding to our convinience

//design.sv

module fulladder (a,b,cin,sum,cout);
  parameter s = 4;                    //4 is given as input
  input wire [s-1:0] a;
  input wire [s-1:0] b;
  input wire cin;
  
  output wire [s-1:0] sum;
  output wire cout;
  
  assign {cout,sum} = a+b+cin;
  
endmodule


//testbench.sv
module testbench;
  parameter s=8;
  reg [s-1:0] a;
  reg [s-1:0] b;
  reg cin;
  
  wire [s-1:0] sum;
  wire cout;
  fulladder #(.s(8)) dut(a,b,cin,sum,cout); //but it is automatically overridden....when 8 is given as input
  //fulladder #(.s(s)) dut(a,b,cin,sum,cout); //alternative
  initial
    begin
      $dumpfile("mux.vcd"); //used to dump the waveforms
      $dumpvars(1);
      $monitor("%d, %d, %d, %d,  %d",a,b,cin,sum,cout);
      a=8'b01011110; //7
      b=8'b00010111; //3
      cin = 1'b0;
      #10;
      
      a=8'b01111110; 
      b=8'b00011111; 
      cin = 1'b1;
      #10;
      
      
    end
endmodule

//output
 94,  23, 0, 117,  0
126,  31, 1, 158,  0
      
  
