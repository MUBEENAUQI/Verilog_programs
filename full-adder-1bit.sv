//design
// Code your design here
module xor_gate(output l ,input m,n);
  assign l = m^n;
endmodule
module and_gate(output o ,input p,q);
  assign o = p&q;
endmodule
module or_gate(output r ,input s,t);
  assign r = s|t;
endmodule

module fulladder(a,b,ci,s,c);
  input a,b,ci;
  output s,c;
  wire T1,T2,T3;
  
  xor_gate X1(T1, a,b);
  xor_gate X2(T2, T1,ci);
  
  and_gate A2(T2, T1,ci);
  and_gate A1(T3, a,b);
  
  or_gate O1(c, T2,T3);
  
endmodule
  
  
  //testbench

module test;
  
  reg a,b,ci;
  wire s,c;
  
  fulladder name(.a(a), .b(b), .ci(ci), .s(s), .c(c));
  
  initial
    begin
      
      $dumpfile("abc.vcd")
      $dumbvars(1);
      $monitor("%d%d%d  %d,  %d",a,b,ci,s,c);
      #10 a=1'b0; b=1'b0; ci=1'b0;
      #10 a=1'b0; b=1'b0; ci=1'b1;
      #10 a=1'b0; b=1'b1; ci=1'b0;
      #10 a=1'b0; b=1'b1; ci=1'b1;
      #10 a=1'b1; b=1'b0; ci=1'b0;
      #10 a=1'b1; b=1'b0; ci=1'b1;
      #10 a=1'b1; b=1'b1; ci=1'b0;
      #10 a=1'b1; b=1'b1; ci=1'b1;
      #10 a=1'b0; b=1'b0; ci=1'b0;
      #10 a=1'b0; b=1'b0; ci=1'b1;
      #10 a=1'b0; b=1'b1; ci=1'b0;
      #10 a=1'b0; b=1'b1; ci=1'b1;
      #10 a=1'b1; b=1'b0; ci=1'b0;
      #10 a=1'b1; b=1'b0; ci=1'b1;
      #10 a=1'b1; b=1'b1; ci=1'b0;
      #10 a=1'b1; b=1'b1; ci=1'b1;
    end
endmodule
      
      
      
