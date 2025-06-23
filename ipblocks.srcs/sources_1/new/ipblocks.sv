`timescale 1ns / 1ps

module ipblocks(
    input rst,
    input clk_p, 
    input clk_n,
    input sw_btn,
    input left_btn,
    input right_btn,
    output logic [7:0] led
    );
    
    wire clk;
    IBUFDS clk_buf (.I(clk_p), .IB(clk_n), .O(clk));  // �������������� � single-ended
    
    // Переменные делителя светодиодов
    reg [31:0] led_clk_cnt = 0;
    reg [2:0] led_div_idx = 0;
    reg led_clk = 0;
    
    logic sw_btn_state, sw_btn_prev;
    logic right_btn_state, right_btn_prev;
    logic left_btn_state, left_btn_prev;

    debouncer_0 sw_btn_deb(
        .clk(clk),
        .rst(rst),
        .btn_in(sw_btn),
        .btn_out(sw_btn_state)
    );

    debouncer_0 right_btn_deb(
        .clk(clk),
        .rst(rst),
        .btn_in(right_btn),
        .btn_out(right_btn_state)
    );

    debouncer_0 left_btn_deb(
        .clk(clk),
        .rst(rst),
        .btn_in(left_btn),
        .btn_out(left_btn_state)
    );

    localparam DIRECTION_LEFT = 2'b10;
    localparam DIRECTION_RIGHT = 2'b01;

    // Направление "бегущего огня"
    logic [1:0] direction;

    // Выбор коэффициента деления в зависимости от DIP-переключателей
    localparam [31:0] MAX_COUNT [0:5] = '{
        32'd999999,   // 100 Гц
        32'd1999999,  // 50 Гц
        32'd3999999,  // 25 Гц
        32'd9999999,  // 10 Гц
        32'd19999999, // 5 Гц
        32'd49999999  // 2 Гц
    };
    
    // Обработка кнопки SW с антидребезгом
    always @(posedge clk or posedge rst) begin
        if (rst) begin
            led_div_idx <= 0;
            sw_btn_prev <= 0;
            left_btn_prev <= 0;
            right_btn_prev <= 0;
            direction <= DIRECTION_LEFT;
        end else begin

            // Обработка нажатия кнопки SW
            if (sw_btn_state && ~sw_btn_prev) begin
                led_div_idx <= (led_div_idx == 5) ? 0 : led_div_idx + 1;
            end
            sw_btn_prev <= sw_btn_state;

            if (left_btn_state && ~left_btn_prev) begin
                direction <= DIRECTION_LEFT;
            end
            left_btn_prev <= left_btn_state;

            if (right_btn_state && ~right_btn_prev) begin
                direction <= DIRECTION_RIGHT;
            end
            right_btn_prev <= right_btn_state;

        end
    end
    
    // Делитель частоты (изменяемый) для светодиодов
    always @(posedge clk or posedge rst) begin
        if (rst) begin
            led_clk_cnt <= 0;
            led_clk <= 0;
        end else begin
            if (led_clk_cnt >= MAX_COUNT[led_div_idx]) begin
                led_clk_cnt <= 0;
                led_clk <= ~led_clk;
            end else begin
                led_clk_cnt <= led_clk_cnt + 1;
            end
        end
    end
    
    // Обработка бегущего огня
    always @(posedge led_clk or posedge rst) begin
        if (rst) begin
            led <= 1;
        end else begin 
            // Бегущий огонёк
            if (direction == DIRECTION_LEFT) begin
                led <= (led >= 8'h80) ? 8'h01 : (led << 1);
            end
            else if (direction == DIRECTION_RIGHT) begin
                led <= (led <= 8'h01) ? 8'h80 : (led >> 1);
            end else begin
                led <= (led == 0) ? 8'hFF : 0;
            end
        end
    end
    
endmodule
