/*
   This file was generated automatically by Alchitry Labs version 1.2.7.
   Do not edit this file directly. Instead edit the original Lucid source.
   This is a temporary file and any changes made to it will be destroyed.
*/

module shifter_21 (
    input [15:0] a,
    input [15:0] b,
    input [5:0] alufn,
    output reg [15:0] out
  );
  
  
  
  always @* begin
    out = a;
    if (alufn == 6'h20) begin
      out = a << b[0+3-:4];
    end else begin
      if (alufn == 6'h21) begin
        out = a >> b[0+3-:4];
      end else begin
        if (alufn == 6'h23) begin
          out = $signed(a) >>> b[0+3-:4];
        end
      end
    end
  end
endmodule