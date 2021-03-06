/*
   This file was generated automatically by Alchitry Labs version 1.2.7.
   Do not edit this file directly. Instead edit the original Lucid source.
   This is a temporary file and any changes made to it will be destroyed.
*/

module adder_21 (
    input [15:0] a,
    input [15:0] b,
    input [5:0] alufn,
    output reg [15:0] out,
    output reg z,
    output reg v,
    output reg n,
    output reg error
  );
  
  
  
  reg [15:0] s;
  reg o;
  
  reg [15:0] c;
  
  reg [15:0] i;
  
  always @* begin
    s = 16'h0000;
    c = 16'h0000;
    o = 1'h0;
    i = 16'h0000;
    error = 1'h0;
    
    case (alufn)
      6'h00: begin
        s = a + b;
        c = b;
        o = (a[15+0-:1] & c[15+0-:1] & ~s[15+0-:1]) | (~a[15+0-:1] & ~c[15+0-:1] & s[15+0-:1]);
      end
      6'h01: begin
        s = a - b;
        c = -b;
        o = (a[15+0-:1] & c[15+0-:1] & ~s[15+0-:1]) | (~a[15+0-:1] & ~c[15+0-:1] & s[15+0-:1]);
      end
      6'h02: begin
        s = a * b;
        o = (a[15+0-:1] & b[15+0-:1] & s[15+0-:1]) | (~(a[15+0-:1] | b[15+0-:1]) & s[15+0-:1]) | ((a[15+0-:1] ^ b[15+0-:1]) & ~s[15+0-:1]);
      end
      6'h03: begin
        s = a * (-b);
        o = (a[15+0-:1] & b[15+0-:1] & s[15+0-:1]) | (~(a[15+0-:1] | b[15+0-:1]) & s[15+0-:1]) | ((a[15+0-:1] ^ b[15+0-:1]) & ~s[15+0-:1]);
      end
      6'h04: begin
        s = a / b;
        if (b == 1'h0) begin
          error = 1'h1;
        end
        o = 1'h0;
      end
      6'h05: begin
        s = a / (-b);
        if (b == 1'h0) begin
          error = 1'h1;
        end
        o = 1'h0;
      end
    endcase
    out = s;
    v = o;
    n = s[15+0-:1];
    z = ~(|s);
  end
endmodule
