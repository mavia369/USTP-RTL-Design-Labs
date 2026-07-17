module tb_d_flipflop;

logic clock, reset, d;
logic q;

d_flipflop dut(
  .clock(clock),
  .reset(reset),
  .d(d), 
  .q(q)
);

always #5 clock = ~clock;

initial begin
    clock = 0;
    reset = 1;
    d = 0;

    #10;
    reset = 0;

    #10 d = 1;
    #10 d = 0;
    #10 d = 1;
    #10 d = 0;

    #10;
    $finish;
end

initial begin
  $dumpfile("d_flipflop.vcd");
  $dumpvars(0,tb_d_flipflop);
end
  
endmodule