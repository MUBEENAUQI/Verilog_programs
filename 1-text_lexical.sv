module text_lexical;
  reg [7:0] a,b;
  
  initial
    begin
      a=8'bx_1100;    //8 = no of bits, b = binary, x =replacemnet
      b=8'bz_1100;
      
      $display("a= %b",a);
      $display("b= %b",b);
    end
endmodule

//output :
//a= xxxx1100
//b= zzzz1100
