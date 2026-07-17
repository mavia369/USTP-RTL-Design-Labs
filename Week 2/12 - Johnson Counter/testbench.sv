`timescale 1ns/1ps

module tb_johnson_counter;

logic clock;
logic reset;
logic [3:0] q;

johnson_counter dut (
  .clock(clock),
  .reset(reset),
    .q(q)
);

initial begin
    clock = 0;
    forever #5 clock = ~clock;
end

initial begin
    reset = 1;

    #12;
    reset = 0;

    #100;

    $finish;
end

initial begin
    $dumpfile("johnson_counter.vcd");
    $dumpvars(0, tb_johnson_counter);
end

endmodule