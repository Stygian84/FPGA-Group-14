/*
   This file was generated automatically by Alchitry Labs version 1.2.7.
   Do not edit this file directly. Instead edit the original Lucid source.
   This is a temporary file and any changes made to it will be destroyed.
*/

/*
   Parameters:
     DIGITS = 5
     DIV = 16
*/
module multi_seven_seg_11 (
    input clk,
    input rst,
    input [24:0] values,
    output reg [6:0] seg,
    output reg [4:0] sel
  );
  
  localparam DIGITS = 3'h5;
  localparam DIV = 5'h10;
  
  
  localparam DIGIT_BITS = 2'h3;
  
  wire [3-1:0] M_ctr_value;
  counter_17 ctr (
    .clk(clk),
    .rst(rst),
    .value(M_ctr_value)
  );
  
  wire [7-1:0] M_seg_dec_segs;
  reg [5-1:0] M_seg_dec_char;
  seven_seg_12 seg_dec (
    .char(M_seg_dec_char),
    .segs(M_seg_dec_segs)
  );
  
  wire [8-1:0] M_digit_dec_out;
  reg [3-1:0] M_digit_dec_in;
  decoder_18 digit_dec (
    .in(M_digit_dec_in),
    .out(M_digit_dec_out)
  );
  
  always @* begin
    M_seg_dec_char = values[(M_ctr_value)*5+4-:5];
    seg = M_seg_dec_segs;
    M_digit_dec_in = M_ctr_value;
    sel = M_digit_dec_out;
  end
endmodule
