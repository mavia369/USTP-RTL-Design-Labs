`timescale 1ns/1ps

module tb_fifo_8bit;

  logic       clk;
  logic       rst_n;
  logic       wr_en;
  logic       rd_en;
  logic [7:0] data_in;
  logic [7:0] data_out;
  logic       full;
  logic       empty;

  fifo_8bit dut (
    .clk(clk),
    .rst_n(rst_n),
    .wr_en(wr_en),
    .rd_en(rd_en),
    .data_in(data_in),
    .data_out(data_out),
    .full(full),
    .empty(empty)
  );

  always #5 clk = ~clk;

  initial begin
    clk = 0;
    rst_n = 0;
    wr_en = 0;
    rd_en = 0;
    data_in = 8'h0;

    #15 rst_n = 1; 
    #5;

    write_data(8'hA1);
    write_data(8'hB2);
    write_data(8'hC3);
    #10;

    read_data();
    read_data();
    read_data();
    #10;

    for (int i = 1; i <= 8; i++) begin
      write_data(i); 
    end
    #10;
    
    write_data(8'hFF);
    #10;

    for (int i = 1; i <= 8; i++) begin
      read_data();
    end
    #10;

    read_data(); 
    #10;

    @(posedge clk);
    wr_en = 1;
    rd_en = 1;
    data_in = 8'h55; 
    #10;
    wr_en = 0;
    rd_en = 0;
    #10;

    $finish;
  end

  task write_data(input logic [7:0] val);
    @(posedge clk);
    if (!full) begin
      wr_en = 1;
      data_in = val;
    end else begin
    end
    #1; 
    wr_en = 0;
  endtask

  task read_data();
    @(posedge clk);
    if (!empty) begin
      rd_en = 1;
      #1; 
    end else begin
    end
    rd_en = 0;
  endtask

  initial begin
    $dumpfile("fifo_8bit_tb.vcd");
    $dumpvars(0, tb_fifo_8bit);
  end

endmodule