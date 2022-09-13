//design.sv

module and_gate(output a, input b, c);
assign a = b & c;
endmodule

module not_gate(output d, input e);
assign d = ~ e;
endmodule

module or_gate(output l, input m, n);
assign l = m | n;
endmodule

module m21(Y, D0, D1, S);
output Y;
input D0, D1, S;
wire T1, T2, T3;
and_gate u1(T1, D1, S);
not_gate u2(T2, S);
and_gate u3(T3, D0, T2);
or_gate u4(Y, T1, T3);
endmodule

//teztbench.sv

module top;
wire out;
reg d0, d1, s;
m21 name(.Y(out), .D0(d0), .D1(d1), .S(s));
initial
begin
$dumpfile("mux.vcd"); //used to dump the waveforms
$dumpvars(1);
d0=1'b0;
d1=1'b0;
s=1'b0;
#100 $finish;
end
always #40 d0=~d0;
always #20 d1=~d1;
always #10 s=~s;
always@(d0 or d1 or s)
$monitor("At time = %t, Output = %d", $time, out);
endmodule
