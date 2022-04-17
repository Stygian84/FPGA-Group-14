/*
   This file was generated automatically by Alchitry Labs version 1.2.7.
   Do not edit this file directly. Instead edit the original Lucid source.
   This is a temporary file and any changes made to it will be destroyed.
*/

module game_main_4 (
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
  
  
  
  reg [4:0] display0;
  
  reg [4:0] display1;
  
  reg [4:0] display2;
  
  reg [4:0] display3;
  
  reg [4:0] display4;
  
  wire [1-1:0] M_normal_edge_out;
  reg [1-1:0] M_normal_edge_in;
  edge_detector_2 normal_edge (
    .clk(clk),
    .in(M_normal_edge_in),
    .out(M_normal_edge_out)
  );
  wire [1-1:0] M_rng_edge_out;
  reg [1-1:0] M_rng_edge_in;
  edge_detector_2 rng_edge (
    .clk(clk),
    .in(M_rng_edge_in),
    .out(M_rng_edge_out)
  );
  wire [5-1:0] M_ctr_out;
  reg [1-1:0] M_ctr_increase_button;
  reg [1-1:0] M_ctr_decrease_button;
  reg [1-1:0] M_ctr_reset_to_zero;
  modified_counter_7 ctr (
    .clk(clk),
    .rst(rst),
    .increase_button(M_ctr_increase_button),
    .decrease_button(M_ctr_decrease_button),
    .reset_to_zero(M_ctr_reset_to_zero),
    .out(M_ctr_out)
  );
  wire [32-1:0] M_rng_num;
  reg [1-1:0] M_rng_next;
  reg [32-1:0] M_rng_seed;
  pn_gen_8 rng (
    .clk(clk),
    .rst(rst),
    .next(M_rng_next),
    .seed(M_rng_seed),
    .num(M_rng_num)
  );
  wire [1-1:0] M_rng_clock_value;
  counter_9 rng_clock (
    .clk(clk),
    .rst(rst),
    .value(M_rng_clock_value)
  );
  wire [1-1:0] M_normal_clock_value;
  counter_10 normal_clock (
    .clk(clk),
    .rst(rst),
    .value(M_normal_clock_value)
  );
  localparam IDLE_state = 6'd0;
  localparam START_state = 6'd1;
  localparam INSERT_state = 6'd2;
  localparam INIT_SET_QNS1_state = 6'd3;
  localparam SET_QNS10_state = 6'd4;
  localparam SET_QNS11_state = 6'd5;
  localparam SET_QNS12_state = 6'd6;
  localparam SET_QNS13_state = 6'd7;
  localparam SET_QNS14_state = 6'd8;
  localparam INIT_SET_QNS2_state = 6'd9;
  localparam SET_QNS20_state = 6'd10;
  localparam SET_QNS21_state = 6'd11;
  localparam SET_QNS22_state = 6'd12;
  localparam SET_QNS23_state = 6'd13;
  localparam SET_QNS24_state = 6'd14;
  localparam INIT_SET_QNS3_state = 6'd15;
  localparam SET_QNS30_state = 6'd16;
  localparam SET_QNS31_state = 6'd17;
  localparam SET_QNS32_state = 6'd18;
  localparam SET_QNS33_state = 6'd19;
  localparam SET_QNS34_state = 6'd20;
  localparam CHECK0_state = 6'd21;
  localparam CHECK1_state = 6'd22;
  localparam CHECK2_state = 6'd23;
  localparam CHECK3_state = 6'd24;
  localparam CHECK4_state = 6'd25;
  localparam COMBINE0_state = 6'd26;
  localparam COMBINE1_state = 6'd27;
  localparam COMBINE2_state = 6'd28;
  localparam COMBINE3_state = 6'd29;
  localparam COMBINE4_state = 6'd30;
  localparam SET_OUT0_state = 6'd31;
  localparam SET_OUT1_state = 6'd32;
  localparam SET_OUT2_state = 6'd33;
  localparam SET_OUT3_state = 6'd34;
  localparam SET_OUT4_state = 6'd35;
  localparam CHECK_state = 6'd36;
  localparam TEMP_WIN_state = 6'd37;
  localparam LEVEL2_state = 6'd38;
  localparam LEVEL3_state = 6'd39;
  localparam WIN_state = 6'd40;
  localparam LOSE_state = 6'd41;
  localparam GET_DISPLAY_STATE_state = 6'd42;
  localparam ADD_CORRECT_COUNT_state = 6'd43;
  localparam GET_CORRECT_COUNT_state = 6'd44;
  localparam SUBTRACT_LIVES_state = 6'd45;
  localparam GET_LIVES_state = 6'd46;
  
  reg [5:0] M_state_d, M_state_q = IDLE_state;
  reg [4:0] M_display_state_d, M_display_state_q = 1'h0;
  reg [4:0] M_current_input_d, M_current_input_q = 1'h0;
  reg [4:0] M_question0_d, M_question0_q = 1'h0;
  reg [4:0] M_question1_d, M_question1_q = 1'h0;
  reg [4:0] M_question2_d, M_question2_q = 1'h0;
  reg [4:0] M_question3_d, M_question3_q = 1'h0;
  reg [4:0] M_question4_d, M_question4_q = 1'h0;
  reg [1:0] M_lives_d, M_lives_q = 1'h0;
  reg [0:0] M_out_d, M_out_q = 1'h0;
  reg [0:0] M_off_d, M_off_q = 1'h0;
  reg [3:0] M_rng_num_d, M_rng_num_q = 1'h0;
  reg [3:0] M_correct_count_d, M_correct_count_q = 1'h0;
  wire [7-1:0] M_multi_seg_seg;
  wire [5-1:0] M_multi_seg_sel;
  reg [25-1:0] M_multi_seg_values;
  multi_seven_seg_11 multi_seg (
    .clk(clk),
    .rst(rst),
    .values(M_multi_seg_values),
    .seg(M_multi_seg_seg),
    .sel(M_multi_seg_sel)
  );
  
  wire [7-1:0] M_seg_segs;
  reg [5-1:0] M_seg_char;
  seven_seg_12 seg (
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
  alu_13 alu (
    .alufn(M_alu_alufn),
    .a(M_alu_a),
    .b(M_alu_b),
    .out(M_alu_out),
    .zout(M_alu_zout),
    .vout(M_alu_vout),
    .nout(M_alu_nout),
    .error(M_alu_error)
  );
  
  wire [5-1:0] M_difficulty1_question0;
  wire [5-1:0] M_difficulty1_question1;
  wire [5-1:0] M_difficulty1_question2;
  wire [5-1:0] M_difficulty1_question3;
  wire [5-1:0] M_difficulty1_question4;
  reg [4-1:0] M_difficulty1_rng;
  difficulty1_14 difficulty1 (
    .rng(M_difficulty1_rng),
    .question0(M_difficulty1_question0),
    .question1(M_difficulty1_question1),
    .question2(M_difficulty1_question2),
    .question3(M_difficulty1_question3),
    .question4(M_difficulty1_question4)
  );
  
  wire [5-1:0] M_difficulty2_question0;
  wire [5-1:0] M_difficulty2_question1;
  wire [5-1:0] M_difficulty2_question2;
  wire [5-1:0] M_difficulty2_question3;
  wire [5-1:0] M_difficulty2_question4;
  reg [4-1:0] M_difficulty2_rng;
  difficulty2_15 difficulty2 (
    .rng(M_difficulty2_rng),
    .question0(M_difficulty2_question0),
    .question1(M_difficulty2_question1),
    .question2(M_difficulty2_question2),
    .question3(M_difficulty2_question3),
    .question4(M_difficulty2_question4)
  );
  
  wire [5-1:0] M_difficulty3_question0;
  wire [5-1:0] M_difficulty3_question1;
  wire [5-1:0] M_difficulty3_question2;
  wire [5-1:0] M_difficulty3_question3;
  wire [5-1:0] M_difficulty3_question4;
  reg [4-1:0] M_difficulty3_rng;
  difficulty3_16 difficulty3 (
    .rng(M_difficulty3_rng),
    .question0(M_difficulty3_question0),
    .question1(M_difficulty3_question1),
    .question2(M_difficulty3_question2),
    .question3(M_difficulty3_question3),
    .question4(M_difficulty3_question4)
  );
  
  always @* begin
    M_state_d = M_state_q;
    M_rng_num_d = M_rng_num_q;
    M_correct_count_d = M_correct_count_q;
    M_lives_d = M_lives_q;
    M_display_state_d = M_display_state_q;
    M_current_input_d = M_current_input_q;
    M_question3_d = M_question3_q;
    M_question2_d = M_question2_q;
    M_question4_d = M_question4_q;
    M_off_d = M_off_q;
    M_question1_d = M_question1_q;
    M_question0_d = M_question0_q;
    M_out_d = M_out_q;
    
    M_rng_seed = 32'h01000001;
    M_rng_edge_in = M_rng_clock_value;
    M_rng_next = M_rng_edge_out;
    M_difficulty1_rng = M_rng_num_q;
    M_difficulty2_rng = M_rng_num_q;
    M_difficulty3_rng = M_rng_num_q;
    M_ctr_increase_button = increase_button;
    M_ctr_decrease_button = decrease_button;
    M_normal_edge_in = M_normal_clock_value;
    M_seg_char = M_ctr_out;
    input_sel = 1'h0;
    input_seg = M_seg_segs;
    display0 = 1'h0;
    display1 = 1'h0;
    display2 = 1'h0;
    display3 = 1'h0;
    display4 = 1'h0;
    if (M_display_state_q[0+0-:1]) begin
      display0 = M_question0_q;
    end
    if (M_display_state_q[1+0-:1]) begin
      display1 = M_question1_q;
    end
    if (M_display_state_q[2+0-:1]) begin
      display2 = M_question2_q;
    end
    if (M_display_state_q[3+0-:1]) begin
      display3 = M_question3_q;
    end
    if (M_display_state_q[4+0-:1]) begin
      display4 = M_question4_q;
    end
    M_multi_seg_values = {display0, display1, display2, display3, display4};
    custom_seg = M_multi_seg_seg;
    custom_sel = ~M_multi_seg_sel;
    M_alu_a = 16'h0000;
    M_alu_b = 16'h0000;
    M_alu_alufn = 6'h00;
    led_lives = 3'h0;
    if (M_lives_q == 2'h2) begin
      led_lives = 3'h1;
    end
    if (M_lives_q == 2'h1) begin
      led_lives = 3'h3;
    end
    if (M_lives_q == 2'h0) begin
      led_lives = 3'h7;
    end
    if (onoff_switch) begin
      M_off_d = 1'h0;
    end
    if (!M_off_q) begin
      M_state_d = IDLE_state;
      if (onoff_switch) begin
        M_off_d = 1'h1;
      end
    end
    M_ctr_reset_to_zero = 1'h0;
    if (reset_switch) begin
      M_state_d = IDLE_state;
    end
    
    case (M_state_q)
      default: begin
        M_state_d = IDLE_state;
      end
      IDLE_state: begin
        custom_sel = 5'h1f;
        input_sel = 1'h1;
        led_lives = 3'h7;
        M_correct_count_d = 4'h0;
        M_ctr_reset_to_zero = 1'h1;
        M_state_d = START_state;
      end
      START_state: begin
        M_multi_seg_values = 25'h13a0654;
        M_display_state_d = 5'h00;
        M_rng_num_d = M_rng_num;
        if (M_correct_count_q > 1'h0) begin
          if (M_correct_count_q < 2'h2) begin
            M_state_d = INIT_SET_QNS1_state;
          end else begin
            if (M_correct_count_q < 3'h4) begin
              M_state_d = INIT_SET_QNS2_state;
            end else begin
              if (M_correct_count_q < 3'h6) begin
                M_state_d = INIT_SET_QNS3_state;
              end
            end
          end
        end
        M_lives_d = 2'h3;
        if (start_switch) begin
          M_state_d = INIT_SET_QNS1_state;
        end
      end
      INIT_SET_QNS1_state: begin
        M_difficulty1_rng = M_rng_num_q;
        M_state_d = SET_QNS10_state;
      end
      SET_QNS10_state: begin
        M_question0_d = M_difficulty1_question0;
        M_state_d = SET_QNS11_state;
      end
      SET_QNS11_state: begin
        M_question1_d = M_difficulty1_question1;
        M_state_d = SET_QNS12_state;
      end
      SET_QNS12_state: begin
        M_question2_d = M_difficulty1_question2;
        M_state_d = SET_QNS13_state;
      end
      SET_QNS13_state: begin
        M_question3_d = M_difficulty1_question3;
        M_state_d = SET_QNS14_state;
      end
      SET_QNS14_state: begin
        M_question4_d = M_difficulty1_question4;
        M_state_d = INSERT_state;
      end
      INIT_SET_QNS2_state: begin
        M_difficulty2_rng = M_rng_num_q;
        M_state_d = SET_QNS20_state;
      end
      SET_QNS20_state: begin
        M_question0_d = M_difficulty2_question0;
        M_state_d = SET_QNS21_state;
      end
      SET_QNS21_state: begin
        M_question1_d = M_difficulty2_question1;
        M_state_d = SET_QNS22_state;
      end
      SET_QNS22_state: begin
        M_question2_d = M_difficulty2_question2;
        M_state_d = SET_QNS23_state;
      end
      SET_QNS23_state: begin
        M_question3_d = M_difficulty2_question3;
        M_state_d = SET_QNS24_state;
      end
      SET_QNS24_state: begin
        M_question4_d = M_difficulty2_question4;
        M_state_d = INSERT_state;
      end
      INIT_SET_QNS3_state: begin
        M_difficulty3_rng = M_rng_num_q;
        M_state_d = SET_QNS30_state;
      end
      SET_QNS30_state: begin
        M_question0_d = M_difficulty3_question0;
        M_state_d = SET_QNS31_state;
      end
      SET_QNS31_state: begin
        M_question1_d = M_difficulty3_question1;
        M_state_d = SET_QNS32_state;
      end
      SET_QNS32_state: begin
        M_question2_d = M_difficulty3_question2;
        M_state_d = SET_QNS33_state;
      end
      SET_QNS33_state: begin
        M_question3_d = M_difficulty3_question3;
        M_state_d = SET_QNS34_state;
      end
      SET_QNS34_state: begin
        M_question4_d = M_difficulty3_question4;
        M_state_d = INSERT_state;
      end
      INSERT_state: begin
        M_current_input_d = M_ctr_out;
        M_out_d = 1'h0;
        if (enter_switch) begin
          M_state_d = CHECK0_state;
        end
      end
      CHECK0_state: begin
        M_alu_a = M_current_input_q;
        M_alu_b = M_question0_q;
        M_alu_alufn = 6'h33;
        if (M_alu_out) begin
          M_state_d = COMBINE0_state;
        end else begin
          M_state_d = CHECK1_state;
        end
      end
      CHECK1_state: begin
        M_alu_a = M_current_input_q;
        M_alu_b = M_question1_q;
        M_alu_alufn = 6'h33;
        if (M_alu_out) begin
          M_state_d = COMBINE1_state;
        end else begin
          M_state_d = CHECK2_state;
        end
      end
      CHECK2_state: begin
        M_alu_a = M_current_input_q;
        M_alu_b = M_question2_q;
        M_alu_alufn = 6'h33;
        if (M_alu_out) begin
          M_state_d = COMBINE2_state;
        end else begin
          M_state_d = CHECK3_state;
        end
      end
      CHECK3_state: begin
        M_alu_a = M_current_input_q;
        M_alu_b = M_question3_q;
        M_alu_alufn = 6'h33;
        if (M_alu_out) begin
          M_state_d = COMBINE3_state;
        end else begin
          M_state_d = CHECK4_state;
        end
      end
      CHECK4_state: begin
        M_alu_a = M_current_input_q;
        M_alu_b = M_question4_q;
        M_alu_alufn = 6'h33;
        if (M_alu_out) begin
          M_state_d = COMBINE4_state;
        end else begin
          M_state_d = CHECK_state;
        end
      end
      COMBINE0_state: begin
        M_alu_a = M_display_state_q;
        M_alu_b = 5'h01;
        M_alu_alufn = 6'h17;
        M_display_state_d = M_alu_out;
        M_state_d = SET_OUT0_state;
      end
      SET_OUT0_state: begin
        M_out_d = 1'h1;
        M_state_d = CHECK1_state;
      end
      COMBINE1_state: begin
        M_alu_a = M_display_state_q;
        M_alu_b = 5'h02;
        M_alu_alufn = 6'h17;
        M_display_state_d = M_alu_out;
        M_state_d = SET_OUT1_state;
      end
      SET_OUT1_state: begin
        M_out_d = 1'h1;
        M_state_d = CHECK2_state;
      end
      COMBINE2_state: begin
        M_alu_a = M_display_state_q;
        M_alu_b = 5'h04;
        M_alu_alufn = 6'h17;
        M_display_state_d = M_alu_out;
        M_state_d = SET_OUT2_state;
      end
      SET_OUT2_state: begin
        M_out_d = 1'h1;
        M_state_d = CHECK3_state;
      end
      COMBINE3_state: begin
        M_alu_a = M_display_state_q;
        M_alu_b = 5'h08;
        M_alu_alufn = 6'h17;
        M_display_state_d = M_alu_out;
        M_state_d = SET_OUT3_state;
      end
      SET_OUT3_state: begin
        M_out_d = 1'h1;
        M_state_d = CHECK4_state;
      end
      COMBINE4_state: begin
        M_alu_a = M_display_state_q;
        M_alu_b = 5'h10;
        M_alu_alufn = 6'h17;
        M_display_state_d = M_alu_out;
        M_state_d = SET_OUT4_state;
      end
      SET_OUT4_state: begin
        M_out_d = 1'h1;
        M_state_d = CHECK_state;
      end
      CHECK_state: begin
        if (M_out_q) begin
          M_state_d = GET_DISPLAY_STATE_state;
        end else begin
          M_state_d = SUBTRACT_LIVES_state;
        end
      end
      TEMP_WIN_state: begin
        M_multi_seg_values = 25'h1249d14;
        M_lives_d = 2'h3;
        if (M_normal_edge_out) begin
          M_state_d = START_state;
        end
      end
      LEVEL2_state: begin
        M_multi_seg_values = 25'h0c2d8ac;
        M_seg_char = 5'h1a;
        led_lives = 3'h0;
        if (M_normal_edge_out) begin
          M_state_d = START_state;
        end
      end
      LEVEL3_state: begin
        M_multi_seg_values = 25'h0c2d8ac;
        M_seg_char = 5'h1b;
        led_lives = 3'h0;
        if (M_normal_edge_out) begin
          M_state_d = START_state;
        end
      end
      WIN_state: begin
        M_multi_seg_values = 25'h0005d2e;
        M_seg_char = 1'h0;
        led_lives = 3'h0;
        if (start_switch) begin
          M_state_d = IDLE_state;
        end
      end
      LOSE_state: begin
        M_multi_seg_values = 25'h0063e65;
        M_seg_char = 1'h0;
        if (start_switch) begin
          M_state_d = IDLE_state;
        end
      end
      GET_DISPLAY_STATE_state: begin
        if (M_display_state_q == 5'h1f) begin
          M_state_d = ADD_CORRECT_COUNT_state;
        end else begin
          M_state_d = INSERT_state;
        end
      end
      ADD_CORRECT_COUNT_state: begin
        M_alu_a = M_correct_count_q;
        M_alu_b = 1'h1;
        M_alu_alufn = 6'h00;
        M_correct_count_d = M_alu_out;
        M_state_d = GET_CORRECT_COUNT_state;
      end
      GET_CORRECT_COUNT_state: begin
        if (M_correct_count_q == 3'h6) begin
          M_state_d = WIN_state;
        end else begin
          if (M_correct_count_q == 3'h4) begin
            M_state_d = LEVEL3_state;
          end else begin
            if (M_correct_count_q == 2'h2) begin
              M_state_d = LEVEL2_state;
            end else begin
              M_state_d = TEMP_WIN_state;
            end
          end
        end
      end
      SUBTRACT_LIVES_state: begin
        M_alu_a = M_lives_q;
        M_alu_b = 1'h1;
        M_alu_alufn = 6'h01;
        M_lives_d = M_alu_out;
        M_state_d = GET_LIVES_state;
      end
      GET_LIVES_state: begin
        if (M_lives_q == 2'h0) begin
          M_state_d = LOSE_state;
        end else begin
          M_state_d = INSERT_state;
        end
      end
    endcase
  end
  
  always @(posedge clk) begin
    if (rst == 1'b1) begin
      M_display_state_q <= 1'h0;
      M_current_input_q <= 1'h0;
      M_question0_q <= 1'h0;
      M_question1_q <= 1'h0;
      M_question2_q <= 1'h0;
      M_question3_q <= 1'h0;
      M_question4_q <= 1'h0;
      M_lives_q <= 1'h0;
      M_out_q <= 1'h0;
      M_off_q <= 1'h0;
      M_rng_num_q <= 1'h0;
      M_correct_count_q <= 1'h0;
      M_state_q <= 1'h0;
    end else begin
      M_display_state_q <= M_display_state_d;
      M_current_input_q <= M_current_input_d;
      M_question0_q <= M_question0_d;
      M_question1_q <= M_question1_d;
      M_question2_q <= M_question2_d;
      M_question3_q <= M_question3_d;
      M_question4_q <= M_question4_d;
      M_lives_q <= M_lives_d;
      M_out_q <= M_out_d;
      M_off_q <= M_off_d;
      M_rng_num_q <= M_rng_num_d;
      M_correct_count_q <= M_correct_count_d;
      M_state_q <= M_state_d;
    end
  end
  
endmodule