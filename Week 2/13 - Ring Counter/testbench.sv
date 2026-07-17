`timescale 1ns/1ps

module tb_ring_counter;

logic clock;
logic reset;
logic [3:0] q;

ring_counter dut (
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
    $dumpfile("ring_counter.vcd");
    $dumpvars(0, tb_ring_counter);
end

endmodule 