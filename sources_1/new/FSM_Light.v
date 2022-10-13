`timescale 1ns / 1ps

module FSM_Light(
    input i_clk,
    input i_reset,
    input [1:0] i_OnOffSW,
    input i_button,
    output [1:0] o_light
    );

    parameter S_LED_00 = 2'b00,  // c언어에서 enum 역할, 상태 정의
              S_LED_01 = 2'b01,
              S_LED_10 = 2'b10,
              S_LED_11 = 2'b11;

    reg [1:0]curState, nextState;
    reg [1:0]r_light;

    assign o_light = r_light;

//상태 변경 적용
    always @(posedge i_clk or posedge i_reset) begin
        if (i_reset) curState <= S_LED_00;
        else         curState <= nextState;
    end

//이벤트 처리 부분

    always @(curState or i_button) begin
        case (curState)
            S_LED_00 : begin
                if (i_button) nextState <= S_LED_01;
                else          nextState <= S_LED_00; // 조건문이 완성되지 않으면 원치 않는 조건문이 발생한다.
            end
            S_LED_01  : begin
                if (i_button) nextState <= S_LED_10;
                else          nextState <= S_LED_01;
            end
             S_LED_10  : begin
                if (i_button) nextState <= S_LED_11;
                else          nextState <= S_LED_10;
            end
             S_LED_11  : begin
                if (i_button) nextState <= S_LED_00;
                else          nextState <= S_LED_11;
            end
           
        endcase
    end

//상태에 따른 동작 부분
    always @(curState) begin
        r_light <= 2'bxx; // bxx 플로팅 상태
        case (curState)
            S_LED_00 : r_light <= 2'b00;
            S_LED_01 : r_light <= 2'b01;
            S_LED_10 : r_light <= 2'b10;  
        endcase
    end

endmodule
