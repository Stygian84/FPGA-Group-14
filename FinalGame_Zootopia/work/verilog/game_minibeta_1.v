/*
   This file was generated automatically by Alchitry Labs version 1.2.7.
   Do not edit this file directly. Instead edit the original Lucid source.
   This is a temporary file and any changes made to it will be destroyed.
*/

module game_minibeta_1 (
    input clk,
    input rst,
    output reg [7:0] custom_seg,
    output reg [4:0] custom_sel,
    output reg [0:0] input_sel,
    output reg [7:0] input_seg,
    output reg [2:0] led_lives,
    input [0:0] increase_button,
    input [0:0] decrease_button,
    input [0:0] start_switch,
    input [0:0] enter_switch,
    input [0:0] reset_switch,
    input [0:0] onoff_switch
  );
  
  
  
  reg onoff;
  
  reg [15:0] alu_input_b;
  
  wire [1-1:0] M_enter_btn_out;
  reg [1-1:0] M_enter_btn_in;
  button_conditioner_3 enter_btn (
    .clk(clk),
    .in(M_enter_btn_in),
    .out(M_enter_btn_out)
  );
  wire [1-1:0] M_start_btn_out;
  reg [1-1:0] M_start_btn_in;
  button_conditioner_3 start_btn (
    .clk(clk),
    .in(M_start_btn_in),
    .out(M_start_btn_out)
  );
  wire [1-1:0] M_reset_btn_out;
  reg [1-1:0] M_reset_btn_in;
  button_conditioner_3 reset_btn (
    .clk(clk),
    .in(M_reset_btn_in),
    .out(M_reset_btn_out)
  );
  wire [1-1:0] M_onoff_btn_out;
  reg [1-1:0] M_onoff_btn_in;
  button_conditioner_3 onoff_btn (
    .clk(clk),
    .in(M_onoff_btn_in),
    .out(M_onoff_btn_out)
  );
  wire [1-1:0] M_enter_edge_out;
  reg [1-1:0] M_enter_edge_in;
  edge_detector_4 enter_edge (
    .clk(clk),
    .in(M_enter_edge_in),
    .out(M_enter_edge_out)
  );
  wire [1-1:0] M_start_edge_out;
  reg [1-1:0] M_start_edge_in;
  edge_detector_4 start_edge (
    .clk(clk),
    .in(M_start_edge_in),
    .out(M_start_edge_out)
  );
  wire [1-1:0] M_reset_edge_out;
  reg [1-1:0] M_reset_edge_in;
  edge_detector_4 reset_edge (
    .clk(clk),
    .in(M_reset_edge_in),
    .out(M_reset_edge_out)
  );
  wire [1-1:0] M_onoff_edge_out;
  reg [1-1:0] M_onoff_edge_in;
  edge_detector_5 onoff_edge (
    .clk(clk),
    .in(M_onoff_edge_in),
    .out(M_onoff_edge_out)
  );
  wire [1-1:0] M_game_cu_we;
  wire [4-1:0] M_game_cu_rc;
  wire [4-1:0] M_game_cu_rb;
  wire [4-1:0] M_game_cu_ra;
  wire [1-1:0] M_game_cu_bsel;
  wire [16-1:0] M_game_cu_constant;
  wire [6-1:0] M_game_cu_alufn;
  wire [25-1:0] M_game_cu_seven_seg_values;
  wire [5-1:0] M_game_cu_seven_seg_input;
  wire [5-1:0] M_game_cu_custom_sel;
  wire [1-1:0] M_game_cu_input_sel;
  reg [4-1:0] M_game_cu_correct_count;
  reg [16-1:0] M_game_cu_out_a;
  reg [16-1:0] M_game_cu_alu_output;
  reg [1-1:0] M_game_cu_increase_button;
  reg [1-1:0] M_game_cu_decrease_button;
  reg [1-1:0] M_game_cu_start_switch;
  reg [1-1:0] M_game_cu_enter_switch;
  reg [1-1:0] M_game_cu_reset_switch;
  reg [5-1:0] M_game_cu_question0_in;
  reg [5-1:0] M_game_cu_question1_in;
  reg [5-1:0] M_game_cu_question2_in;
  reg [5-1:0] M_game_cu_question3_in;
  reg [5-1:0] M_game_cu_question4_in;
  reg [5-1:0] M_game_cu_display_state_in;
  game_cu_6 game_cu (
    .clk(clk),
    .rst(rst),
    .correct_count(M_game_cu_correct_count),
    .out_a(M_game_cu_out_a),
    .alu_output(M_game_cu_alu_output),
    .increase_button(M_game_cu_increase_button),
    .decrease_button(M_game_cu_decrease_button),
    .start_switch(M_game_cu_start_switch),
    .enter_switch(M_game_cu_enter_switch),
    .reset_switch(M_game_cu_reset_switch),
    .question0_in(M_game_cu_question0_in),
    .question1_in(M_game_cu_question1_in),
    .question2_in(M_game_cu_question2_in),
    .question3_in(M_game_cu_question3_in),
    .question4_in(M_game_cu_question4_in),
    .display_state_in(M_game_cu_display_state_in),
    .we(M_game_cu_we),
    .rc(M_game_cu_rc),
    .rb(M_game_cu_rb),
    .ra(M_game_cu_ra),
    .bsel(M_game_cu_bsel),
    .constant(M_game_cu_constant),
    .alufn(M_game_cu_alufn),
    .seven_seg_values(M_game_cu_seven_seg_values),
    .seven_seg_input(M_game_cu_seven_seg_input),
    .custom_sel(M_game_cu_custom_sel),
    .input_sel(M_game_cu_input_sel)
  );
  wire [16-1:0] M_game_regfile_out_a;
  wire [16-1:0] M_game_regfile_out_b;
  wire [4-1:0] M_game_regfile_correct_count_out;
  wire [2-1:0] M_game_regfile_lives_count_out;
  wire [5-1:0] M_game_regfile_question0_out;
  wire [5-1:0] M_game_regfile_question1_out;
  wire [5-1:0] M_game_regfile_question2_out;
  wire [5-1:0] M_game_regfile_question3_out;
  wire [5-1:0] M_game_regfile_question4_out;
  wire [5-1:0] M_game_regfile_display_state_out;
  wire [1-1:0] M_game_regfile_onoff_out;
  reg [1-1:0] M_game_regfile_we;
  reg [16-1:0] M_game_regfile_data;
  reg [4-1:0] M_game_regfile_ra;
  reg [4-1:0] M_game_regfile_rb;
  reg [4-1:0] M_game_regfile_rc;
  reg [1-1:0] M_game_regfile_onoff_in;
  game_regfile_7 game_regfile (
    .clk(clk),
    .rst(rst),
    .we(M_game_regfile_we),
    .data(M_game_regfile_data),
    .ra(M_game_regfile_ra),
    .rb(M_game_regfile_rb),
    .rc(M_game_regfile_rc),
    .onoff_in(M_game_regfile_onoff_in),
    .out_a(M_game_regfile_out_a),
    .out_b(M_game_regfile_out_b),
    .correct_count_out(M_game_regfile_correct_count_out),
    .lives_count_out(M_game_regfile_lives_count_out),
    .question0_out(M_game_regfile_question0_out),
    .question1_out(M_game_regfile_question1_out),
    .question2_out(M_game_regfile_question2_out),
    .question3_out(M_game_regfile_question3_out),
    .question4_out(M_game_regfile_question4_out),
    .display_state_out(M_game_regfile_display_state_out),
    .onoff_out(M_game_regfile_onoff_out)
  );
  wire [7-1:0] M_multi_seg_seg;
  wire [5-1:0] M_multi_seg_sel;
  reg [25-1:0] M_multi_seg_values;
  multi_seven_seg_8 multi_seg (
    .clk(clk),
    .rst(rst),
    .values(M_multi_seg_values),
    .seg(M_multi_seg_seg),
    .sel(M_multi_seg_sel)
  );
  
  wire [7-1:0] M_seg_segs;
  reg [5-1:0] M_seg_char;
  seven_seg_9 seg (
    .char(M_seg_char),
    .segs(M_seg_segs)
  );
  
  wire [16-1:0] M_alu_out;
  wire [1-1:0] M_alu_zout;
  wire [1-1:0] M_alu_vout;
  wire [1-1:0] M_alu_nout;
  wire [1-1:0] M_alu_error;
  reg [6-1:0] M_alu_alufn;
  reg [16-1:0] M_alu_a;
  reg [16-1:0] M_alu_b;
  alu_10 alu (
    .alufn(M_alu_alufn),
    .a(M_alu_a),
    .b(M_alu_b),
    .out(M_alu_out),
    .zout(M_alu_zout),
    .vout(M_alu_vout),
    .nout(M_alu_nout),
    .error(M_alu_error)
  );
  
  always @* begin
    M_start_btn_in = start_switch;
    M_start_edge_in = M_start_btn_out;
    M_game_cu_start_switch = M_start_edge_out;
    M_enter_btn_in = enter_switch;
    M_enter_edge_in = M_enter_btn_out;
    M_game_cu_enter_switch = M_enter_edge_out;
    M_reset_btn_in = reset_switch;
    M_reset_edge_in = M_reset_btn_out;
    M_game_cu_reset_switch = M_reset_edge_out;
    M_onoff_btn_in = onoff_switch;
    M_onoff_edge_in = M_onoff_btn_out;
    onoff = M_onoff_edge_out;
    M_game_cu_increase_button = increase_button;
    M_game_cu_decrease_button = decrease_button;
    
    case (M_game_cu_bsel)
      1'h0: begin
        alu_input_b = M_game_regfile_out_b;
      end
      1'h1: begin
        alu_input_b = M_game_cu_constant;
      end
      default: begin
        alu_input_b = M_game_regfile_out_b;
      end
    endcase
    M_alu_a = M_game_regfile_out_a;
    M_alu_b = alu_input_b;
    M_alu_alufn = M_game_cu_alufn;
    M_game_cu_alu_output = M_alu_out;
    M_game_cu_correct_count = M_game_regfile_correct_count_out;
    M_game_cu_out_a = M_game_regfile_out_a;
    M_game_cu_display_state_in = M_game_regfile_display_state_out;
    M_game_cu_question0_in = M_game_regfile_question0_out;
    M_game_cu_question1_in = M_game_regfile_question1_out;
    M_game_cu_question2_in = M_game_regfile_question2_out;
    M_game_cu_question3_in = M_game_regfile_question3_out;
    M_game_cu_question4_in = M_game_regfile_question4_out;
    M_game_regfile_ra = M_game_cu_ra;
    M_game_regfile_rb = M_game_cu_rb;
    M_game_regfile_rc = M_game_cu_rc;
    M_game_regfile_we = M_game_cu_we;
    M_game_regfile_data = M_alu_out;
    led_lives = 3'h0;
    if (M_game_regfile_lives_count_out == 2'h2) begin
      led_lives = 3'h1;
    end
    if (M_game_regfile_lives_count_out == 2'h1) begin
      led_lives = 3'h3;
    end
    if (M_game_regfile_lives_count_out == 2'h0) begin
      led_lives = 3'h7;
    end
    M_multi_seg_values = M_game_cu_seven_seg_values;
    M_seg_char = M_game_cu_seven_seg_input;
    custom_seg = M_multi_seg_seg;
    custom_sel = ~M_multi_seg_sel;
    input_sel = M_game_cu_input_sel;
    input_seg = M_seg_segs;
    M_game_regfile_onoff_in = onoff_switch;
    if (!M_game_regfile_onoff_out) begin
      led_lives = 3'h7;
      input_sel = 5'h01;
      custom_sel = 5'h1f;
      M_game_cu_reset_switch = 1'h1;
    end
  end
endmodule
