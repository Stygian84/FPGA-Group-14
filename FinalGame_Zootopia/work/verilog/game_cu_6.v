/*
   This file was generated automatically by Alchitry Labs version 1.2.7.
   Do not edit this file directly. Instead edit the original Lucid source.
   This is a temporary file and any changes made to it will be destroyed.
*/

module game_cu_6 (
    input clk,
    input rst,
    input [3:0] correct_count,
    input [15:0] out_a,
    input [15:0] alu_output,
    output reg [0:0] we,
    output reg [3:0] rc,
    output reg [3:0] rb,
    output reg [3:0] ra,
    output reg [0:0] bsel,
    output reg [15:0] constant,
    output reg [5:0] alufn,
    output reg [24:0] seven_seg_values,
    output reg [4:0] seven_seg_input,
    output reg [4:0] custom_sel,
    output reg [0:0] input_sel,
    input [0:0] increase_button,
    input [0:0] decrease_button,
    input [0:0] start_switch,
    input [0:0] enter_switch,
    input [0:0] reset_switch,
    input [4:0] question0_in,
    input [4:0] question1_in,
    input [4:0] question2_in,
    input [4:0] question3_in,
    input [4:0] question4_in,
    input [4:0] display_state_in
  );
  
  
  
  reg [4:0] display0;
  
  reg [4:0] display1;
  
  reg [4:0] display2;
  
  reg [4:0] display3;
  
  reg [4:0] display4;
  
  wire [1-1:0] M_normal_edge_out;
  reg [1-1:0] M_normal_edge_in;
  edge_detector_4 normal_edge (
    .clk(clk),
    .in(M_normal_edge_in),
    .out(M_normal_edge_out)
  );
  wire [1-1:0] M_rng_edge_out;
  reg [1-1:0] M_rng_edge_in;
  edge_detector_4 rng_edge (
    .clk(clk),
    .in(M_rng_edge_in),
    .out(M_rng_edge_out)
  );
  wire [32-1:0] M_rng_num;
  reg [1-1:0] M_rng_next;
  reg [32-1:0] M_rng_seed;
  pn_gen_12 rng (
    .clk(clk),
    .rst(rst),
    .next(M_rng_next),
    .seed(M_rng_seed),
    .num(M_rng_num)
  );
  wire [1-1:0] M_rng_clock_value;
  counter_13 rng_clock (
    .clk(clk),
    .rst(rst),
    .value(M_rng_clock_value)
  );
  wire [5-1:0] M_ctr_out;
  reg [1-1:0] M_ctr_increase_button;
  reg [1-1:0] M_ctr_decrease_button;
  reg [1-1:0] M_ctr_reset_to_zero;
  modified_counter_14 ctr (
    .clk(clk),
    .rst(rst),
    .increase_button(M_ctr_increase_button),
    .decrease_button(M_ctr_decrease_button),
    .reset_to_zero(M_ctr_reset_to_zero),
    .out(M_ctr_out)
  );
  wire [1-1:0] M_normal_clock_value;
  counter_15 normal_clock (
    .clk(clk),
    .rst(rst),
    .value(M_normal_clock_value)
  );
  localparam IDLE_state = 6'd0;
  localparam RESET_LIVES_state = 6'd1;
  localparam RESET_DISPLAY_state = 6'd2;
  localparam START_state = 6'd3;
  localparam INSERT_state = 6'd4;
  localparam RESET_OUT_state = 6'd5;
  localparam INIT_SET_QNS1_state = 6'd6;
  localparam SET_QNS10_state = 6'd7;
  localparam SET_QNS11_state = 6'd8;
  localparam SET_QNS12_state = 6'd9;
  localparam SET_QNS13_state = 6'd10;
  localparam SET_QNS14_state = 6'd11;
  localparam INIT_SET_QNS2_state = 6'd12;
  localparam SET_QNS20_state = 6'd13;
  localparam SET_QNS21_state = 6'd14;
  localparam SET_QNS22_state = 6'd15;
  localparam SET_QNS23_state = 6'd16;
  localparam SET_QNS24_state = 6'd17;
  localparam INIT_SET_QNS3_state = 6'd18;
  localparam SET_QNS30_state = 6'd19;
  localparam SET_QNS31_state = 6'd20;
  localparam SET_QNS32_state = 6'd21;
  localparam SET_QNS33_state = 6'd22;
  localparam SET_QNS34_state = 6'd23;
  localparam CHECK0_state = 6'd24;
  localparam CHECK1_state = 6'd25;
  localparam CHECK2_state = 6'd26;
  localparam CHECK3_state = 6'd27;
  localparam CHECK4_state = 6'd28;
  localparam COMBINE0_state = 6'd29;
  localparam COMBINE1_state = 6'd30;
  localparam COMBINE2_state = 6'd31;
  localparam COMBINE3_state = 6'd32;
  localparam COMBINE4_state = 6'd33;
  localparam SET_OUT0_state = 6'd34;
  localparam SET_OUT1_state = 6'd35;
  localparam SET_OUT2_state = 6'd36;
  localparam SET_OUT3_state = 6'd37;
  localparam SET_OUT4_state = 6'd38;
  localparam CHECK_state = 6'd39;
  localparam TEMP_WIN_state = 6'd40;
  localparam LEVEL2_state = 6'd41;
  localparam LEVEL3_state = 6'd42;
  localparam WIN_state = 6'd43;
  localparam LOSE_state = 6'd44;
  localparam GET_DISPLAY_STATE_state = 6'd45;
  localparam ADD_CORRECT_COUNT_state = 6'd46;
  localparam GET_CORRECT_COUNT_state = 6'd47;
  localparam SUBTRACT_LIVES_state = 6'd48;
  localparam GET_LIVES_state = 6'd49;
  
  reg [5:0] M_state_d, M_state_q = IDLE_state;
  reg [3:0] M_rng_num_d, M_rng_num_q = 1'h0;
  
  wire [5-1:0] M_difficulty1_question0;
  wire [5-1:0] M_difficulty1_question1;
  wire [5-1:0] M_difficulty1_question2;
  wire [5-1:0] M_difficulty1_question3;
  wire [5-1:0] M_difficulty1_question4;
  reg [4-1:0] M_difficulty1_rng;
  difficulty1_16 difficulty1 (
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
  difficulty2_17 difficulty2 (
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
  difficulty3_18 difficulty3 (
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
    
    M_normal_edge_in = M_normal_clock_value;
    M_ctr_increase_button = increase_button;
    M_ctr_decrease_button = decrease_button;
    M_ctr_reset_to_zero = 1'h0;
    we = 1'h0;
    rc = 1'h0;
    rb = 1'h0;
    ra = 1'h0;
    bsel = 1'h0;
    constant = 1'h0;
    alufn = 6'h15;
    seven_seg_values = 25'h0000000;
    seven_seg_input = M_ctr_out;
    custom_sel = 1'h0;
    input_sel = 1'h0;
    M_rng_seed = 32'h01000001;
    M_rng_edge_in = M_rng_clock_value;
    M_rng_next = M_rng_edge_out;
    M_difficulty1_rng = M_rng_num_q;
    M_difficulty2_rng = M_rng_num_q;
    M_difficulty3_rng = M_rng_num_q;
    display0 = 1'h0;
    display1 = 1'h0;
    display2 = 1'h0;
    display3 = 1'h0;
    display4 = 1'h0;
    if (display_state_in[0+0-:1]) begin
      display0 = question0_in;
    end
    if (display_state_in[1+0-:1]) begin
      display1 = question1_in;
    end
    if (display_state_in[2+0-:1]) begin
      display2 = question2_in;
    end
    if (display_state_in[3+0-:1]) begin
      display3 = question3_in;
    end
    if (display_state_in[4+0-:1]) begin
      display4 = question4_in;
    end
    seven_seg_values = {display0, display1, display2, display3, display4};
    if (reset_switch) begin
      M_state_d = IDLE_state;
    end
    
    case (M_state_q)
      default: begin
        M_state_d = IDLE_state;
      end
      IDLE_state: begin
        we = 1'h1;
        rc = 4'h8;
        bsel = 1'h1;
        constant = 1'h0;
        alufn = 6'h15;
        M_ctr_reset_to_zero = 1'h1;
        M_state_d = RESET_LIVES_state;
      end
      RESET_LIVES_state: begin
        we = 1'h1;
        rc = 4'hb;
        bsel = 1'h1;
        constant = 2'h3;
        alufn = 6'h15;
        M_state_d = RESET_DISPLAY_state;
      end
      RESET_DISPLAY_state: begin
        we = 1'h1;
        rc = 4'h9;
        bsel = 1'h1;
        constant = 1'h0;
        alufn = 6'h15;
        M_state_d = START_state;
      end
      START_state: begin
        seven_seg_values = 25'h13a0654;
        we = 1'h1;
        rc = 4'ha;
        bsel = 1'h1;
        constant = M_rng_num;
        alufn = 6'h15;
        M_rng_num_d = M_rng_num;
        if (correct_count > 1'h0) begin
          if (correct_count < 2'h2) begin
            M_state_d = INIT_SET_QNS1_state;
          end else begin
            if (correct_count < 3'h4) begin
              M_state_d = INIT_SET_QNS2_state;
            end else begin
              if (correct_count < 3'h6) begin
                M_state_d = INIT_SET_QNS3_state;
              end
            end
          end
        end
        if (start_switch) begin
          M_state_d = INIT_SET_QNS1_state;
        end
      end
      INIT_SET_QNS1_state: begin
        M_difficulty1_rng = M_rng_num_q;
        M_state_d = SET_QNS10_state;
      end
      SET_QNS10_state: begin
        we = 1'h1;
        bsel = 1'h1;
        constant = M_difficulty1_question0;
        rc = 4'h0;
        M_state_d = SET_QNS11_state;
      end
      SET_QNS11_state: begin
        we = 1'h1;
        bsel = 1'h1;
        constant = M_difficulty1_question1;
        rc = 4'h1;
        M_state_d = SET_QNS12_state;
      end
      SET_QNS12_state: begin
        we = 1'h1;
        bsel = 1'h1;
        constant = M_difficulty1_question2;
        rc = 4'h2;
        M_state_d = SET_QNS13_state;
      end
      SET_QNS13_state: begin
        we = 1'h1;
        bsel = 1'h1;
        constant = M_difficulty1_question3;
        rc = 4'h3;
        M_state_d = SET_QNS14_state;
      end
      SET_QNS14_state: begin
        we = 1'h1;
        bsel = 1'h1;
        constant = M_difficulty1_question4;
        rc = 4'h4;
        M_state_d = INSERT_state;
      end
      INIT_SET_QNS2_state: begin
        M_difficulty2_rng = M_rng_num_q;
        M_state_d = SET_QNS20_state;
      end
      SET_QNS20_state: begin
        we = 1'h1;
        bsel = 1'h1;
        constant = M_difficulty2_question0;
        rc = 4'h0;
        M_state_d = SET_QNS21_state;
      end
      SET_QNS21_state: begin
        we = 1'h1;
        bsel = 1'h1;
        constant = M_difficulty2_question1;
        rc = 4'h1;
        M_state_d = SET_QNS22_state;
      end
      SET_QNS22_state: begin
        we = 1'h1;
        bsel = 1'h1;
        constant = M_difficulty2_question2;
        rc = 4'h2;
        M_state_d = SET_QNS23_state;
      end
      SET_QNS23_state: begin
        we = 1'h1;
        bsel = 1'h1;
        constant = M_difficulty2_question3;
        rc = 4'h3;
        M_state_d = SET_QNS24_state;
      end
      SET_QNS24_state: begin
        we = 1'h1;
        bsel = 1'h1;
        constant = M_difficulty2_question4;
        rc = 4'h4;
        M_state_d = INSERT_state;
      end
      INIT_SET_QNS3_state: begin
        M_difficulty3_rng = M_rng_num_q;
        M_state_d = SET_QNS30_state;
      end
      SET_QNS30_state: begin
        we = 1'h1;
        bsel = 1'h1;
        constant = M_difficulty3_question0;
        rc = 4'h0;
        M_state_d = SET_QNS31_state;
      end
      SET_QNS31_state: begin
        we = 1'h1;
        bsel = 1'h1;
        constant = M_difficulty3_question1;
        rc = 4'h1;
        M_state_d = SET_QNS32_state;
      end
      SET_QNS32_state: begin
        we = 1'h1;
        bsel = 1'h1;
        constant = M_difficulty3_question2;
        rc = 4'h2;
        M_state_d = SET_QNS33_state;
      end
      SET_QNS33_state: begin
        we = 1'h1;
        bsel = 1'h1;
        constant = M_difficulty3_question3;
        rc = 4'h3;
        M_state_d = SET_QNS34_state;
      end
      SET_QNS34_state: begin
        we = 1'h1;
        bsel = 1'h1;
        constant = M_difficulty3_question4;
        rc = 4'h4;
        M_state_d = INSERT_state;
      end
      INSERT_state: begin
        we = 1'h1;
        bsel = 1'h1;
        constant = M_ctr_out;
        rc = 4'h5;
        if (enter_switch) begin
          M_state_d = RESET_OUT_state;
        end
      end
      RESET_OUT_state: begin
        we = 1'h1;
        bsel = 1'h1;
        constant = 1'h0;
        rc = 4'h7;
        M_state_d = CHECK0_state;
      end
      CHECK0_state: begin
        ra = 4'h5;
        rb = 4'h0;
        alufn = 6'h33;
        if (alu_output) begin
          M_state_d = COMBINE0_state;
        end else begin
          M_state_d = CHECK1_state;
        end
      end
      CHECK1_state: begin
        ra = 4'h5;
        rb = 4'h1;
        alufn = 6'h33;
        if (alu_output) begin
          M_state_d = COMBINE1_state;
        end else begin
          M_state_d = CHECK2_state;
        end
      end
      CHECK2_state: begin
        ra = 4'h5;
        rb = 4'h2;
        alufn = 6'h33;
        if (alu_output) begin
          M_state_d = COMBINE2_state;
        end else begin
          M_state_d = CHECK3_state;
        end
      end
      CHECK3_state: begin
        ra = 4'h5;
        rb = 4'h3;
        alufn = 6'h33;
        if (alu_output) begin
          M_state_d = COMBINE3_state;
        end else begin
          M_state_d = CHECK4_state;
        end
      end
      CHECK4_state: begin
        ra = 4'h5;
        rb = 4'h4;
        alufn = 6'h33;
        if (alu_output) begin
          M_state_d = COMBINE4_state;
        end else begin
          M_state_d = CHECK_state;
        end
      end
      COMBINE0_state: begin
        ra = 4'h9;
        constant = 5'h01;
        we = 1'h1;
        bsel = 1'h1;
        alufn = 6'h17;
        rc = 4'h9;
        M_state_d = SET_OUT0_state;
      end
      SET_OUT0_state: begin
        we = 1'h1;
        bsel = 1'h1;
        rc = 4'h7;
        constant = 1'h1;
        M_state_d = CHECK1_state;
      end
      COMBINE1_state: begin
        ra = 4'h9;
        constant = 5'h02;
        we = 1'h1;
        bsel = 1'h1;
        alufn = 6'h17;
        rc = 4'h9;
        M_state_d = SET_OUT1_state;
      end
      SET_OUT1_state: begin
        we = 1'h1;
        bsel = 1'h1;
        rc = 4'h7;
        constant = 1'h1;
        M_state_d = CHECK2_state;
      end
      COMBINE2_state: begin
        ra = 4'h9;
        constant = 5'h04;
        we = 1'h1;
        bsel = 1'h1;
        alufn = 6'h17;
        rc = 4'h9;
        M_state_d = SET_OUT2_state;
      end
      SET_OUT2_state: begin
        we = 1'h1;
        bsel = 1'h1;
        rc = 4'h7;
        constant = 1'h1;
        M_state_d = CHECK3_state;
      end
      COMBINE3_state: begin
        ra = 4'h9;
        constant = 5'h08;
        we = 1'h1;
        bsel = 1'h1;
        alufn = 6'h17;
        rc = 4'h9;
        M_state_d = SET_OUT3_state;
      end
      SET_OUT3_state: begin
        we = 1'h1;
        bsel = 1'h1;
        rc = 4'h7;
        constant = 1'h1;
        M_state_d = CHECK4_state;
      end
      COMBINE4_state: begin
        ra = 4'h9;
        constant = 5'h10;
        we = 1'h1;
        bsel = 1'h1;
        alufn = 6'h17;
        rc = 4'h9;
        M_state_d = SET_OUT4_state;
      end
      SET_OUT4_state: begin
        we = 1'h1;
        bsel = 1'h1;
        rc = 4'h7;
        constant = 1'h1;
        M_state_d = CHECK_state;
      end
      CHECK_state: begin
        rb = 4'h7;
        if (alu_output) begin
          M_state_d = GET_DISPLAY_STATE_state;
        end else begin
          M_state_d = SUBTRACT_LIVES_state;
        end
      end
      TEMP_WIN_state: begin
        seven_seg_values = 25'h1249d14;
        constant = 2'h3;
        we = 1'h1;
        bsel = 1'h1;
        rc = 4'hb;
        if (M_normal_edge_out) begin
          M_state_d = RESET_LIVES_state;
        end
      end
      LEVEL2_state: begin
        seven_seg_values = 25'h0c2d8ac;
        seven_seg_input = 5'h1a;
        if (M_normal_edge_out) begin
          M_state_d = RESET_LIVES_state;
        end
      end
      LEVEL3_state: begin
        seven_seg_values = 25'h0c2d8ac;
        seven_seg_input = 5'h1b;
        if (M_normal_edge_out) begin
          M_state_d = RESET_LIVES_state;
        end
      end
      WIN_state: begin
        seven_seg_values = 25'h0005d2e;
        seven_seg_input = 1'h0;
        if (start_switch) begin
          M_state_d = IDLE_state;
        end
      end
      LOSE_state: begin
        seven_seg_values = 25'h0063e65;
        seven_seg_input = 1'h0;
        if (start_switch) begin
          M_state_d = IDLE_state;
        end
      end
      GET_DISPLAY_STATE_state: begin
        rb = 4'h9;
        if (alu_output == 5'h1f) begin
          M_state_d = ADD_CORRECT_COUNT_state;
        end else begin
          M_state_d = INSERT_state;
        end
      end
      ADD_CORRECT_COUNT_state: begin
        alufn = 6'h00;
        bsel = 1'h1;
        constant = 1'h1;
        we = 1'h1;
        ra = 4'h8;
        rc = 4'h8;
        M_state_d = GET_CORRECT_COUNT_state;
      end
      GET_CORRECT_COUNT_state: begin
        rb = 4'h8;
        if (alu_output == 3'h6) begin
          M_state_d = WIN_state;
        end else begin
          if (alu_output == 3'h4) begin
            M_state_d = LEVEL3_state;
          end else begin
            if (alu_output == 2'h2) begin
              M_state_d = LEVEL2_state;
            end else begin
              M_state_d = TEMP_WIN_state;
            end
          end
        end
      end
      SUBTRACT_LIVES_state: begin
        bsel = 1'h1;
        ra = 4'hb;
        constant = 1'h1;
        alufn = 6'h01;
        we = 1'h1;
        rc = 4'hb;
        M_state_d = GET_LIVES_state;
      end
      GET_LIVES_state: begin
        rb = 4'hb;
        if (alu_output == 2'h0) begin
          M_state_d = LOSE_state;
        end else begin
          M_state_d = INSERT_state;
        end
      end
    endcase
  end
  
  always @(posedge clk) begin
    if (rst == 1'b1) begin
      M_rng_num_q <= 1'h0;
      M_state_q <= 1'h0;
    end else begin
      M_rng_num_q <= M_rng_num_d;
      M_state_q <= M_state_d;
    end
  end
  
endmodule