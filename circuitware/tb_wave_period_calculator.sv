`timescale 1ns/1ps

module tb_wave_period_calculator;

    real CLK_PERIOD = 1000.0 / 3.028;

    logic clk;
    logic rst;
    logic key1;
    logic key2;
    logic key3;
    logic key4;
    logic key5;
    logic key6;
    logic key7;
    logic key8;
    logic key9;
    logic key10;
    logic key11;
    logic key12;
    logic [9:0] halfPeriodTotal;

    wave_period_calculator uut
    (
        .clk(clk),
        .rst(rst),
        .key1(key1),
        .key2(key2),
        .key3(key3),
        .key4(key4),
        .key5(key5),
        .key6(key6),
        .key7(key7),
        .key8(key8),
        .key9(key9),
        .key10(key10),
        .key11(key11),
        .key12(key12),
        .halfPeriodTotal(halfPeriodTotal)
    );

    initial begin
        key1 = 0;
        key2 = 0;
        key3 = 0;
        key4 = 0;
        key5 = 0;
        key6 = 0;
        key7 = 0;
        key8 = 0;
        key9 = 0;
        key10 = 0;
        key11 = 0;
        key12 = 0;
        clk = 0;
        forever #CLK_PERIOD clk = ~clk;
    end

    initial begin
        rst = 0;
        @(posedge clk);
        @(negedge clk);
        rst = 1;
        #CLK_PERIOD;
        rst = 0;
        #CLK_PERIOD;

        key1 = 1;
        #CLK_PERIOD;
        $display("half period = %d", halfPeriodTotal);
        #CLK_PERIOD;
        $display("half period = %d", halfPeriodTotal);
        #CLK_PERIOD;
        $display("half period = %d", halfPeriodTotal);
        #CLK_PERIOD;
        $display("half period = %d", halfPeriodTotal);
        #CLK_PERIOD;
        $display("half period = %d", halfPeriodTotal);
        #CLK_PERIOD;
        $display("half period = %d", halfPeriodTotal);
        #CLK_PERIOD;
        $display("half period = %d", halfPeriodTotal);
        #CLK_PERIOD;
        $display("half period = %d", halfPeriodTotal);
        #CLK_PERIOD;
        $display("half period = %d", halfPeriodTotal);
        #CLK_PERIOD;
        $display("half period = %d", halfPeriodTotal);
        #CLK_PERIOD;
        $display("half period = %d", halfPeriodTotal);
        #CLK_PERIOD;
        $display("half period = %d", halfPeriodTotal);

        $finish
    end

endmodule