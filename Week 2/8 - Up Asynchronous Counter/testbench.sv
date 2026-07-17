`timescale 1ns/1ps

module tb_async_up_counter;

reg clock;
reg reset;
wire [3:0] count;

async_up_counter uut (
  .clock(clock),
  .reset(reset),
  .count(count)
);

always #5 clock = ~clock;

initial begin
    clock = 0;
    reset = 1;

    #10 reset = 0;

    #200;

    $finish;
end

initial begin
  $dumpfile("async_up_counter.vcd");
  $dumpvars(0, tb_async_up_counter);
end

endmodule