module String_manupulation;
  reg [8*14:1] stext;
  
  initial
    begin
      stext = "Hello world";
      $display("%s is stored as %h",stext,stext);
      stext = {stext,"!!!"};
      $display("%s is stored as %h",stext,stext);
    end
endmodule

//Hello world is stored as 00000048656c6c6f20776f726c64
//Hello world!!! is stored as 48656c6c6f20776f726c64212121
