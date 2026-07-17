`timescale 1ns/1ps

module tb_traffic_light_fsm;

  logic clk;
  logic rst_n;
  logic red;
  logic yellow;
  logic green;

  traffic_light_fsm dut (
    .clk(clk),
    .rst_n(rst_n),
    .red(red),
    .yellow(yellow),
    .green(green)
  );

  always begin
    #5 clk = ~clk;
  end

  initial begin
    clk = 0;
    rst_n = 0; 

    #15 rst_n = 1;

    #80;

    rst_n = 0;
    #10;
    rst_n = 1;
    #30;
    
    $finish;
  end

initial begin
    $dumpfile("traffic_light_tb.vcd"); 
    $dumpvars(0, tb_traffic_light_fsm); 
  end

endmodule