`timescale 1ns/1ps

module testbench;

    logic clk;
    logic reset;
    logic [11:0] voltage_in;
    logic [11:0] temp_in;
    logic [11:0] current_in;
    logic alarm;
    logic [1:0] state;
    logic [7:0] can_msg;
    logic [31:0] status_word;

    bms_top uut(
        .clk(clk),
        .reset(reset),
        .voltage_in(voltage_in),
        .temp_in(temp_in),
        .current_in(current_in),
        .alarm(alarm),
        .state(state),
        .can_msg(can_msg),
        .status_word(status_word)
    );

    always #5 clk = ~clk;

    initial begin
        $dumpfile("bms.vcd");
        $dumpvars(0, testbench);

        clk = 0;
        reset = 1;
        voltage_in = 12'd3600;
        temp_in = 12'd25;
        current_in = 12'd100;

        #10 reset = 0;

        #20;
        $display("State=%b Alarm=%b CAN=%h Status=%h", state, alarm, can_msg, status_word);

        voltage_in = 12'd2000;
        #20;
        $display("State=%b Alarm=%b CAN=%h Status=%h", state, alarm, can_msg, status_word);

        voltage_in = 12'd3600;
        temp_in = 12'd80;
        #20;
        $display("State=%b Alarm=%b CAN=%h Status=%h", state, alarm, can_msg, status_word);

        temp_in = 12'd25;
        current_in = 12'd300;
        #20;
        $display("State=%b Alarm=%b CAN=%h Status=%h", state, alarm, can_msg, status_word);

        current_in = 12'd100;
        #20;
        $display("State=%b Alarm=%b CAN=%h Status=%h", state, alarm, can_msg, status_word);

        #50 $finish;
    end

endmodule
