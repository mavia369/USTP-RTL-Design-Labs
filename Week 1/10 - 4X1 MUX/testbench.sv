`timescale 1ns/1ps

module tb_mux4to1;

  logic [3:0] i;
  logic [1:0] sel;
  logic       out;

  mux4to1 dut (
    .i(i),
    .sel(sel),
    .out(out)
  );

  initial begin
    $dumpfile("mux4to1_tb.vcd");   
    $dumpvars(0, tb_mux4to1);     

    i = 4'b0001; sel = 2'b00; #5;
    i = 4'b0010; sel = 2'b01; #5;
    i = 4'b0100; sel = 2'b10; #5;
    i = 4'b1000; sel = 2'b11; #5;
    $finish;
  end

endmodule