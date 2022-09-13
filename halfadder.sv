//test
// Code your testbench here
// or browse Examples

module halfAddertestbench;
  reg a,b;  //input - register
  wire s,c; // output - wire
  
  halfAdder uut(.a(a), .b(b), .c(c), .s(s)); //initiatzation
  
  //output checker
  initial //block executed only once
    begin //starting bracket
      
      $dumpfile("halfAdder.vcd"); //used to dump the waveforms
      $dumpvars(1);
      $monitor("%d,%d,%d,%d", a,b,s,c);
      a=0; b=0;#10;
      a=0; b=1; #10;
      a=1; b=0; #10;
      a=1; b=1; #10;
      
      
    end
endmodule

//design

// Code your design here
module halfAdder(a,b,s,c);
  input a,b;
  output s,c;
  
  //data flow style
 // assign s = a^b; // xor-gate
 // assign c = a&b; // and gate
  
  xor(s, a,b);
  and(c, a,b);
  
endmodule
  
