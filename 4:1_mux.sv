//design.sv
module and_gate(output a, input b, c, k);
assign a = b & c & k;
endmodule

module not_gate(output d, input e);
assign d = ~ e;
endmodule

module or_gate(output p, input m, n, l, o);
assign p = m | n | l | o;
endmodule

module m21(Y, D0, D1, D2, D3, S0, S1);
  output Y;
  input D0, D1, D2, D3, S0, S1;
  wire T1, T2, T3, T4, W1, W0;

  not_gate n0(W0, S0);
  not_gate n1(W1, S1);
  
  and_gate a1( T1, W1, W0, D0);
  and_gate a2( T2, W1, S0, D1);
  and_gate a3( T3, S1, W0, D2);
  and_gate a4( T4, S1, S0, D3);
  
  or_gate or1(Y, T1, T2, T3, T4);
endmodule

//testbench.sv
module top;
  wire out;
  reg d0, d1, d2, d3, s0, s1;
  
  m21 name(.Y(out), .D0(d0), .D1(d1), .S0(s0), .D2(d2), .D3(d3), .S1(s1));
  
  initial
    begin
      $dumpfile("mux.vcd"); //used to dump the waveforms
      $dumpvars(1);
      d0=3'b000;
      d1=3'b000;
      d2=3'b000;
      d3=3'b000;
      s0=2'b00;
      s1=2'b00;
      #200 $finish;
      end
  always #60 d0=~d0;
  always #50 d1=~d1;
  always #40 d2=~d2;
  always #30 d3=~d3;
  always #20 s1=~s1;
  always #10 s0=~s0;
  always@(d0 or d1 or d2 or d3 or s0 or s1)
    $monitor("At time = %t, Output = %d", $time, out);
endmodule
