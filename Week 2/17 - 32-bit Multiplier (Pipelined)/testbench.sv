`timescale 1ns/1ps

module tb_pipelined_multiplier;

logic clock;
logic reset;
logic [31:0] a;
logic [31:0] b;
logic [63:0] product;

pipelined_multiplier dut(
    .clock(clock),
    .reset(reset),
    .a(a),
    .b(b),
    .product(product)
);

always #5 clock = ~clock;

initial begin
    clock = 0;
    reset = 1;
    a = 0;
    b = 0;

    #10;
    reset = 0;

    a = 10;    b = 5;
    #10;

    a = 20;    b = 3;
    #10;

    a = 15;    b = 8;
    #10;

    a = 100;   b = 25;
    #10;
  
    a = 50;    b = 12;
    #20;

    $finish;
end

initial begin
    $dumpfile("pipelined_multiplier.vcd");
    $dumpvars(0, tb_pipelined_multiplier);
end

endmodule