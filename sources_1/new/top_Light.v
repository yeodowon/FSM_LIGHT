`timescale 1ns / 1ps

module top_Light(
    input i_clk,
    input i_reset,
    input i_button,
    output [1:0] o_light
 );

     wire w_button;

    Button_Controller btn_ct(
    .i_clk(i_clk),
    .i_button(i_button),
    .i_reset(i_reset),
    .o_button(w_button)
    );
   

    FSM_Light fsm(
    .i_clk(i_clk),
    .i_reset(i_reset),
    .i_button(w_button),
    .o_light(o_light)
    );
endmodule
