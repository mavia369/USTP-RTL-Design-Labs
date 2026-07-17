`timescale 1ns/1ps

module tb_seq_detector_1101_moore;

    logic clk;
    logic rst_n;
    logic din;
    logic dout;

    seq_detector_1101_moore dut (
        .clk   (clk),
        .rst_n (rst_n),
        .din   (din),
        .dout  (dout)
    );

    always #10 clk = ~clk;

    task send_bit(input logic bit_in);
        begin
            din = bit_in;
            @(posedge clk);
            #1; 
        end
    endtask

    initial begin
        clk   = 0;
        rst_n = 0;
        din   = 0;

        #40;
        rst_n = 1;
        @(posedge clk);

     
        send_bit(1);
        send_bit(1); 
        send_bit(0); 
        send_bit(1); 

        send_bit(0);

        send_bit(1); 
        send_bit(1); 
        send_bit(0); 
        send_bit(1); 
        send_bit(1); 
        send_bit(0); 
        send_bit(1); 

        send_bit(1); 
        send_bit(1); 
        send_bit(0); 
        send_bit(1); 
        send_bit(1); 
        send_bit(1); 
        send_bit(0); 
        send_bit(1);
        send_bit(0);

        #40;
        $finish;
    end
   
  initial begin
        $dumpfile("dump.vcd"); 
        $dumpvars(0, tb_seq_detector_1101_moore);
  end

endmodule