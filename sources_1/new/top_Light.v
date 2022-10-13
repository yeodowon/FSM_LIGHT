`timescale 1ns / 1ps

module top_Light(
    input i_clk,
    input i_reset,
    input [1:0] i_button,
    output [1:0] o_light
 );

     wire [1:0] w_button;

    Button_Controller btn_ct1(
    .i_clk(i_clk),
    .i_button(i_button[0]),
    .i_reset(i_reset),
    .o_button(w_button[0])
    );

    Button_Controller btn_ct2(
    .i_clk(i_clk),
    .i_button(i_button[1]),
    .i_reset(i_reset),
    .o_button(w_button[1])
    );
   

    FSM_Light fsm(
    .i_clk(i_clk),
    .i_reset(i_reset),
    .i_button(w_button),
    .o_light(o_light)
    );
endmodule
